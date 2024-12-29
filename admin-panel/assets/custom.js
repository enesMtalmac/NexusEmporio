var url = "http://localhost/NexusEmporio2.0/admin-panel";


function logout(){

    Swal.fire({
        title: 'Çıkış yapılıyor...',
        text: "Oturumunuz sonlandırılacaktır, onaylıyor musunuz...",
        icon: 'question',
        showCancelButton: true,
        cancelButtonText : 'İptal',
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Evet çıkış yap'
      }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = url;
        }

    })
     
}

function loginbutton(){

    $("#logbutton").prop('disabled',true);
    var formdata = $("#loginform").serialize();
    
    $.ajax({
        type : "POST",
        data : formdata,
        url  : url + "/loginpage/logindata",
        success : function(result){

            var obj = JSON.parse(result);
            swal.fire({
                title : obj.title,
                text  : obj.text,
                icon  : obj.icon
            });
            $("#logbutton").prop('disabled',false);

            if(obj.icon == "success"){
               setTimeout(function(){
                window.location.href = url     
             },1000);
            }

        }
    })

}

function registerbutton(){
    $("#regbutton").prop('disabled',true);

    var data = $("#registerform").serialize();
    $.ajax({
        type : "POST",
        data : data,
        url  : url + "/loginpage/registerdata",
        success : function(result){
            var obj = JSON.parse(result);
            swal.fire({
                title : obj.title,
                text  : obj.text,
                icon  : obj.icon
            });
            $("#regbutton").prop('disabled',false);

            if(obj.icon == "success"){
               setTimeout(function(){
                window.location.href = url + "/loginpage"
               },1000);
            }
        }
    })

}
