<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use MongoDB\Client;

class Contact_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function getMongoDBData($kul_adi, $sifre, $adres, $veritabani, $koleksiyon_adi) {
        // MongoDB Bağlantısı
        $client = new Client("mongodb+srv://$kul_adi:$sifre@$adres");
        $koleksiyon = $client->selectCollection($veritabani, $koleksiyon_adi);
        return $koleksiyon->find()->toArray();
    }
    
    }
    
    

