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
                            <li class="breadcrumb-item"><a href="<?php echo base_url('urun')?>">Ürün Listesi</a></li>
                        </ol>
                    </nav>
                </div>
                <!-- /BREADCRUMB -->

                <div class="row mb-4 layout-spacing layout-top-spacing">
                    <div class="col-xxl-9 col-xl-12 col-lg-12 col-md-12 col-sm-12">
                        <div class="widget-content widget-content-area ecommerce-create-section">

                            <form id="addproductform" action="addproductdata" method="POST" enctype="multipart/form-data">
                                <!-- Ürün Adı -->
                                <div class="row mb-4">
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="urun_adi" name="urun_adi" placeholder="Ürün Adı" required>
                                    </div>
                                </div>

                                <!-- Ürün Türü -->
                                <div class="row mb-4">
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="urun_sef" name="urun_sef" placeholder="Ürün Türü" required>
                                    </div>
                                </div>

                                <!-- Ürün Kısa Açıklaması -->
                                <div class="row mb-4">
                                    <div class="col-sm-12">
                                        <label for="inp-urun-kisa">Ürün Kısa Açıklaması</label>
                                        <input type="text" class="form-control" id="urun_kisa" name="urun_kisa" required>
                                    </div>
                                </div>

                                <!-- Ürün İçeriği -->
                                <div class="row mb-4">
                                    <div class="col-sm-12">
                                        <label for="inp-urun-icerik">Ürün İçeriği</label>
                                        <textarea class="form-control" id="urun_icerik" name="urun_icerik" rows="5" required></textarea>
                                    </div>
                                </div>

                                <!-- Ürün Resimleri -->
                                <div class="row">

                                    <!-- Ürünü Yayınla Seçeneği -->
                                    <div class="col-md-4 text-center">
                                        <div class="col-xxl-12 col-md-6 mb-4">
                                            <label for="urun_durum">Yayınla</label>
                                            <select class="form-control" id="urun_durum" name="urun_durum" required>
                                                <option value="aktif">Aktif</option>
                                                <option value="pasif">Pasif</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xxl-12">
                                    <label for="urun_vitrin">Ürün Vitrin</label>
                                    <input type="text" class="form-control" id="urun_vitrin" name="urun_vitrin" value="" required>
                                </div>
                                <div class="col-xxl-12">
                                    <label for="urun_kodu">Ürün Kodu</label>
                                    <input type="text" class="form-control" id="urun_kodu" name="urun_kodu" value="" required>
                                </div>
                                <div class="col-xxl-12">
                                    <label for="urun_fiyat">Ürün Fiyat</label>
                                    <input type="number" class="form-control" id="urun_fiyat" name="urun_fiyat" value="" required>
                                </div>
                                <div class="col-xxl-12">
                                    <label for="urun_stok">Ürün Stok</label>
                                    <input type="number" class="form-control" id="urun_stok" name="urun_stok" value="" required>
                                </div>
                                <div class="col-xxl-12">
                                    <label for="urun_kategori">Ürün Kategori</label>
                                    <input type="text" class="form-control" id="urun_kategori" name="urun_kategori" value="" required>
                                </div>

                                <div class="col-xxl-12 col-xl-4 col-lg-4 col-md-5 mt-4">
                                    <div class="widget-content widget-content-area ecommerce-create-section">
                                        <div class="row">
                                            <div class="col-sm-12 mb-4">
                                                <label for="urun_kdv">Ürün KDV</label>
                                                <input type="number" class="form-control" id="urun_kdv" name="urun_kdv" value="" required>
                                            </div>
                                            
                                            <div class="col-sm-12">
                                                <button type="submit" class="btn btn-base w-100" id="urun-ekle-data">EKLEME İŞLEMİNİ TAMAMLA</button>
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
