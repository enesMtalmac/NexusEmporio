var url = "http://localhost/NexusEmporio2.0/admin-panel";

function updateContactButton() {
    $("#updateButton").prop('disabled', true); // Butonu devre dışı bırak

    var data = $("#updateContactForm").serialize(); // Form verilerini al

    $.ajax({
        type: "POST",
        data: data,
        url: url + "/contact/updateContact", // Güncelleme işlemi için controller URL'si
        success: function(result) {
            var obj = JSON.parse(result); // JSON verilerini parçalıyoruz
            
            swal.fire({
                title: obj.title,
                text: obj.text,
                icon: obj.icon
            });

            $("#updateButton").prop('disabled', false); // Butonu tekrar aktif hale getir

            if (obj.icon === "success") {
                setTimeout(function() {
                    window.location.href = url + "/contact/view"; // Başarılı durumunda yönlendirme
                }, 1000);
            }
        },
        error: function(xhr, status, error) {
            console.error(error); // Hata durumunda konsola yazdır
            swal.fire({
                title: "Hata",
                text: "Sunucu ile iletişim kurulamıyor.",
                icon: "error"
            });
            $("#updateButton").prop('disabled', false); // Butonu tekrar aktif hale getir
        }
    });
}
