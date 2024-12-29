<?php $this->load->view('inc/adminheader_view'); ?>

<!-- BEGIN MAIN CONTAINER -->
<div class="main-container" id="container">
    <div class="overlay"></div>
    <div class="search-overlay"></div>

    <!-- BEGIN SIDEBAR -->
    <div class="sidebar-wrapper sidebar-theme">
        <?php $this->load->view('inc/adminnav_view'); ?>
    </div>

    <div id="content" class="main-content">
        <div class="layout-px-spacing">
            <div class="middle-content container-xxl p-0">

                <!-- BREADCRUMB -->
                <div class="page-meta">
                    <nav class="breadcrumb-style-one" aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="<?php echo base_url('ozurun')?>">Ürün Özellik Listesi</a></li>
                        </ol>
                    </nav>
                </div>
                <!-- /BREADCRUMB -->

                <div class="row mb-4 layout-spacing layout-top-spacing">
                    <div class="col-xxl-9 col-xl-12 col-lg-12 col-md-12 col-sm-12">
                        <div class="widget-content widget-content-area ecommerce-create-section">

                            <form id="ozaddproductform" action="ozaddproductdata" method="POST" enctype="multipart/form-data">
                                <!-- Ürün Adı -->
                                <div class="row mb-4">
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="urun_adi" name="ozbaslik" placeholder="Ürün Özellik Başılığı" required>
                                    </div>
                                </div>

                                <!-- Ürün Türü -->
                                <div class="row mb-4">
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="urun_sef" name="ozurun" placeholder="Ürün Kodu" required>
                                    </div>
                                </div>

                                <!-- Ürün İçeriği -->
                                <div class="row mb-4">
                                    <div class="col-sm-12">
                                        <label for="inp-urun-icerik">Ürün Özellik İçeriği</label>
                                        <textarea class="form-control" id="ozicerik" name="ozicerik" rows="5" required></textarea>
                                    </div>
                            

                      
                              
                               

                                <div class="col-xxl-12 col-xl-4 col-lg-4 col-md-5 mt-4">
                                    <div class="widget-content widget-content-area ecommerce-create-section">
                                        <div class="row">      
                                            <div class="col-sm-12">
                                                <button type="submit" class="btn btn-base w-100" id="oz-urun-ekle-data">EKLEME İŞLEMİNİ TAMAMLA</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <?php $this->load->view('inc/adminfooter_view'); ?>

</div>

<?php $this->load->view('inc/adminscript_view'); ?>
