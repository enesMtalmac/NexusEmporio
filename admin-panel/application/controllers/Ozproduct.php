<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Ozproduct extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Ozellik_model'); // Modeli yükle

    }

    public function index() {
        $urunozellikler = $this->Ozellik_model->getAll([], 'urunozellikler');  // tüm ürünleri getir
        $viewData = array(
            'setting' => $this->Ozellik_model->get(['id' => 1], 'ayarlar'),
            'urunozellikler' => $urunozellikler
        );
        $this->load->view('oz_urun_view', $viewData);
    }

    public function ozaddproduct() {
        $urunozellikler = $this->Ozellik_model->getAll([], 'urunozellikler');  // tüm ürünleri getir
        $viewData = array(
            'setting' => $this->Ozellik_model->get(['id' => 1], 'ayarlar'),
            'urunozellikler' => $urunozellikler
        );
        $this->load->view('oz_urun_ekle_view', $viewData);
    }
    
    public function ozaddproductdata() {
        if ($this->input->method() == "post") {
            $this->load->library('form_validation');

            $this->form_validation->set_rules('ozbaslik', 'Ürün Özellik Başlık', 'trim|required');
            $this->form_validation->set_rules('ozurun', 'Ürün Kodu', 'trim|required');
            $this->form_validation->set_rules('ozicerik', 'Ürün Özellik İçeriği', 'trim|required');
            

            if ($this->form_validation->run() === FALSE) {
                $error = array(
                    'title' => 'Hata',
                    'text'  => validation_errors(),
                    'icon'  => 'error'
                );
            } else {
                $allready = $this->Ozellik_model->getcount(['ozbaslik' => strip_tags($this->input->post('ozbaslik', true))], 'urunozellikler');
                if ($allready > 0) {
                    $error = array(
                        'title' => 'Hata',
                        'text'  => 'Bu ürün zaten mevcut...',
                        'icon'  => 'error'
                    );
                } else {
                    $productdata = array(
                        'ozurun'        => $this->input->post('ozurun'),
                        'ozbaslik'        => $this->input->post('ozbaslik'),
                        'ozicerik'      => $this->input->post('ozicerik'),
                    );

                    $add = $this->Ozellik_model->add('urunozellikler', $productdata);
                    if ($add) {
                        $this->session->set_flashdata('success', 'Ürün Başarıyla Eklendi');
                        redirect(base_url('ozurun'));  // başarı mesajı ile birlikte yönlendirme
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
        $this->load->model('Ozellik_model');
    
        $delete = $this->Ozellik_model->Delete($id);
    
        if ($delete) {
            redirect(base_url('ozurun'));
        } else {
            echo 'Silme işlemi başarısız.';
        }
    }

    
        // Ürün güncelleme sayfası
        public function ozupdate($urun_id) {
            // Veritabanından ilgili ürün özelliklerini al
            $data['urun'] = $this->Ozellik_model->get(['ozid' => $urun_id], 'urunozellikler');
    
            if (!$data['urun']) {
                show_error('Güncellemek istediğiniz ürün bulunamadı.');
                return;
            }
    
            // Güncelleme sayfasını yükle
            $this->load->view('oz_urun_update_view', $data);
        }
    
        public function ozupdateProductData() {
            if ($this->input->method() == "post") {
                $this->load->library('form_validation');
    
                // Form doğrulama kuralları
                $this->form_validation->set_rules('ozbaslik', 'Ürün Özellik Başlık', 'trim|required');
                $this->form_validation->set_rules('ozurun', 'Ürün Kodu', 'trim|required');
                $this->form_validation->set_rules('ozicerik', 'Ürün Özellik İçeriği', 'trim|required');
    
                if ($this->form_validation->run() === FALSE) {
                    $error = array(
                        'title' => 'Hata',
                        'text' => validation_errors(),
                        'icon' => 'error'
                    );
                    echo json_encode($error);
                    return;
                }
    
                $urun_id = $this->input->post('ozid');
                $productdata = array(
                    'ozurun'  => $this->input->post('ozurun'),
                    'ozbaslik' => $this->input->post('ozbaslik'),
                    'ozicerik' => $this->input->post('ozicerik'),
                );
    
                $update = $this->Ozellik_model->update(['ozid' => $urun_id], $productdata, 'urunozellikler');
    
                if ($update) {
                    $success = array(
                        'title' => 'Başarılı',
                        'text' => 'Ürün başarıyla güncellendi.',
                        'icon' => 'success'
                    );
                    echo json_encode($success);
                } else {
                    $error = array(
                        'title' => 'Hata',
                        'text' => 'Ürün güncellenirken bir hata oluştu.',
                        'icon' => 'error'
                    );
                    echo json_encode($error);
                }
            }
        }
    }