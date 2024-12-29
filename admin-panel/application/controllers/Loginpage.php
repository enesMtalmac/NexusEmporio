<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Loginpage extends CI_Controller{

    public function __construct(){
        parent::__construct();
    }
    public function index(){
           ##session kontrolü## 
           if(@ss('adminlogin') == @sha1(md5($this->input->ip_address().ss('admincode')))){
            redirect(base_url());
        }
        ##session kontrolü## 

        $viewData = array(
			'setting'      => $this->Common_model->get(['id'=>1],'ayarlar'),
		);
        $this->load->view('login_view',$viewData);
    }

    public function logindata(){

        ##session kontrolü## 
        if(@ss('adminlogin') == @sha1(md5($this->input->ip_address().ss('admincode')))){
            redirect(base_url());
        }
        ##session kontrolü## 

        if($this->input->method() == "post"){

            $this->load->library('form_validation');
            $this->form_validation->set_rules('email', 'E-posta adresiniz', 'trim|required|valid_email');
            $this->form_validation->set_rules('pass', 'Şifreniz', 'trim|required');

            
            if ($this->form_validation->run() === FALSE) {

                $error = array(
                    'title' => 'Hata',
                    'text'  => 'Boş alan bıraktınız, hatalı e-posta girdiniz...',
                    'icon'  => 'error'
                );
                
            } else {

                $admindata = array(
                    "adminposta" => strip_tags(trim($this->input->post('email',true))),
                    "adminsifre" => sha1(md5(strip_tags(trim($this->input->post('pass',true))))),
                );

                $loginquery = $this->Common_model->get($admindata,'admin');
                if($loginquery){

                    if($loginquery->admindurum == 1){

                        $generator = $this->input->ip_address().$loginquery->adminkodu;
                        $adminloginok   = sha1(md5($generator));

                        $this->session->set_userdata([
                            'adminlogin' => $adminloginok,
                            'admincode'  => $loginquery->adminkodu,
                            'adminname'  => $loginquery->adminkadi,
                            'adminmail'  => $loginquery->adminposta,
                        ]);

                        ##loglara ekleme##
                        $this->Common_model->add('loglar',[
                            'logbaslik'     => 'Admin Girişi',
                            'logaciklama'   => 'Admin girişi yapıldı',
                            'logekleyen'    => $loginquery->adminkodu,
                            'logtarihpanel' => date('Y-m-d'),
                            'logip'         => $this->input->ip_address()
                        ]);
                        ##loglara ekleme##

                        $error = array(
                            'title' => 'Başarılı',
                            'text'  => 'Başarıyla giriş yaptınız, yönlendiriliyorsunuz...',
                            'icon'  => 'success'
                        );

                    }else{

                        $error = array(
                            'title' => 'Hata',
                            'text'  => 'Üyeliğiniz pasif durumdadır...',
                            'icon'  => 'error'
                        );

                    }

                }else{

                    $error = array(
                        'title' => 'Hata',
                        'text'  => 'E-posta veya şifre yanlış...',
                        'icon'  => 'error'
                    );

                }
              
            }
            

            echo json_encode($error);

        }

    }


    public function register(){

         ##session kontrolü## 
           if(@ss('adminlogin') == @sha1(md5($this->input->ip_address().ss('admincode')))){
            redirect(base_url());
        }
        ##session kontrolü## 
        $viewData = array(
			'setting'      => $this->Common_model->get(['id'=>1],'ayarlar'),
		);
        $this->load->view('register_view',$viewData);
    }

    public function registerdata(){
         ##session kontrolü## 
           if(@ss('adminlogin') == @sha1(md5($this->input->ip_address().ss('admincode')))){
            redirect(base_url());
        }
        ##session kontrolü## 
       if($this->input->method()  == "post"){

        $this->load->library('form_validation');

        $this->form_validation->set_rules('name', 'Adınız', 'trim|required');
        $this->form_validation->set_rules('pass', 'Şifreniz', 'trim|required');
        $this->form_validation->set_rules('email', 'E-posta Adresiniz', 'trim|required|valid_email');

        if ($this->form_validation->run() === FALSE) {

            $error = array(
                'title' => 'Hata',
                'text'  => 'Boş alan bıraktınız, hatalı e-posta veya şifreniz numaranız numerik değil...',
                'icon'  => 'error'
            );

        }else {
               
            $allready = $this->Common_model->getcount(['adminposta'=>strip_tags($this->input->post('email',true))],'admin');
            if($allready > 0){

                $error = array(
                    'title' => 'Hata',
                    'text'  => 'E-posta adresi zaten kayıtlı...',
                    'icon'  => 'error'
                );

            }else{

                $admindata = array(
                    'adminkodu'       => uniqid(),
                    'adminkadi'        => strip_tags($this->input->post('name',true)),
                    'adminposta'       => strip_tags($this->input->post('email',true)),
                    'adminsifre'      => sha1(md5(strip_tags($this->input->post('pass',true)))),
                    'admindurum'      => 1,
                    'adminekleyen'     => strip_tags($this->input->post('name',true)),
                );

                $add = $this->Common_model->add('admin',$admindata);
                if($add){

                    $error = array(
                        'title' => 'Başarılı',
                        'text'  => 'Admin Üyleğiniz Başarıyla Sağlandı',
                        'icon'  => 'success'
                    );
                }else{
                    $error = array(
                        'title' => 'Hata',
                        'text'  => 'Sistem Hatası Oluştu',
                        'icon'  => 'success'
                    );

                }
            }
        }

        echo json_encode($error);


    }

}
public function logout(){
       
    $this->session->sess_destroy();
    redirect('loginpage');
    
}
}