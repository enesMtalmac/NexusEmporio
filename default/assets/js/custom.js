var url = "http://localhost/NexusEmporio2.0";

function passwordupdate() {
    $("#sendbutton").prop('disabled', true);

    var data = $("#passform").serialize();
    $.ajax({
        type: "POST",
        data: data,
        url: url + "/user/passworddata",
        success: function(result) {
            var obj = JSON.parse(result);
            swal.fire({
                title: obj.title,
                text: obj.text,
                icon: obj.icon
            });

            if (obj.icon == 'success') {
                setTimeout(function() {
                    window.location.reload()
                }, 2000);
            } else {
                $("#sendbutton").prop('disabled', false);
            }
        }
    });
}

function profileupdate() {
    $("#sendbutton").prop('disabled', true);

    var data = $("#profileform").serialize();
    $.ajax({
        type: "POST",
        data: data,
        url: url + "/user/profiledata",
        success: function(result) {
            var obj = JSON.parse(result);
            swal.fire({
                title: obj.title,
                text: obj.text,
                icon: obj.icon
            });

            if (obj.icon == 'success') {
                setTimeout(function() {
                    window.location.reload()
                }, 2000);
            } else {
                $("#sendbutton").prop('disabled', false);
            }
        }
    });
}

function combutton() {
    $("#combuton").prop('disabled', true);
    var data = $("#commentform").serialize();
    $.ajax({
        type: "POST",
        data: data,
        url: url + "/products/savecomment",
        success: function(result) {
            var obj = JSON.parse(result);
            swal.fire({
                title: obj.title,
                text: obj.text,
                icon: obj.icon
            });
            $("#combuton").prop('disabled', false);

            if (obj.icon == 'success') {
                setTimeout(function() {
                    window.location.reload()
                }, 2000);
            }
        }
    });
}

function ordersave() {
    $("#savebutton").prop('disabled', true);

    var data = $("#orderform").serialize();
    var payment = $("input[name=payment]:checked").val(); // Güncel HTML'e uygun seçim

    if (!payment) {
        swal.fire({
            title: "Hata",
            text: "Lütfen ödeme türünü seçiniz.",
            icon: "error"
        });
        $("#savebutton").prop('disabled', false);
        return;
    }

    $.ajax({
        type: "POST",
        data: data,
        url: url + '/completedata',
        success: function(response) {
            try {
                var data = JSON.parse(response);
                swal.fire({
                    title: data.title,
                    text: data.text,
                    icon: data.icon
                });

                $("#savebutton").prop('disabled', false);

                if (data.link && data.link !== '#') {
                    setTimeout(function() {
                        window.location.href = data.link;
                    }, 1000);
                }
            } catch (e) {
                console.error("JSON Parse Hatası:", e.message);
                swal.fire({
                    title: "Hata",
                    text: "Beklenmedik bir hata oluştu. Lütfen tekrar deneyiniz.",
                    icon: "error"
                });
                $("#savebutton").prop('disabled', false);
            }
        },
        error: function(xhr, status, error) {
            console.error("Hata:", xhr.responseText);
            swal.fire({
                title: "Hata Oluştu",
                text: "Sipariş sırasında bir sorun oluştu. Lütfen tekrar deneyiniz.",
                icon: "error"
            });
            $("#savebutton").prop('disabled', false);
        }
    });
}

function passbutton() {
    $("#pasbutton").prop('disabled', true);

    var data = $("#passwordform").serialize();
    $.ajax({
        type: "POST",
        data: data,
        url: url + "/loginpage/recoverypassworddata",
        success: function(result) {
            var obj = JSON.parse(result);
            swal.fire({
                title: obj.title,
                text: obj.text,
                icon: obj.icon
            });
            $("#pasbutton").prop('disabled', false);

            if (obj.icon == "success") {
                setTimeout(function() {
                    window.location.href = url + '/loginpage'
                }, 1000);
            }
        }
    });
}

