<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Order extends CI_Controller{
 
public function __construct(){
parent::__construct();

##session kontrolü
$this->load->helper('usersession');
userchecksession();
}

public function index($par){

    if(!$par){
        redirect(base_url());
    }

    $query = $this->Common_model->get(['urun_kodu'=>$par,'urun_durum'=>1],'urunler');
    if($query){

        $viewData = array(
            'product'      => $query,
            'setting'      => $this->Common_model->get(['id'=>1],'ayarlar'),
            'social'       => $this->Common_model->getAll(['sosdurum'=>1],'sosyalmedyalar'),
            'pages'        => $this->Common_model->getAll(['sayfadurum'=>1],'sayfalar'),
            'popular'      => $this->Common_model->getLimitAll(['urun_durum'=>1],8,0,'urunler','urun_goruntulenme','DESC'),
            'popblog'      => $this->Common_model->getLimitAll(['blogdurum'=>1],4,0,'blog','bloggoruntulenme','DESC'),
        );

        $this->load->view('default/order_view',$viewData);

    }else{
        redirect(base_url());  
    }
}

public function completedata() {
    error_reporting(E_ALL);
    ini_set('display_errors', 1);

    if ($this->input->method() == "post") {
        $pcode   = strip_tags(trim($this->input->post('pcode', true)));
        $payment = strip_tags(trim($this->input->post('payment', true)));
        $onote   = strip_tags(trim($this->input->post('note', true)));
        $setting = $this->Common_model->get(['id' => 1], 'ayarlar');
        $orderno = uniqid();

        if (!$pcode || !$payment) {
            echo json_encode([
                'title' => 'Hata oluştu',
                'text'  => 'Lütfen boş alan bırakmayınız.',
                'icon'  => 'error',
                'link'  => '#'
            ]);
            return;
        }

        $pquery = $this->Common_model->get(['urun_kodu' => $pcode, 'urun_durum' => 1], 'urunler');
        if ($pquery) {
            $pdownload = $pquery->urun_indirmelink ?? '';
            $data = [
                'sipno'         => $orderno,
                'sipuye'        => ss('usercode'),
                'sipurun'       => $pquery->urun_kodu,
                'siptutar'      => $pquery->urun_fiyat,
                'siptarihs'     => date('Y-m-d'),
                'sipmusterinot' => $onote,
                'sipdurum'      => 'beklemede',
                'sipodemekodu'  => $payment,
                'siparissonrasi'=> $pdownload
            ];

            $add = $this->Common_model->add('siparisler', $data);
            if ($add) {
                if ($setting->mailbildirim == 1) {
                    $smtpinfo = $this->Common_model->get(['smtp_id' => $setting->site_gecerli_smtp, 'smtp_durum' => 1], 'smtpbilgileri');
                    if ($smtpinfo) {
                        $this->load->helper(['class.smtp', 'class.phpmailer']);
                        $mail = new PHPMailer();
                        $mail->isSMTP();
                        $mail->Host        = $smtpinfo->smtp_host;
                        $mail->Port        = $smtpinfo->smtp_port;
                        $mail->SMTPSecure  = $smtpinfo->smtp_sec;
                        $mail->SMTPAuth    = true;
                        $mail->Username    = $smtpinfo->smtp_mail;
                        $mail->Password    = $smtpinfo->smtp_sifre;
                        $mail->setFrom($smtpinfo->smtp_mail, $setting->site_baslik);
                        $mail->addAddress(ss('usermail'), $setting->site_baslik);
                        $mail->CharSet  = 'UTF-8';
                        $mail->Subject  = $orderno . ' Nolu Sipariş Oluşturuldu - ' . $setting->site_baslik;

                        $content = "
                            <h3>Yeni sipariş</h3>
                            <p>{$orderno} sipariş numarası ile yeni siparişiniz oluşturuldu, en kısa sürede teslimatı sağlanacaktır.</p>
                            <hr />
                            <h5>Sipariş Detayı</h5>
                            <p><b>Sipariş Tutarı:</b> {$pquery->urun_fiyat} TL</p>
                            <p><b>Sipariş Numarası:</b> {$orderno}</p>
                            <p><b>Ürün Adı:</b> {$pquery->urun_adi}</p>
                            <hr />
                            <p>Bizi tercih ettiğiniz için teşekkür ederiz.</p>
                        ";
                        $mail->MsgHTML($content);
                        $mail->send();
                    } else {
                        log_message('error', 'SMTP bilgileri bulunamadı.');
                    }
                }

                $redirectLink = $payment == 'eft' 
                    ? base_url('successpage') 
                    : base_url('creditcard/' . $setting->site_gecerli_pos . '/' . $orderno);

                echo json_encode([
                    'title' => 'Başarılı',
                    'text'  => 'Siparişiniz oluşturuldu, yönlendiriliyorsunuz...',
                    'icon'  => 'success',
                    'link'  => $redirectLink
                ]);
            } else {
                echo json_encode([
                    'title' => 'Hata oluştu',
                    'text'  => 'Sipariş esnasında hata oluştu.',
                    'icon'  => 'error',
                    'link'  => base_url('errorpage')
                ]);
            }
        } else {
            echo json_encode([
                'title' => 'Hata oluştu',
                'text'  => 'Ürün seçilmedi.',
                'icon'  => 'error',
                'link'  => base_url('errorpage')
            ]);
        }
    }
}

public function success(){

$viewData = array(
    'setting'      => $this->Common_model->get(['id'=>1],'ayarlar'),
    'social'       => $this->Common_model->getAll(['sosdurum'=>1],'sosyalmedyalar'),
    'pages'        => $this->Common_model->getAll(['sayfadurum'=>1],'sayfalar'),
    'popular'      => $this->Common_model->getLimitAll(['urun_durum'=>1],8,0,'urunler','urun_goruntulenme','DESC'),
    'popblog'      => $this->Common_model->getLimitAll(['blogdurum'=>1],4,0,'blog','bloggoruntulenme','DESC'),
    'banks'        => $this->Common_model->getAll(['bankadurum'=>1],'bankalar')
);

$this->load->view('default/success_view',$viewData);


}

public function error(){

$viewData = array(
    'setting'      => $this->Common_model->get(['id'=>1],'ayarlar'),
    'social'       => $this->Common_model->getAll(['sosdurum'=>1],'sosyalmedyalar'),
    'pages'        => $this->Common_model->getAll(['sayfadurum'=>1],'sayfalar'),
    'popular'      => $this->Common_model->getLimitAll(['urun_durum'=>1],8,0,'urunler','urun_goruntulenme','DESC'),
    'popblog'      => $this->Common_model->getLimitAll(['blogdurum'=>1],4,0,'blog','bloggoruntulenme','DESC'),
);

$this->load->view('default/error_view',$viewData);


}

}

?>