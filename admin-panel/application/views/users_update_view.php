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
                            <li class="breadcrumb-item"><a href="<?php echo base_url('users') ?>">Üye Listesi</a></li>
                        </ol>
                    </nav>
                </div>

                <div class="row mb-4 layout-spacing layout-top-spacing">
                    <div class="col-xxl-9 col-xl-12 col-lg-12 col-md-12 col-sm-12">
                        <div class="widget-content widget-content-area ecommerce-create-section">

                            <form id="updateUserForm" enctype="multipart/form-data">

                                <!-- Üye ID (Hidden Field) -->
                                <input type="hidden" name="uye_id" value="<?php echo $uye->uye_id; ?>">

                                <!-- Üye Adı ve Soyadı -->
                                <div class="row mb-4">
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="uye_adi" name="uye_adi" value="<?php echo $uye->uye_adi . ' ' . $uye->uye_soyadi; ?>" disabled>
                                    </div>
                                </div>

                                <!-- Üye Durumu -->
                                <div class="row mb-4">
                                    <div class="col-sm-12">
                                        <select class="form-control" id="uye_durum" name="uye_durum" required>
                                            <option value="1" <?= $uye->uye_durum == 1 ? 'selected' : ''; ?>>Aktif</option>
                                            <option value="0" <?= $uye->uye_durum == 0 ? 'selected' : ''; ?>>Pasif</option>
                                        </select>
                                    </div>
                                </div>
                       
                                <div class="col-xxl-12 col-xl-4 col-lg-4 col-md-5 mt-4">
                                    <div class="widget-content widget-content-area ecommerce-create-section">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <button type="button" class="btn btn-primary" id="updateButton" onclick="updateUserStatus()">Üyeyi Güncelle</button>
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
