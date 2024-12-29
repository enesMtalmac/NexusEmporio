<?php $this->load->view('inc/adminheader_view'); ?>

<!--  BEGIN MAIN CONTAINER  -->
<div class="main-container " id="container">
    <div class="overlay"></div>
    <div class="search-overlay"></div>

    <!--  BEGIN SIDEBAR  -->
    <div class="sidebar-wrapper sidebar-theme">
        <?php $this->load->view('inc/adminnav_view'); ?>
    </div>
    <!--  END SIDEBAR  -->
    
    <!--  BEGIN CONTENT AREA  -->
    <div id="content" class="main-content">
        <div class="layout-px-spacing">
            <div class="middle-content container-xxl p-0">                    
                <div class="row layout-top-spacing">

                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 layout-spacing">
                        <div class="widget widget-t-sales-widget widget-m-orders">
                            <a href="<?php echo base_url('/order')?>">
                                <div class="media">
                                    <div class="icon ml-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-bag">
                                            <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
                                            <line x1="3" y1="6" x2="21" y2="6"></line>
                                            <path d="M16 10a4 4 0 0 1-8 0"></path>
                                        </svg>
                                    </div>
                                    <div class="media-body">
                                        <p class="widget-text">Siparişler</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 layout-spacing">
                        <div class="widget widget-t-sales-widget widget-m-customers">
                            <a href="<?php echo base_url('/users')?>">
                                <div class="media">
                                    <div class="icon ml-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users">
                                            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                            <circle cx="9" cy="7" r="4"></circle>
                                            <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                            <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                        </svg>
                                    </div>
                                    <div class="media-body">
                                        <p class="widget-text">Müşteriler</p>
                                    </div>
                                </div>
                            </a>    
                        </div>
                    </div>

                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 layout-spacing">
                        <div class="widget widget-t-sales-widget widget-m-sales">
                            <a href="<?php echo base_url('/urun')?>">
                                <div class="media">
                                    <div class="icon ml-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-activity">
                                            <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"></polyline>
                                        </svg>
                                    </div>
                                    <div class="media-body">
                                        <p class="widget-text">Ürünler</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 layout-spacing">
                        <div class="widget widget-t-sales-widget widget-m-income">
                            <a href="<?php echo base_url('/contact')?>">
                                <div class="media">
                                    <div class="icon ml-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square">
                                            <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
                                        </svg>
                                    </div>
                                    <div class="media-body">
                                        <p class="widget-text">İletişim</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col-xl-12 col-lg-6 col-md-6 col-sm-12 col-12 layout-spacing">
                        <div class="widget widget-wallet-one">
                            <div class="wallet-info text-center mb-3">
                                <p class="wallet-title mb-3">Bu Ayın Geliri</p>
                                <p class="total-amount mb-3">$ 26,177.88</p>
                                <a href="#" class="wallet-text">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trending-up me-2">
                                        <polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline>
                                        <polyline points="17 6 23 6 23 12"></polyline>
                                    </svg> 
                                    Geçen aya oranla %6 yükselişte
                                </a>
                            </div>
                            <a href="<?php echo base_url('/order')?>">
                                <button class="btn btn-secondary w-100 mt-3">Tüm Siparişleri Görüntüle</button>
                            </a>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <?php $this->load->view('inc/adminfooter_view'); ?>
    </div>
    <!--  END CONTENT AREA  -->
</div>
<!-- END MAIN CONTAINER -->

<?php $this->load->view('inc/adminscript_view'); ?>
