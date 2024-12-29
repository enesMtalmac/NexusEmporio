var url = "http://localhost/NexusEmporio2.0/admin-panel";

function updateUserStatus() {
    // Butonu devre dışı bırak
    $("#updateButton").prop('disabled', true);

    // Form verilerini al
    var formData = new FormData($("#updateUserForm")[0]);

    $.ajax({
        type: "POST",
        data: formData,
        url: url + "/users/updateUserStatus", // Güncelleme endpoint'i
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
                        window.location.href = url + "/users"; // Yönlendirme
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
