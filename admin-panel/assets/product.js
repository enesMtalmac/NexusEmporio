var url = "http://localhost/NexusEmporio2.0/admin-panel";

function productbutton() {
    // Butonu devre dışı bırak
    $("#productbutton").prop('disabled', true);

    // Form verilerini al
    var formData = new FormData($("#addproductform")[0]);

    $.ajax({
        type: "POST",
        data: formData,
        url: url + "/urun/urun-ekle-data",
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
                    window.location.href = url + "/urun";
                } else {
                    // Başarısız durumlarda hata mesajı göster
                    swal.fire({
                        title: obj.title,
                        text: obj.text,
                        icon: obj.icon
                    });

                    // Butonu tekrar aktif et
                    $("#productbutton").prop('disabled', false);
                }
            } catch (e) {
                // JSON formatı hatalıysa
                console.error("JSON Parse hatası:", e);

                swal.fire({
                    title: 'Hata',
                    text: 'Sunucudan gelen veriler işlenirken bir hata oluştu.',
                    icon: 'error'
                });

                $("#productbutton").prop('disabled', false);
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

            $("#productbutton").prop('disabled', false);
        }
    });


    
    
}
function updateProduct() {
    // Butonu devre dışı bırak
    $("#updateButton").prop('disabled', true);

    // Form verilerini al
    var formData = new FormData($("#updateProductForm")[0]);

    $.ajax({
        type: "POST",
        data: formData,
        url: url + "/urun/updateproductdata", // Güncelleme endpoint'i
        contentType: false,
        processData: false,
        success: function (result) {
            console.log("Gelen veri:", result); // Gelen veriyi logla

            try {
                var obj = JSON.parse(result); // JSON parse işlemi

                if (obj.icon === "success") {
                    swal.fire({
                        title: obj.title,
                        text: obj.text,
                        icon: obj.icon
                    }).then(() => {
                        window.location.href = url + "/urun"; // Yönlendirme
                    });
                } else {
                    swal.fire({
                        title: obj.title,
                        text: obj.text,
                        icon: obj.icon
                    });

                    $("#updateButton").prop('disabled', false); // Butonu tekrar aktif et
                }
            } catch (e) {
                console.error("JSON Parse hatası:", e);

                swal.fire({
                    title: 'Hata',
                    text: 'Sunucudan gelen veriler işlenirken bir hata oluştu.',
                    icon: 'error'
                });

                $("#updateButton").prop('disabled', false);
            }
        },
        error: function (xhr, status, error) {
            console.error("Sunucu hatası:", xhr.responseText);

            swal.fire({
                title: 'Hata',
                text: 'Sunucuya bağlanırken bir hata oluştu.',
                icon: 'error'
            });

            $("#updateButton").prop('disabled', false);
        }
    });
}




