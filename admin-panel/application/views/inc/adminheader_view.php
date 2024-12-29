<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Admin Panel</title>
    <link rel="icon" type="image/x-icon" href="<?php echo base_url();?>/assets/src/assets/img/fav1.png"/>
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
    <link href="<?php echo base_url();?>/assets/src/plugins/src/apex/apexcharts.css" rel="stylesheet" type="text/css">
    <link href="<?php echo base_url();?>/assets/src/assets/css/light/components/list-group.css" rel="stylesheet" type="text/css">
    <link href="<?php echo base_url();?>/assets/src/assets/css/light/dashboard/dash_2.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo base_url();?>/assets/src/assets/css/light/widgets/modules-widgets-vlm.css" rel="stylesheet" type="text/css" />

    <link href="<?php echo base_url();?>/assets/src/assets/css/dark/components/list-group.css" rel="stylesheet" type="text/css">
    <link href="<?php echo base_url();?>/assets/src/assets/css/dark/dashboard/dash_2.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo base_url();?>/assets/src/assets/css/dark/widgets/modules-widgets-vlm.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->

    <!-- Stylesheet -->
    <link rel="stylesheet" href="<?php echo base_url();?>/assets/css/vendor.css">
    <link rel="stylesheet" href="<?php echo base_url();?>/assets/css/nice-select.css">
    <link rel="stylesheet" href="<?php echo base_url();?>/assets/css/fancybox.min.css">
    <link rel="stylesheet" href="<?php echo base_url();?>/assets/css/style.css?v=123456">
    <link rel="stylesheet" href="<?php echo base_url();?>/assets/css/responsive.css">
    <link rel="stylesheet" href="<?php echo base_url();?>/assets/sweetalert/sweetalert2.css">

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES (FROM FIRST HEAD) -->
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
                                <img alt="avatar" src="<?php echo base_url();?>/assets/src/assets/img/profile.png" class="rounded-circle">
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
      const mesajMail = document.getElementById('mesajMail').value;
      const updateData = {
        mesajisim: document.getElementById('mesajIsim').value,
        mesajkonu: document.getElementById('mesajKonu').value,
        mesajicerik: document.getElementById('mesajIcerik').value
      };

      const response = await fetch('http://localhost:3000/api/iletisim', {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ mesajmail: mesajMail, updateData })
      });

      const result = await response.json();

      if (response.ok) {
        alert('Veri başarıyla güncellendi.');
      } else {
        alert(`Hata: ${result.error}`);
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
           
        </header>
    </div>
    <!--  END NAVBAR  -->