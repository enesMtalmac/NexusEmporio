<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Ecommerce Edit | EQUATION - Multipurpose Bootstrap Dashboard Template </title>
    <link rel="icon" type="image/x-icon" href="<?php echo base_url();?>/assets/src/assets/img/favicon.ico"/>
    <link href="<?php echo base_url();?>/assets/layouts/vertical-dark-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo base_url();?>/assets/layouts/vertical-dark-menu/css/dark/loader.css" rel="stylesheet" type="text/css" />
    <script src="<?php echo base_url();?>/assets/layouts/vertical-dark-menu/loader.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="<?php echo base_url();?>/assets/src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo base_url();?>/assets/layouts/vertical-dark-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo base_url();?>/assets/layouts/vertical-dark-menu/css/dark/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    <link rel="stylesheet" href="<?php echo base_url();?>/assets/src/plugins/src/filepond/filepond.min.css">
    <link rel="stylesheet" href="<?php echo base_url();?>/assets/src/plugins/src/filepond/FilePondPluginImagePreview.min.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>/assets/src/plugins/src/tagify/tagify.css">
    
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>/assets/src/assets/css/light/forms/switches.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>/assets/src/plugins/css/light/editors/quill/quill.snow.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>/assets/src/plugins/css/light/tagify/custom-tagify.css">
    <link href="<?php echo base_url();?>/assets/src/plugins/css/light/filepond/custom-filepond.css" rel="stylesheet" type="text/css" />
    
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>/assets/src/assets/css/dark/forms/switches.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>/assets/src/plugins/css/dark/editors/quill/quill.snow.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>/assets/src/plugins/css/dark/tagify/custom-tagify.css">
    <link href="<?php echo base_url();?>/assets/src/plugins/css/dark/filepond/custom-filepond.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link rel="stylesheet" href="<?php echo base_url();?>/assets/src/assets/css/light/apps/ecommerce-create.css">
    <link rel="stylesheet" href="<?php echo base_url();?>/assets/src/assets/css/dark/apps/ecommerce-create.css">

    <link href="<?php echo base_url();?>/assets/layouts/vertical-dark-menu/css/dark/structure-mod.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo base_url();?>/assets/layouts/vertical-dark-menu/css/light/structure-mod.css" rel="stylesheet" type="text/css" />
    <!--  END CUSTOM STYLE FILE  -->


    <script>
        async function listele() {
          const response = await fetch('http://localhost:3000/api/iletisim');
          const veriler = await response.json();
          
          const selectElement = document.getElementById('mesajMail');
          selectElement.innerHTML = '<option value="">Seçiniz</option>';
          
          veriler.forEach(iletisim => {
            const option = document.createElement('option');
            option.value = iletisim.mesajmail;
            option.textContent = iletisim.mesajisim;
            selectElement.appendChild(option);
          });
        }
    
        async function güncelle() {
    // Formdan verileri al
    const mesajMail = document.getElementById('mesajMail').value;
    const updateData = {
        mesajisim: document.getElementById('mesajIsim').value,
        mesajkonu: document.getElementById('mesajKonu').value,
        mesajicerik: document.getElementById('mesajIcerik').value
    };

    try {
        // PUT isteği gönder
        const response = await fetch('http://localhost:3000/api/iletisim', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ mesajmail: mesajMail, updateData })
        });

        // Yanıtı al
        const result = await response.json();

        // Eğer işlem başarılıysa, yönlendirme yap
        if (response.ok) {
            alert('Veri başarıyla güncellendi.');
            // Güncelleme başarılı, CodeIgniter rotasına yönlendir
            window.location.href = 'http://localhost/NexusEmporio2.0/admin-panel/contact/';  // 'contact' rotasına yönlendir
        } else {
            // Hata durumunda kullanıcıya bildirim
            alert(`Hata: ${result.error}`);
        }
    } catch (error) {
        // Eğer ağ hatası veya başka bir hata oluşursa
        alert('Bir hata oluştu: ' + error.message);
    }
}


    
        async function sil() {
          const mesajMail = document.getElementById('mesajMail').value;
    
          const response = await fetch('http://localhost:3000/api/iletisim', {
            method: 'DELETE',
            headers: {
              'Content-Type': 'application/json'
            },
            body: JSON.stringify({ mesajmail: mesajMail })
          });
    
          const result = await response.json();
    
          if (response.ok) {
            alert('Veri başarıyla silindi.');
            listele(); // Listeyi yeniden yükle
          } else {
            alert(`Hata: ${result.error}`);
          }
        }
    
        document.addEventListener('DOMContentLoaded', listele); // Sayfa yüklendiğinde verileri listele
      </script>
