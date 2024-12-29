<?php $this->load->view('inc/adminheader_view'); ?>

<!--  BEGIN MAIN CONTAINER  -->
<div class="main-container " id="container">

<div class="overlay"></div>
<div class="search-overlay"></div>

<!--  BEGIN SIDEBAR  -->
<div class="sidebar-wrapper sidebar-theme">
   <?php $this->load->view('inc/adminnav_view');?>
</div>

<!-- BEGIN CONTENT AREA -->
<div id="content" class="main-content">

    <div class="layout-px-spacing">

        <div class="middle-content container-xxl p-0">

            <!-- BREADCRUMB -->
            <div class="page-meta">
                <nav class="breadcrumb-style-one" aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">Müşteriler / Üyeler</li>
                    </ol>
                </nav>
            </div>
            <!-- /BREADCRUMB -->

            <div class="row layout-spacing">
                <div class="col-lg-12">
                    <div class="widget-content widget-content-area">

                        <table class="table table-bordered table-striped mb-4" id="ecommerce-list">
                            <thead>
                                <tr>
                                    <th class="checkbox-column"></th>
                                    <th>Üye Kodu</th>
                                    <th>Üye Adı</th>
                                    <th>Üye Telefonu</th>
                                    <th>Üye E-Posta</th>
                                    <th>Üye Durum</th>
                                    <th class="no-content text-center">İşlemler</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if (!empty($uyeler)) { ?>
                                    <?php foreach ($uyeler as $uye) { ?>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <div class="d-flex flex-column">
                                                    <span class="text-truncate fw-bold"><?= $uye['uye_kodu']; ?></span>
                                                </div>
                                            </td>
                                            
                                            <td>
                                                <div class="d-flex flex-column">
                                                    <span class="text-truncate fw-bold"><?= $uye['uye_adi'] . ' ' . $uye['uye_soyadi']; ?></span>
                                                </div>
                                            </td>
                                            <td>                                                  
                                                <div class="d-flex flex-column">
                                                    <span class="text-truncate fw-bold"><?= $uye['uye_tel']; ?></span>
                                                </div>
                                            </td>
                                            <td><?= $uye['uye_mail']; ?></td>
                                            <td><?= $uye['uye_durum'] ? 'Aktif' : 'Pasif'; ?></td>
                                            
                                            <td class="text-center">
                                                <div class="dropdown">
                                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink1" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal"><circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle></svg>
                                                    </a>

                                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1">
                                                        <a class="dropdown-item" href="<?= base_url('users/update/' . $uye['uye_id']); ?>">Üye Düzenle</a>

                                                        <a class="dropdown-item" href="<?= base_url('users/delete/' . $uye['uye_id']); ?>" onclick="return confirm('Emin misiniz? Bu üye silinecek.');">Sil</a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    <?php } ?>
                                <?php } else { ?>
                                    <tr>
                                        <td colspan="7" class="text-center">Hiç üye bulunamadı.</td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>

        </div>

    </div>

    <?php $this->load->view('inc/adminfooter_view'); ?>

</div>
<!-- END CONTENT AREA -->

</body>

<?php $this->load->view('inc/adminscript_view'); ?>
