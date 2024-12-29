<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use MongoDB\Driver\Manager;
use MongoDB\Driver\Query;
use MongoDB\BSON\ObjectId;
class Contact extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Contact_model'); // Modeli yükle
    }

    public function index() {
        $kul_adi = "alican";
        $sifre = "Ojqdb6xVsfCweOEc";
        $adres = "cluster0.hehabxu.mongodb.net";
        $veritabani = "dijitalurun";
        $koleksiyon_adi = 'iletisim';

        $manager = new Manager("mongodb+srv://$kul_adi:$sifre@$adres");
        $query = new Query([]);
        $documents = $manager->executeQuery("$veritabani.$koleksiyon_adi", $query);

        $iletisimData = $documents->toArray();

        // MongoDB _id alanını string'e dönüştürmek için doğru bir yöntem
        $data['iletisim'] = array_map(function($doc) {
            if(isset($doc->_id) && $doc->_id instanceof ObjectId) {
                $doc->_id = (string) $doc->_id; // ObjectId'yi string olarak döndür
            }
            return $doc;
        }, $iletisimData);

        $this->load->view('contact_view', $data);
    }

    public function addContact() {
        $postData = $this->input->post();

        if (!empty($postData)) {
            $kul_adi = "alican";
            $sifre = "Ojqdb6xVsfCweOEc";
            $adres = "cluster0.hehabxu.mongodb.net";
            $veritabani = "dijitalurun";
            $koleksiyon_adi = 'iletisim';

            $manager = new Manager("mongodb+srv://$kul_adi:$sifre@$adres");
            $koleksiyon = $manager->selectCollection($veritabani, $koleksiyon_adi);

            $result = $koleksiyon->insertOne([
                'mesajisim' => $postData['isim'],
                'mesajmail' => $postData['email'],
                'mesajkonu' => $postData['konu'],
                'mesajicerik' => $postData['icerik'],
            ]);

            if ($result->getInsertedCount() > 0) {
                $this->session->set_flashdata('success', 'İletişim verisi başarıyla eklendi.');
            } else {
                $this->session->set_flashdata('error', 'Bir hata oluştu. Lütfen tekrar deneyin.');
            }

            redirect('contact_view');
        }
    }

    public function updateContact() {
        // Burada sadece view'e yönlendirme yapıyoruz
        $this->load->view('contact_update_view');
    }
    
}
