<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Users extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Users_model'); // Modeli yükle

    }

    public function index() {
        $uyeler = $this->Users_model->getAll([], 'uyeler');  // tüm ürünleri getir
        $viewData = array(
            'setting' => $this->Users_model->get(['id' => 1], 'ayarlar'),
            'uyeler' => $uyeler
        );
        $this->load->view('users_view', $viewData);
    }

   
    public function Delete($id) {
        $this->load->model('Users_model');
    
        $delete = $this->Users_model->Delete($id);
    
        if ($delete) {
            redirect(base_url('users'));
        } else {
            echo 'Silme işlemi başarısız.';
        }
    }

    
        // Üye güncelleme sayfası
        public function update($uye_kodu) {
            // Veritabanından ilgili üyeyi al
            $data['uye'] = $this->Users_model->get(['uye_kodu' => $uye_kodu], 'uyeler');
        
            if (!$data['uye']) {
                show_error('Güncellemek istediğiniz üye bulunamadı.');
                return;
            }
        
            // Güncelleme sayfasını yükle
            $this->load->view('uye_update_view', $data);
        }
    // // Üye güncelleme sayfası
public function userupdate($uye_id) {
    // Veritabanından ilgili üyeyi al
    $data['uye'] = $this->Users_model->get(['uye_id' => $uye_id], 'uyeler');

    if (!$data['uye']) {
        show_error('Güncellemek istediğiniz üye bulunamadı.');
        return;
    }

    // Güncelleme sayfasını yükle
    $this->load->view('users_update_view', $data);
}

// Üye güncelleme işlemi
public function updateUserStatus() {
    if ($this->input->method() == "post") {
        $this->load->library('form_validation');

        // Form doğrulama kuralları
        $this->form_validation->set_rules('uye_durum', 'Üye Durumu', 'required|in_list[0,1]'); // Sadece durum değişecek

        if ($this->form_validation->run() === FALSE) {
            $error = array(
                'title' => 'Hata',
                'text' => validation_errors(),
                'icon' => 'error'
            );
            echo json_encode($error);
            return;
        }

        $uye_id = $this->input->post('uye_id');
        $updateData = array(
            'uye_durum' => $this->input->post('uye_durum')
        );

        $update = $this->Users_model->update(['uye_id' => $uye_id], $updateData, 'uyeler');

        if ($update) {
            $success = array(
                'title' => 'Başarılı',
                'text' => 'Üye durumu başarıyla güncellendi.',
                'icon' => 'success'
            );
            echo json_encode($success);
        } else {
            $error = array(
                'title' => 'Hata',
                'text' => 'Üye güncellenirken bir hata oluştu.',
                'icon' => 'error'
            );
            echo json_encode($error);
        }
    }
}

}