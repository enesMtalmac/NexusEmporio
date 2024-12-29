<?php $this->load->view('default/inc/header_view');?>
  

    <!-- dkt-sitebar-menu start-->
    <?php $this->load->view('default/inc/sidebar_view');?>
    <!-- dkt-sitebar-menu end-->

    <!-- navbar start -->
    <?php $this->load->view('default/inc/menu_view');?>
    <!-- navbar end --> 

    <!-- banner start -->
    <div class="banner-area" style="background: url(<?php echo base_url('uploads/'.$setting->sabitresim);?>);">
        <div class="container">
            <div class="banner-area-inner">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="banner-inner text-center">
                            <?php echo $setting->sabityazi1;?>
                            <?php echo $setting->sabityazi2;?>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <form action="<?php echo base_url('products/search');?>">
                            <input placeholder="Ürün aramak için kelime giriniz..." type="text" name="search_term1" class="form-control">
                            <button type="submit" class="btn"><img src="<?php echo base_url();?>/default/assets/img/icon/1.png" alt="img"></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- banner end -->

   

    <!-- all-item area start -->
    <section class="all-item-area pd-top-90 pd-bottom-100">
        <div class="container">
            
            <div class="row">
                <div class="col-lg-4">
                    <div class="section-title">
                        <h2>Popüler Ürünlerimiz</h2>
                    </div>
                </div>
                <div class="col-lg-8 mt-2">
                    <div class="isotope-filters item-isotope-btn text-lg-right">
                        <?php 
                            if($categories){
                                foreach($categories as $cat){
                                    echo '<a href="'.base_url("category/".$cat->katsef).'" class="button ml-1">'.$cat->katadi.'</a>';
                                }
                            }
                        ?>
                    </div>
                </div>
            </div>

            <?php   if($products){ ?>
            <div class="all-item-section">
                <div class="item-isotope row">
                    <div class="item-sizer col-1"></div>

                    <?php 
                    
                            foreach($products as $pro){
                                ?>

                                <div class="all-isotope-item col-lg-4 col-sm-6">
                                    <div class="thumb">
                                        <a class="gallery-fancybox" href="<?php echo base_url('products/detail/'.$pro->urun_sef.'/'.$pro->urun_kodu);?>">
                                            <img width="300" height="400" src="<?php echo base_url('uploads/'.$pro->urun_resim);?>" alt="<?php echo $pro->urun_adi;?>">
                                        </a>
                                        <a class="btn btn-white" href="<?php echo base_url('products/detail/'.$pro->urun_sef.'/'.$pro->urun_kodu);?>">Ürün Detayı</a>
                                    </div>
                                    <div class="item-details">
                                        <span class="price"><?php echo $pro->urun_fiyat;?>₺</span>
                                        <h4><a href="<?php echo base_url('products/detail/'.$pro->urun_sef.'/'.$pro->urun_kodu);?>"><?php echo $pro->urun_adi;?></a></h4>
                                        <p><?php echo $pro->urun_kisa;?></p>
                                    </div>
                                </div>

                                <?php 
                            }
                        
                    ?>

                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <a class="btn btn-base" href="<?php echo base_url('products');?>">Tüm Ürünlerimiz</a>
                </div>
            </div>
            <?php } ?>


        </div>
    </section>
    <!-- all-item area end -->

   

    

    <!-- fun-fact-area start -->
    <section class="fun-fact-area text-center pd-top-100" style="background: url(<?php echo base_url();?>/default/assets/img/fact/arkaplan.png);">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-3 col-sm-6">
                    <div class="single-fact-wrap">
                        <div class="thumb">
                            <img width="48" height="43" src="<?php echo base_url();?>/default/assets/img/fact/icon1.png" alt="img">
                        </div>
                        <h2><span class="counter"><?php echo $commentcount->total;?></span></h2>
                        <p class="fact-title">Değerli Yorumlar</p>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single-fact-wrap style-2">
                        <div class="thumb">
                            <img width="48" height="43" src="<?php echo base_url();?>/default/assets/img/fact/icon2.png" alt="img">
                        </div>
                        <h2><span class="counter"><?php echo $usercount->total;?></span></h2>
                        <p class="fact-title">Mutlu Müşteriler</p>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single-fact-wrap style-3">
                        <div class="thumb">
                            <img width="48" height="43" src="<?php echo base_url();?>/default/assets/img/fact/icon3.png" alt="img">
                        </div>
                        <h2><span class="counter"><?php echo $productcount->total;?></span></h2>
                        <p class="fact-title">Benzersiz Ürünler</p>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single-fact-wrap style-4">
                        <div class="thumb">
                            <img width="48" height="43" src="<?php echo base_url();?>/default/assets/img/fact/icon4.png" alt="img">
                        </div>
                        <h2><span class="counter"><?php echo $orderscount->total;?></span></h2>
                        <p class="fact-title">Çok Satılanlar</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- fun-fact-area end -->

    <!--testimonial-area start-->
    <?php if($comments){?>
    <section class="testimonial-area text-center pd-top-90 pd-bottom-70">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="section-title text-center">
                        <h2>Değerli Yorumlarınız!</h2>
                        <p>Mutlu müşterilerimizin, ürünlerimiz için yapmış olduğu saygı değer yorumlar....</p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="testimonial-slider owl-carousel owl-theme">
                        <?php foreach($comments as $com){?>
                        <div class="item">
                            <div class="testimonial-wrap">
                                <div class="icon">
                                    <img width="35" height="35" src="<?php echo base_url();?>/default/assets/img/testimonial/quote1.png" alt="img">
                                </div>
                                <p><?php echo $com->yorumicerik;?></p>
                                <div class="thumb">
                                    <img  width="35" height="35"src="<?php echo base_url();?>/default/assets/img/testimonial/1.png" alt="img">
                                </div>
                                <h5 class="name"><?php echo $com->yorumisim;?></h5>
                            </div>
                        </div>
                        <?php } ?>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <?php } ?>

<?php $this->load->view('default/inc/footer_view');?>