var url = "http://localhost/NexusEmporio2.0/admin-panel";

function ozproductbutton() {
    // Butonu devre dışı bırak
    $("#ozproductbutton").prop('disabled', true);

    // Form verilerini al
    var formData = new FormData($("#ozaddproductform")[0]);

    $.ajax({
        type: "POST",
        data: formData,
        url: url + "/urun/oz-urun-ekle-data",
        contentType: false,
        processData: false,
        timeout:1000,
        success: function(result) {
            console.log("Gelen veri:", result); // Gelen veriyi logla

            try {
                // JSON formatına parse et
                var obj = JSON.parse(result);

                // Başarılıysa ürünler sayfasına yönlendir
                if (obj.icon === "success") {
                    window.location.href = url + "/ozurun";
                } else {
                    // Başarısız durumlarda hata mesajı göster
                    swal.fire({
                        title: obj.title,
                        text: obj.text,
                        icon: obj.icon
                    });

                    // Butonu tekrar aktif et
                    $("#ozproductbutton").prop('disabled', false);
                }
            } catch (e) {
                // JSON formatı hatalıysa
                console.error("JSON Parse hatası:", e);

                swal.fire({
                    title: 'Hata',
                    text: 'Sunucudan gelen veriler işlenirken bir hata oluştu.',
                    icon: 'error'
                });

                $("#ozproductbutton").prop('disabled', false);
            }
        },
        error: function(xhr, status, error) {
            // Sunucuya bağlanma hatası
            console.error("Sunucu hatası:", xhr.responseText);

            swal.fire({
                title: 'Hata',
                text: 'Sunucuya bağlanırken bir hata oluştu.',
                icon: 'error'
            });

            $("#ozproductbutton").prop('disabled', false);
        }
    });
}


function ozupdateProduct() {
    $("#ozupdateButton").prop('disabled', true);

    var formData = new FormData($("#ozupdateProductForm")[0]);

    $.ajax({
        type: "POST",
        data: formData,
        url: url + "/ozproduct/ozupdateProductData",
        contentType: false,
        processData: false,
        success: function (result) {
            try {
                var obj = JSON.parse(result);
                if (obj.icon === "success") {
                    swal.fire({
                        title: obj.title,
                        text: obj.text,
                        icon: obj.icon
                    }).then(() => {
                        window.location.href = url + "/ozurun";
                    });
                } else {
                    swal.fire({
                        title: obj.title,
                        text: obj.text,
                        icon: obj.icon
                    });
                    $("#ozupdateButton").prop('disabled', false);
                }
            } catch (e) {
                console.error("JSON Parse hatası:", e);
                swal.fire({
                    title: 'Hata',
                    text: 'Sunucudan gelen veriler işlenirken bir hata oluştu.',
                    icon: 'error'
                });
                $("#ozupdateButton").prop('disabled', false);
            }
        },
        error: function (xhr, status, error) {
            console.error("Sunucu hatası:", xhr.responseText);
            swal.fire({
                title: 'Hata',
                text: 'Sunucuya bağlanırken bir hata oluştu.',
                icon: 'error'
            });
            $("#ozupdateButton").prop('disabled', false);
        }
    });
}