</head>
<body class="">
    
    <!-- BEGIN LOADER -->
    <div id="load_screen"> <div class="loader"> <div class="loader-content">
        <div class="spinner-grow align-self-center"></div>
    </div></div></div>
    <!--  END LOADER -->

    <!--  BEGIN NAVBAR  -->
    <div class="header-container container-xxl">
        <header class="header navbar navbar-expand-sm expand-header">

            <a href="javascript:void(0);" class="sidebarCollapse">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
            </a>
            <div class="search-animated toggle-search">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                <form class="form-inline search-full form-inline search" role="search">
                    <div class="search-bar">
                        <input type="text" class="form-control search-form-control  ml-lg-auto" placeholder="Sipariş ara...">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x search-close"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                    </div>
                </form>
                <span class="badge badge-secondary">Ctrl + /</span>
            </div>
           
            <ul class="navbar-item flex-row ms-lg-auto ms-0">


                <li class="nav-item theme-toggle-item">
                    <a href="javascript:void(0);" class="nav-link theme-toggle">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-moon dark-mode"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path></svg>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-sun light-mode"><circle cx="12" cy="12" r="5"></circle><line x1="12" y1="1" x2="12" y2="3"></line><line x1="12" y1="21" x2="12" y2="23"></line><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"></line><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"></line><line x1="1" y1="12" x2="3" y2="12"></line><line x1="21" y1="12" x2="23" y2="12"></line><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"></line><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"></line></svg>
                    </a>
                </li>
                <li class="nav-item dropdown user-profile-dropdown  order-lg-0 order-1">
                    <a href="javascript:void(0);" class="nav-link dropdown-toggle user" id="userProfileDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <div class="avatar-container">
                            <div class="avatar avatar-sm avatar-indicators avatar-online">
                                <img alt="avatar" src="<?php echo base_url();?>/assets/src/assets/img/profile-21.jpeg" class="rounded-circle">
                            </div>
                        </div>
                    </a>

                    <div class="dropdown-menu position-absolute" aria-labelledby="userProfileDropdown">
                        <div class="user-profile-section">
                            <div class="media mx-auto">
                                <div class="emoji me-2">
                                    &#x1F44B;
                                </div>
                                <div class="media-body">
                                    <h5><?php echo ss('adminname')?></h5>
                                    <p>Aktif Admin</p>
                                </div>
                            </div>
                        </div>
                       
                        <div class="dropdown-item">
                            <a href="<?php echo base_url() ?>/loginpage/logout">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg> <span>Çıkış Yap</span>
                            </a>
                        </div>
                    </div>
                    
                </li>
            </ul>
        </header>
    </div>
    <!--  END NAVBAR  -->
    <!--  BEGIN MAIN CONTAINER  -->
    <div class="main-container " id="container">

        <div class="overlay"></div>
        <div class="search-overlay"></div>

        <!--  BEGIN SIDEBAR  -->
        <div class="sidebar-wrapper sidebar-theme">

            <nav id="sidebar">

                <div class="navbar-nav theme-brand flex-row  text-center">
                    <div class="nav-logo">
                      
                        <div class="nav-item theme-text">
                            <a href="#" class="nav-link"> Nodejs Panel </a>
                        </div>
                    </div>
                    <div class="nav-item sidebar-toggle">
                        <div class="btn-toggle sidebarCollapse">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevrons-left"><polyline points="11 17 6 12 11 7"></polyline><polyline points="18 17 13 12 18 7"></polyline></svg>
                        </div>
                    </div>
                </div>
                <div class="shadow-bottom"></div>
                <ul class="list-unstyled menu-categories" id="accordionExample">
                    <li class="menu active">
                        <a href="<?php echo base_url();?>"  aria-expanded="true" class="dropdown-toggle">
                            <div class="">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
                                <span>Ana Sayfa</span>
                            </div>
                            <div>
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                            </div>
                        </a>
                    </li>
                
                    <li class="menu menu-heading">
                        <div class="heading"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-minus"><line x1="5" y1="12" x2="19" y2="12"></line></svg><span>MENÜ</span></div>
                    </li>
                
                    <li class="menu">
                        <a href="#ecommerce" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                            <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-cart"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
                            <span>Ürün Listesi</span>
                            </div>
                            <div>
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
                            </div>
                        </a>
                        <ul class="collapse submenu list-unstyled" id="ecommerce" data-bs-parent="#accordionExample">
                            <li>
                            <a href="<?php echo base_url('urun')?>"> Ürün Ekleme </a>
                            </li>
                            <li>
                            <a href="<?php echo base_url('ozurun')?>">Ürün Özellik Ekleme </a>
                            </li>
                                                  
                        </ul>
                    </li>
                    
                    <li class="menu">
                        <a href="<?php echo base_url('users')?>" aria-expanded="false" class="dropdown-toggle">
                            <div class="">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                                <span>Müşteriler</span>
                            </div>
                        </a>
                    </li>
                    <li class="menu">
                        <a  href="<?php echo base_url('contact')?>"aria-expanded="false" class="dropdown-toggle">
                             <div class="">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
                                <span>İletişim</span>
                             </div>
                        </a>
                    </li>
                
                    <li class="menu">
                        <a href="./app-mailbox.html" aria-expanded="false" class="dropdown-toggle">
                            <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
                            <span>Kategori Listesi</span>
                            </div>
                        </a>
                    </li>
                    
                    <li class="menu">
                        <a href="./app-mailbox.html" aria-expanded="false" class="dropdown-toggle">
                            <div class="">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-pie-chart"><path d="M21.21 15.89A10 10 0 1 1 8 2.83"></path><path d="M22 12A10 10 0 0 0 12 2v10z"></path></svg>
                            <span>Yönetici Listesi</span>
                            </div>
                        </a>
                    </li>
                
                   
                
                    
                </ul>
                
                </nav>
        </div>
        <!--  END SIDEBAR  -->

        <!--  BEGIN CONTENT AREA  -->
        <div id="content" class="main-content">

            <div class="layout-px-spacing">
                <div class="middle-content container-xxl p-0">
                <div class="page-meta">
                            <nav class="breadcrumb-style-one" aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">MongoDB</li>
                                    <li class="breadcrumb-item">Nodejs</li>
                                    <li class="breadcrumb-item">İşlemleri</li>

                                </ol>
                            </nav>
                </div>
                    <div class="row mb-4 layout-spacing layout-top-spacing">
                        <div class="col-xxl-9 col-xl-12 col-lg-12 col-md-12 col-sm-12">
                            <div class="widget-content widget-content-area ecommerce-create-section">
                                <div class="row mb-4">
                                    <div class="col-sm-12">
                                    <label for="mesajMail" class="form-label">Mail Adresi:</label>
                                    <select class="form-select" id="mesajMail" aria-label="Mail Adresi Seçin"></select>
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    <div class="col-sm-12">
                                        <input type="text" id="mesajIsim" class="form-control" placeholder="İsminiz">
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col-sm-12">
                                        <input type="text" id="mesajKonu" class="form-control" placeholder="Konu">
                                    </div>
                                </div>
                                 <div class="row mb-4">
                                    <div class="col-sm-12 mb-10">
                                        <label for="mesajIcerik">İçerik:</label>
                                        <input type="text" class="form-control" id="mesajIcerik"  required>
                                    </div>
                                </div>
                              
                                <Action Buttons -->
                                <div class="col-xxl-12 ">
                                    <div class="widget-content widget-content-area ecommerce-create-section">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <button type="button" class="btn btn-success w-100" onclick="güncelle();">Güncelle</button>
                                                
                                            </br>
                                            </br>

                                                <button type="button" class="btn btn-danger w-100" onclick="sil();">Sil</button>
                                            </div>
                                        </div>                                            
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--  BEGIN FOOTER  -->
            <div class="footer-wrapper">
                <div class="footer-section f-section-1">
              
                </div>
                <div class="footer-section f-section-2">
                    <p class="">Copyright © <span class="dynamic-year">2024</span> NexusEmporio, Tüm Hakları Saklıdır.<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg></p>
                </div>
            </div>
            <!--  END FOOTER  -->

        </div>
        <!--  END CONTENT AREA  -->
    </div>
    <!-- END MAIN CONTAINER -->
    
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <script src="<?php echo base_url();?>/assets/src/plugins/src/global/vendors.min.js"></script>
    <script src="<?php echo base_url();?>/assets/src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="<?php echo base_url();?>/assets/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="<?php echo base_url();?>/assets/src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="<?php echo base_url();?>/assets/src/plugins/src/waves/waves.min.js"></script>
    <script src="<?php echo base_url();?>/assets/layouts/vertical-dark-menu/app.js"></script>
    
    <script src="<?php echo base_url();?>/assets/src/plugins/src/highlight/highlight.pack.js"></script>
    <script src="<?php echo base_url();?>/assets/src/assets/js/custom.js"></script>
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="<?php echo base_url();?>/assets/src/plugins/src/editors/quill/quill.js"></script>
    <script src="<?php echo base_url();?>/assets/src/plugins/src/filepond/filepond.min.js"></script>
    <script src="<?php echo base_url();?>/assets/src/plugins/src/filepond/FilePondPluginFileValidateType.min.js"></script>
    <script src="<?php echo base_url();?>/assets/src/plugins/src/filepond/FilePondPluginImageExifOrientation.min.js"></script>
    <script src="<?php echo base_url();?>/assets/src/plugins/src/filepond/FilePondPluginImagePreview.min.js"></script>
    <script src="<?php echo base_url();?>/assets/src/plugins/src/filepond/FilePondPluginImageCrop.min.js"></script>
    <script src="<?php echo base_url();?>/assets/src/plugins/src/filepond/FilePondPluginImageResize.min.js"></script>
    <script src="<?php echo base_url();?>/assets/src/plugins/src/filepond/FilePondPluginImageTransform.min.js"></script>
    <script src="<?php echo base_url();?>/assets/src/plugins/src/filepond/filepondPluginFileValidateSize.min.js"></script>

    <script src="<?php echo base_url();?>/assets/src/plugins/src/tagify/tagify.min.js"></script>
    <script src="<?php echo base_url();?>/assets/src/assets/js/apps/ecommerce-create.js"></script>

    <script>
        ecommerce.addFiles('<?php echo base_url();?>/assets/src/assets/img/product-1.jpg', '<?php echo base_url();?>/assets/src/assets/img/product-3.jpg', '<?php echo base_url();?>/assets/src/assets/img/product-5.jpg');
    </script>

    <!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>