<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Page extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Page_model'); // Modeli yükle

    }

    public function index() {
        $sayfalar = $this->Page_model->getAll([], 'sayfalar');  // tüm ürünleri getir
        $viewData = array(
            'setting' => $this->Page_model->get(['id' => 1], 'ayarlar'),
            'sayfalar' => $sayfalar
        );
        $this->load->view('page_view', $viewData);
    }

    
    
    public function Delete($id) {
        $this->load->model('Page_model');
    
        $delete = $this->Page_model->Delete($id);
    
        if ($delete) {
            redirect(base_url('page'));
        } else {
            echo 'Silme işlemi başarısız.';
        }
    }

    // Sayfa güncelleme sayfası
   // Page.php controller

public function pageupdate($sayfaid) {
    // Veritabanından ilgili sayfa bilgilerini al
    $data['page'] = $this->Page_model->get(['sayfaid' => $sayfaid], 'sayfalar');

    if (!$data['page']) {
        show_error('Güncellemek istediğiniz sayfa bulunamadı.');
        return;
    }

    // Güncelleme sayfasını yükle
    $this->load->view('page_update_view', $data);
}

public function updatePageData() {
    if ($this->input->method() == "post") {
        $this->load->library('form_validation');

        // Form doğrulama kuralları
        $this->form_validation->set_rules('sayfaadi', 'Sayfa Adı', 'trim|required');
        $this->form_validation->set_rules('sayfasef', 'Sayfa Sef', 'trim|required');
        $this->form_validation->set_rules('sayfaicerik', 'Sayfa İçeriği', 'trim|required');
        $this->form_validation->set_rules('sayfadurum', 'Sayfa Durum', 'trim|required');

        if ($this->form_validation->run() === FALSE) {
            $error = array(
                'title' => 'Hata',
                'text' => validation_errors(),
                'icon' => 'error'
            );
            echo json_encode($error);
            return;
        }

        $sayfaid = $this->input->post('sayfaid');
        $pagedata = array(
            'sayfaadi'        => $this->input->post('sayfaadi'),
            'sayfasef'        => $this->input->post('sayfasef'),
            'sayfaicerik'     => $this->input->post('sayfaicerik'),
            'sayfadurum'      => $this->input->post('sayfadurum'),
        );

        $update = $this->Page_model->update(['sayfaid' => $sayfaid], $pagedata, 'sayfalar');

        if ($update) {
            $success = array(
                'title' => 'Başarılı',
                'text' => 'Sayfa başarıyla güncellendi.',
                'icon' => 'success'
            );
            echo json_encode($success);
        } else {
            $error = array(
                'title' => 'Hata',
                'text' => 'Sayfa güncellenirken bir hata oluştu.',
                'icon' => 'error'
            );
            echo json_encode($error);
        }
    }
}
}