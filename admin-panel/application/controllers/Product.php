<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Product extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $urunler = $this->Common_model->getAll([], 'urunler');  // tüm ürünleri getir
        $viewData = array(
            'setting' => $this->Common_model->get(['id' => 1], 'ayarlar'),
            'urunler' => $urunler
        );
        $this->load->view('urun_view', $viewData);
    }

    public function addproduct() {
        $urunler = $this->Common_model->getAll([], 'urunler');  // tüm ürünleri getir
        $viewData = array(
            'setting' => $this->Common_model->get(['id' => 1], 'ayarlar'),
            'urunler' => $urunler
        );
        $this->load->view('urun_ekle_view', $viewData);
    }
    
    public function addproductdata() {
        if ($this->input->method() == "post") {
            $this->load->library('form_validation');

            $this->form_validation->set_rules('urun_adi', 'Ürün Adı', 'trim|required');
            $this->form_validation->set_rules('urun_sef', 'Ürün Türü', 'trim|required');
            $this->form_validation->set_rules('urun_fiyat', 'Ürün Fiyatı', 'trim|required');
            $this->form_validation->set_rules('urun_stok', 'Ürün Stok', 'trim|required');
            $this->form_validation->set_rules('urun_kdv', 'Ürün KDV', 'trim|required');
            $this->form_validation->set_rules('urun_kodu', 'Ürün Kodu', 'trim|required');
            $this->form_validation->set_rules('urun_kategori', 'Ürün Kategori', 'trim|required');
            $this->form_validation->set_rules('urun_durum', 'Ürün Yayınlama', 'trim|required');
            $this->form_validation->set_rules('urun_kisa', 'Kısa Ürün Açıklaması', 'trim|required');
            $this->form_validation->set_rules('urun_icerik', 'Ürün Açıklaması', 'trim|required');
            $this->form_validation->set_rules('urun_vitrin', 'Ürün Vitrin', 'trim|required');

            if ($this->form_validation->run() === FALSE) {
                $error = array(
                    'title' => 'Hata',
                    'text'  => validation_errors(),
                    'icon'  => 'error'
                );
            } else {
                $allready = $this->Common_model->getcount(['urun_adi' => strip_tags($this->input->post('urun_adi', true))], 'urunler');
                if ($allready > 0) {
                    $error = array(
                        'title' => 'Hata',
                        'text'  => 'Bu ürün zaten mevcut...',
                        'icon'  => 'error'
                    );
                } else {
                    $productdata = array(
                        'urun_adi'        => $this->input->post('urun_adi'),
                        'urun_sef'        => $this->input->post('urun_sef'),
                        'urun_fiyat'      => $this->input->post('urun_fiyat'),
                        'urun_stok'       => $this->input->post('urun_stok'),
                        'urun_kdv'        => $this->input->post('urun_kdv'),
                        'urun_kodu'       => $this->input->post('urun_kodu'),
                        'urun_kategori'   => $this->input->post('urun_kategori'),
                        'urun_durum'      => $this->input->post('urun_durum'),
                        'urun_kisa'       => $this->input->post('urun_kisa'),
                        'urun_icerik'     => $this->input->post('urun_icerik'),
                        'urun_vitrin'     => $this->input->post('urun_vitrin')
                    );

                    $add = $this->Common_model->add('urunler', $productdata);
                    if ($add) {
                        $this->session->set_flashdata('success', 'Ürün Başarıyla Eklendi');
                        redirect(base_url('urun'));  // başarı mesajı ile birlikte yönlendirme
                    } else {
                        $error = array(
                            'title' => 'Hata',
                            'text'  => 'Ürün Eklenirken Bir Hata Oluştu',
                            'icon'  => 'error'
                        );
                    }
                }
            }
            echo json_encode($error);
        }
    }
    public function Delete($id) {
        $this->load->model('Common_model');
    
        $delete = $this->Common_model->Delete($id);
    
        if ($delete) {
            redirect(base_url('urun'));
        } else {
            echo 'Silme işlemi başarısız.';
        }
    }

    // Ürün güncelleme sayfası
    public function update($urun_id) {
        $data['urun'] = $this->Common_model->get(['urun_id' => $urun_id], 'urunler');
        $this->load->view('urun_update_view', $data); // Güncelleme sayfası
    }

    public function updateProductData() {
        if ($this->input->method() == "post") {
            $this->load->library('form_validation');
    
            // Form doğrulama kuralları
            $this->form_validation->set_rules('urun_id', 'Ürün ID', 'trim|required');
            $this->form_validation->set_rules('urun_adi', 'Ürün Adı', 'trim|required');
            $this->form_validation->set_rules('urun_sef', 'Ürün Türü', 'trim|required');
            $this->form_validation->set_rules('urun_fiyat', 'Ürün Fiyatı', 'trim|required');
    
            if ($this->form_validation->run() === FALSE) {
                $error = array(
                    'title' => 'Hata',
                    'text' => validation_errors(),
                    'icon' => 'error'
                );
            } else {
                $urun_id = $this->input->post('urun_id');
                $urun_durum = $this->input->post('urun_durum'); // '1' veya '0' alacak
    
                $productdata = array(
                    'urun_adi' => $this->input->post('urun_adi'),
                    'urun_sef' => $this->input->post('urun_sef'),
                    'urun_fiyat' => $this->input->post('urun_fiyat'),
                    'urun_durum' => $urun_durum // Aktif/Pasif durumunu buraya kaydediyoruz
                );
    
                $update = $this->Common_model->update(['urun_id' => $urun_id], $productdata, 'urunler');
    
                if ($update) {
                    $success = array(
                        'title' => 'Başarılı',
                        'text' => 'Ürün başarıyla güncellendi.',
                        'icon' => 'success'
                    );
                } else {
                    $error = array(
                        'title' => 'Hata',
                        'text' => 'Ürün güncellenirken bir hata oluştu.',
                        'icon' => 'error'
                    );
                }
            }
            echo json_encode(isset($success) ? $success : $error);
        }
    }    
}