<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Order extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Order_model'); // Order_model'ini yükle
    }

    // Siparişlerin listelendiği sayfa
    public function index() {
        $orders = $this->Order_model->getAll([], 'siparisler');  // tüm siparişleri getir
        $viewData = array(
            'setting' => $this->Order_model->get(['id' => 1], 'ayarlar'),
            'orders' => $orders
        );
        $this->load->view('order_view', $viewData);
    }

    

    // Siparişi silme işlemi
    public function deleteOrder($sipid) {
        $this->load->model('Order_model');
        $delete = $this->Order_model->Delete($sipid);

        if ($delete) {
            redirect(base_url('order'));
        } else {
            echo 'Silme işlemi başarısız.';
        }
    }
}
