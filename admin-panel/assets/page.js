var url = "http://localhost/NexusEmporio2.0/admin-panel";



function updatePage() {
    $("#pageupdateButton").prop('disabled', true);

    var formData = new FormData($("#updatePageForm")[0]);

    $.ajax({
        type: "POST",
        data: formData,
        url: url + "/page/updatePageData", // URL doğru şekilde güncellendi
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
                        window.location.href = url + "/page";
                    });
                } else {
                    swal.fire({
                        title: obj.title,
                        text: obj.text,
                        icon: obj.icon
                    });
                    $("#pageupdateButton").prop('disabled', false);
                }
            } catch (e) {
                console.error("JSON Parse hatası:", e);
                swal.fire({
                    title: 'Hata',
                    text: 'Sunucudan gelen veriler işlenirken bir hata oluştu.',
                    icon: 'error'
                });
                $("#pageupdateButton").prop('disabled', false);
            }
        },
        error: function (xhr, status, error) {
            console.error("Sunucu hatası:", xhr.responseText);
            swal.fire({
                title: 'Hata',
                text: 'Sunucuya bağlanırken bir hata oluştu.',
                icon: 'error'
            });
            $("#pageupdateButton").prop('disabled', false);
        }
    });
}

