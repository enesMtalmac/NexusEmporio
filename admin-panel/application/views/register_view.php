<?php $this->load->view('/loginc/header_view');?>

<!-- breadcrumb end -->

<!-- policy-page start -->
<section class="pd-top-100 pd-bottom-100 " style="background-color: #49009B;">
<div class="container">
<div class="row justify-content-center">
    <div class="col-xl-7 col-lg-10 text-center">
        <div class="sign-in-area">
            <h2>Admin Kayıt Formu</h2>
            <p>Lütfen admin kayıt formunu eksiksiz doldurunuz...</p>
            <form method="POST" class="contact-form-wrap" id="registerform" onsubmit="return false;">

                <div class="single-input-wrap input-group">
                    <label for="inp-0">Kullanıcı Adınız</label>
                    <input name="name" id="inp-0" type="text" class="form-control" placeholder="Adınız">
                </div>
                <div class="single-input-wrap input-group">
                    <label for="inp-0email">E-posta Adresiniz</label>
                    <input name="email" id="inp-0email" type="email" class="form-control" placeholder="E-posta Adresiniz">
                </div>
                <div class="single-input-wrap input-group">
                    <label for="inp-2">Şifreniz</label>
                    <input name="pass" id="inp-2" type="password" class="form-control"
                        placeholder="Şifreniz">
                </div>
                
                <button onclick="registerbutton();" id="regbutton" class="btn btn-base w-100">KAYIT İŞLEMİNİ TAMAMLA</button>

                <hr />
                <a href="<?php echo base_url('loginpage');?>">Admin hesabınız var mı? Giriş yapmak için tıklayınız.</a>

            </form>
        </div>
    </div>
</div>
</div>
</section>
<?php $this->load->view('/loginc/footer_view');?>