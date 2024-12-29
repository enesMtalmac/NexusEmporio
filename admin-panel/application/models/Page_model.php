<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Page_model extends CI_Model{

    public function __construct(){
        $query = $this->db->query("SELECT * FROM ayarlar")->row();
        $this->config->set_item('base_url', $query->site_admin_url);
    }

    // Tek satır veri döndüren get fonksiyonu
    public function get($where, $table){
        return $this->db->where($where)->get($table)->row();
    }

    // Veritabanından verileri dizi olarak döndüren getAll fonksiyonu
    public function getAll($where, $table){
        return $this->db->where($where)->get($table)->result_array(); // result_array() kullanılarak veri dizisi döndürülür
    }

    // Belirli bir sıralama ile tüm verileri listeleyen fonksiyon
    public function getlistAll($where, $table, $orderbycolumn="id", $orderby="DESC"){
        return $this->db
        ->where($where)
        ->order_by($orderbycolumn, $orderby)
        ->get($table)
        ->result();
    }

    // Yeni veri ekleyen fonksiyon
    public function add($table, $where){
        return $this->db->insert($table, $where);
    }

    // Veritabanındaki kayıt sayısını döndüren fonksiyon
    public function getcount($where, $table){
        return $this
            ->db
            ->where($where)
            ->count_all_results($table);
    }

    // Mevcut veriyi güncelleyen fonksiyon
    public function update($where, $data, $table) {
        return $this->db->where($where)->update($table, $data);
    }

    // Özel SQL sorgusu çalıştıran fonksiyon
    public function custom($query, $status){
        if($status == true){
            return $this->db->query($query)->result();
        } else {
            return $this->db->query($query)->row();
        }
    }

    // Belirli bir limite göre veri döndüren fonksiyon
    public function getLimitAll($where, $limit="", $pkCount="", $table, $orderbycolumn="id", $orderby="DESC", $select="*"){
        return $this
            ->db
            ->select($select) 
            ->where($where)
            ->order_by($orderbycolumn, $orderby)
            ->limit($limit, $pkCount)
            ->get($table)
            ->result();
    }
    public function Delete($id)
        {
            return $this->db->where('sayfaid', $id)->delete('sayfalar');
        }
}
?>
