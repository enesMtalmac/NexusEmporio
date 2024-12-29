<?php $this->load->view('inc/adminheader_view'); ?>

<!-- BEGIN MAIN CONTAINER -->
<div class="main-container " id="container">
    <div class="overlay"></div>
    <div class="search-overlay"></div>

    <!-- BEGIN SIDEBAR -->
    <div class="sidebar-wrapper sidebar-theme">
        <?php $this->load->view('inc/adminnav_view'); ?>
    </div>

    <!-- BEGIN CONTENT AREA -->
    <div id="content" class="main-content">
        <div class="layout-px-spacing">
            <div class="middle-content container-xxl p-0">

                <!-- BREADCRUMB -->
                <div class="page-meta">
                    <nav class="breadcrumb-style-one" aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">Müşteriler / İletişim</li>
                            <li class="breadcrumb-item"><a href="<?php echo base_url('contact/update');?>">Düzenle</a></li>

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
                                        <th>İsim</th>
                                        <th>Email</th>
                                        <th>Konu</th>
                                        <th>İçerik</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($iletisim)) { ?>
                                        <?php foreach ($iletisim as $message) { ?>
                                            <tr>
                                                <td></td>

                                                <td><?= isset($message->mesajisim) ? $message->mesajisim : ''; ?></td>
                                                <td><?= isset($message->mesajmail) ? $message->mesajmail : ''; ?></td>
                                                <td><?= isset($message->mesajkonu) ? $message->mesajkonu : ''; ?></td>
                                                <td><?= isset($message->mesajicerik) ? $message->mesajicerik : ''; ?></td>
                                               
                                            </tr>
                                        <?php } ?>
                                    <?php } else { ?>
                                        <tr>
                                            <td colspan="6" class="text-center">Veri bulunamadı.</td>
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
