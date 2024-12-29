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
                            <li class="breadcrumb-item">Siparişler</li>
                        </ol>
                    </nav>
                </div>

                <div class="row layout-spacing">
                    <div class="col-lg-12">
                        <div class="widget-content widget-content-area">
                            <table class="table table-bordered table-striped mb-4" id="ecommerce-list">
                                <thead>
                                    <tr>
                                        <th class="checkbox-column"></th>
                                        <th>Sipariş Numarası</th>
                                        <th>Toplam Tutar</th>
                                        <th>Sipariş Tarihi</th>
                                        <th>Sipariş Durumu</th>
                                        <th class="no-content text-center">İşlemler</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($orders)) { ?>
                                        <?php foreach ($orders as $order) { ?>
                                            <tr>
                                                <td></td>
                                                <td><?= $order['sipno']; ?></td>
                                                <td><?= $order['siptutar']; ?> ₺</td>
                                                <td><?= date('d-m-Y', strtotime($order['siptarih'])); ?></td>
                                                <td><?= $order['sipdurum']; ?></td>
                                                <td class="text-center">
                                                    <div class="dropdown">
                                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink1" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal"><circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle></svg>
                                                        </a>

                                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink1">
                                                            <a class="dropdown-item" href="<?= base_url('order/deleteOrder/'.$order['sipid']); ?>" onclick="return confirm('Emin misiniz? Bu sipariş silinecek.');">Sil</a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        <?php } ?>
                                    <?php } else { ?>
                                        <tr>
                                            <td colspan="6" class="text-center">Hiç sipariş bulunamadı.</td>
                                        </tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <?php $this->load->view('inc/adminfooter_view'); ?>
</div>

<?php $this->load->view('inc/adminscript_view'); ?>
