<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pages extends CI_Controller{

    public function search(){
        echo "1";
    }

    public function contact(){
        $viewData = array(
            "setting"      => $this->Common_model->get(['id'=>1],'ayarlar'),
            'social'       => $this->Common_model->getAll(['sosdurum'=>1],'sosyalmedyalar'),
			'pages'        => $this->Common_model->getAll(['sayfadurum'=>1],'sayfalar'),
			'popular'      => $this->Common_model->getLimitAll(['urun_durum'=>1],8,0,'urunler','urun_goruntulenme','DESC'),
			'popblog'      => $this->Common_model->getLimitAll(['blogdurum'=>1],4,0,'blog','bloggoruntulenme','DESC'),
        );
  
        $this->load->view('default/contact_view',$viewData);
    }

    public function detail($id){
        
        if(!$id){
            redirect(base_url());
        }

        $query = $this->Common_model->get(['sayfasef'=>$id,'sayfadurum'=>1],'sayfalar');
        if($query){

            $viewData = array(
                "page"         => $query,
                "setting"      => $this->Common_model->get(['id'=>1],'ayarlar'),

                'social'       => $this->Common_model->getAll(['sosdurum'=>1],'sosyalmedyalar'),
                'pages'        => $this->Common_model->getAll(['sayfadurum'=>1],'sayfalar'),
                'popular'      => $this->Common_model->getLimitAll(['urun_durum'=>1],8,0,'urunler','urun_goruntulenme','DESC'),
                'popblog'      => $this->Common_model->getLimitAll(['blogdurum'=>1],4,0,'blog','bloggoruntulenme','DESC'),
            );

            $this->load->view('default/pagedetail_view',$viewData);

        }else{
            redirect(base_url()); 
        }

    }

    public function sendmessage(){
        if($this->input->method() == "post"){
            $this->load->library('form_validation');
            $this->form_validation->set_rules('name', 'Adınız', 'trim|required');
            $this->form_validation->set_rules('email', 'E-posta', 'trim|required|valid_email');
            $this->form_validation->set_rules('subject', 'Konu', 'trim');
            $this->form_validation->set_rules('message', 'Mesajınız', 'trim|required');
    
            if ($this->form_validation->run() === FALSE) {
                $error = array(
                    'title' => 'Hata oluştu',
                    'text'  => 'Boş alan bıraktınız ya da hatalı e-posta adresi girdiniz...',
                    'icon'  => 'error'
                );
            } else {
                $kul_adi = "alican";
                $sifre = "Ojqdb6xVsfCweOEc";
                $adres = "cluster0.hehabxu.mongodb.net";
                $veritabani = "dijitalurun";
                $koleksiyon_adi = 'iletisim';
    
                $client = new MongoDB\Client("mongodb+srv://$kul_adi:$sifre@$adres");
                $koleksiyon = $client->selectCollection($veritabani, $koleksiyon_adi);
    
                $data = array(
                    "mesajisim"   => $this->input->post('name', true),
                    "mesajkonu"   => $this->input->post('subject', true),
                    "mesajmail"   => $this->input->post('email', true),
                    "mesajicerik" => $this->input->post('message', true),
                    "mesajip"     => $this->input->ip_address(),
                );
    
                $insertResult = $koleksiyon->insertOne($data);
    
                if($insertResult->getInsertedCount() > 0){
                    $error = array(
                        'title' => 'Başarılı',
                        'text'  => 'Mesajınız başarıyla gönderildi.',
                        'icon'  => 'success'
                    );
                } else {
                    $error = array(
                        'title' => 'Hata oluştu',
                        'text'  => 'Sistem hatası oluştu...',
                        'icon'  => 'error'
                    );
                }
            }
    
            echo json_encode($error);
        }
    }
    

    public function test($ornek)
{
    $kul_adi = "alican";
    $sifre = "Ojqdb6xVsfCweOEc";
    $adres = "cluster0.hehabxu.mongodb.net";
    $veritabani = "dijitalurun";

    switch ($ornek) {
        case 1: // Tek veri sorgulama
            $koleksiyon_adi = 'iletisim';
            $client = new MongoDB\Client("mongodb+srv://$kul_adi:$sifre@$adres");

            $koleksiyon = $client->selectCollection($veritabani, $koleksiyon_adi);
            $document = $koleksiyon->findOne(['id' => 1]);

            if ($document) {
                foreach ($document as $key => $value) {
                    echo $key . ' -> ' . $value . '<br>';
                }
            } else {
                echo "Veri bulunamadı.";
            }
            break;

        case 2: // Çoklu veri sorgulama
            $koleksiyon_adi = 'iletisim';
            $client = new MongoDB\Client("mongodb+srv://$kul_adi:$sifre@$adres");

            $koleksiyon = $client->selectCollection($veritabani, $koleksiyon_adi);
            $documents = $koleksiyon->find(['id' => 1]);

            if ($documents) {
                foreach ($documents as $doc) {
                    foreach ($doc as $key => $value) {
                        echo $key . ' -> ' . $value . '<br>';
                    }
                    echo '<hr>';
                }
            } else {
                echo "Veri bulunamadı.";
            }
            break;

        case 3: // Koleksiyondaki toplam veri miktarı
            $koleksiyon_adi = 'iletisim';
            $client = new MongoDB\Client("mongodb+srv://$kul_adi:$sifre@$adres");

            $koleksiyon = $client->selectCollection($veritabani, $koleksiyon_adi);
            $toplam = $koleksiyon->countDocuments(['id' => 1]);

            echo $toplam;
            break;

        // Diğer durumlar için de benzer şekilde güncellemeler yapılabilir
    }
}

}


