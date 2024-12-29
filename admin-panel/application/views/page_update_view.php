<?php $this->load->view('inc/adminheader_view'); ?>

<div class="main-container" id="container">
    <div class="overlay"></div>
    <div class="search-overlay"></div>

    <div class="sidebar-wrapper sidebar-theme">
        <?php $this->load->view('inc/adminnav_view'); ?>
    </div>

    <div id="content" class="main-content">
        <div class="layout-px-spacing">
            <div class="middle-content container-xxl p-0">

                <div class="page-meta">
                    <nav class="breadcrumb-style-one" aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="<?php echo base_url('page') ?>">Sayfa Listesi</a></li>
                        </ol>
                    </nav>
                </div>

                <div class="row mb-4 layout-spacing layout-top-spacing">
                    <div class="col-xxl-9 col-xl-12 col-lg-12 col-md-12 col-sm-12">
                        <div class="widget-content widget-content-area ecommerce-create-section">

                            <form id="updatePageForm" enctype="multipart/form-data">

                                <!-- Sayfa ID (Hidden Field) -->
                                <input type="hidden" name="sayfaid" value="<?php echo $page->sayfaid; ?>">

                                <!-- Sayfa Adı -->
                                <div class="row mb-4">
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="sayfaadi" name="sayfaadi" value="<?php echo $page->sayfaadi; ?>" required>
                                    </div>
                                </div>

                                <!-- Sayfa Sef -->
                                <div class="row mb-4">
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="sayfasef" name="sayfasef" value="<?php echo $page->sayfasef; ?>" required>
                                    </div>
                                </div>

                                <!-- Sayfa İçeriği -->
                                <div class="row mb-4">
                                    <div class="col-sm-12">
                                        <label for="inp-sayfa-icerik">Sayfa İçeriği</label>
                                        <textarea class="form-control" id="sayfaicerik" name="sayfaicerik" rows="5" required><?php echo $page->sayfaicerik; ?></textarea>
                                    </div>
                                </div>

                               
                                <div class="row mb-4">
                                    <div class="col-sm-12">
                                        <select class="form-control" id="sayfadurum" name="sayfadurum" required>
                                            <option value="1" <?= $page->sayfadurum == 1 ? 'selected' : ''; ?>>Aktif</option>
                                            <option value="0" <?= $page->sayfadurum == 0 ? 'selected' : ''; ?>>Pasif</option>
                                        </select>
                                    </div>
                                </div>


                                <div class="col-xxl-12 col-xl-4 col-lg-4 col-md-5 mt-4">
                                    <div class="widget-content widget-content-area ecommerce-create-section">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <button type="button" class="btn btn-primary" id="pageupdateButton" onclick="updatePage()">Sayfayı Güncelle</button>
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