function recbuttons() {
    $("#recbutton").prop('disabled', true);
    var data = $("#recoveryform").serialize();
    $.ajax({
        type: "POST",
        data: data,
        url: url + "/loginpage/passwordrecoverydata",
        success: function(result) {
            var obj = JSON.parse(result);
            swal.fire({
                title: obj.title,
                text: obj.text,
                icon: obj.icon
            });
            $("#recbutton").prop('disabled', false);

            if (obj.icon == "success") {
                setTimeout(function() {
                    window.location.reload()
                }, 1000);
            }
        }
    });
}

function logout() {
    Swal.fire({
        title: 'Çıkış yapılıyor...',
        text: "Oturumunuz sonlandırılacaktır, onaylıyor musunuz...",
        icon: 'question',
        showCancelButton: true,
        cancelButtonText: 'İptal',
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Evet çıkış yap'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = url + "/loginpage/logout";
        }
    });
}

function loginbutton() {
    $("#logbutton").prop('disabled', true);
    var formdata = $("#loginform").serialize();

    $.ajax({
        type: "POST",
        data: formdata,
        url: url + "/loginpage/logindata",
        success: function(result) {
            var obj = JSON.parse(result);
            swal.fire({
                title: obj.title,
                text: obj.text,
                icon: obj.icon
            });
            $("#logbutton").prop('disabled', false);

            if (obj.icon == "success") {
                setTimeout(function() {
                    window.location.href = url
                }, 1000);
            }
        }
    });
}

function registerbutton() {
    // Butonu devre dışı bırakıyoruz, böylece kullanıcı tıklamayı tekrar yapamaz
    $("#regbutton").prop('disabled', true);

    var data = $("#registerform").serialize(); // Form verilerini alıyoruz
    console.log(data); // Veriyi konsola yazdırarak kontrol edebiliriz

    $.ajax({
        type: "POST",
        data: data,
        url: url + "/loginpage/registerdata",
        success: function(result) {
            try {
                var obj = JSON.parse(result); // JSON formatında dönen yanıtı çözümleme
            } catch (e) {
                console.error('Yanıt JSON formatında değil:', e);
                swal.fire({
                    title: 'Hata',
                    text: 'Geçersiz yanıt formatı alındı!',
                    icon: 'error'
                });
                return;
            }

            // Yanıtı SweetAlert ile gösteriyoruz
            swal.fire({
                title: obj.title,
                text: obj.text,
                icon: obj.icon
            });

            $("#regbutton").prop('disabled', false); // Butonu tekrar aktif hale getiriyoruz

            // Başarı durumunda yönlendirme
            if (obj.icon == "success") {
                setTimeout(function() {
                    window.location.href = url + "/loginpage"; // Giriş sayfasına yönlendirme
                }, 1000);
            }
        },
        error: function() {
            swal.fire({
                title: 'Hata',
                text: 'Bir hata oluştu, lütfen tekrar deneyin.',
                icon: 'error'
            });
            $("#regbutton").prop('disabled', false); // Butonu tekrar aktif hale getiriyoruz
        }
    });
}

let isSubmitting = false; // Kontrol değişkeni

function sendmessage() {
    if (isSubmitting) return; // Eğer gönderim devam ediyorsa, çıkış yap

    isSubmitting = true; // Gönderim işlemini başlat
    $("#sendButton").prop('disabled', true); // Butonu devre dışı bırak

    var data = $("#contactform").serialize();
    $.ajax({
        type: "POST",
        url: url + "/pages/sendmessage",
        data: data,
        success: function(response) {
            var obj = JSON.parse(response);
            swal.fire({
                title: obj.title,
                text: obj.text,
                icon: obj.icon
            });

            if (obj.icon === "success") {
                $("input[name=name]").val('');
                $("input[name=email]").val('');
                $("input[name=subject]").val('');
                $("textarea[name=message]").val('');
            }

            isSubmitting = false; // Gönderim işlemi tamamlandı
            $("#sendButton").prop('disabled', false); // Butonu tekrar etkinleştir
        },
        error: function() {
            swal.fire({
                title: "Hata",
                text: "Bir sorun oluştu. Lütfen tekrar deneyin.",
                icon: "error"
            });
            isSubmitting = false; // Gönderim işlemi başarısız oldu
            $("#sendButton").prop('disabled', false); // Butonu tekrar etkinleştir
        }
    });
}
