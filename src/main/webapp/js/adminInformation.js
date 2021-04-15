$(document).ready(function() {
    var oldPswflag = 0;
    var newPswflag = 0;
    var psw = "";
    $("#changeInfo").click(function () {
        $("#update-info").modal({
            backdrop: 'static'
        });
    });

    loadAadmin($("#adminName").val())

    $("#changePsw").click(function (){
        $("#update-Psw").modal({
            backdrop:'static'
        });
    });

    $("#oldPsw").blur(function (){
        let psw = $("#oldPsw").val();
        var hash = hex_md5(psw)
        if (hash!=$("#password").val())
        {
            $("#oldPswError").show();
        }
        else
        {
            $("#oldPswError").hide();
            oldPswflag=1;
        }
    })

    $("#newPsw").blur(function (){
        if($("#newPsw").val().length<6)
        {
            $("#newPswError").show();
        }
        else {
            $("#newPswError").hide();
            newPswflag=1;
        }
    });

    $("#savePsw").click(function (){
        if (oldPswflag==1&&newPswflag==1)
        {
            var Psw={};
            Psw.Psw=$("#newPsw").val();
            $.ajax({
                type: "POST",
                url: "/shop/admin/savePsw",
                contentType:"application/x-www-form-urlencoded; charset=utf-8",
                data:Psw,
                dateType:"json",
                success: function(result){
                    if (result.msg=="更新失败")
                    {
                        swal(result.msg);
                    }
                    else {
                        $("#update-info").modal('hide');
                        swal(result.msg);
                        $("button").click(function (){
                            location.reload();
                        });
                    }
                },
                error:function (){
                    alert("更新失败");
                }
            });
        }else {
            alert("查看提示信息！")
        }
    });
});



function loadAadmin(adminName){
    var admininfo={};
    admininfo.adminName = adminName;
    $.ajax({
        type:"post",
        url:"/shop/admin/showJson",
        contentType:"application/x-www-form-urlencoded; charset=utf-8",
        data:admininfo,
        dateType:"json",
        success: function(result){
            $("#pname").text(result.info.admin.adminname)
            $("#pid").text(result.info.admin.adminid)
            var psw = result.info.admin.password
            $("#password").val(psw)
        },
    });
}
$(document).on("click","#saveInfo",function () {
    var saveInfo={};
    saveInfo.name=$("#name").val()
    $.ajax({
        type: "POST",
        url: "/shop/admin/saveInfo",
        contentType:"application/x-www-form-urlencoded; charset=utf-8",
        data:saveInfo,
        dateType:"json",
        success: function(result){
            if (result.msg=="更新失败")
            {
                swal(result.msg);
            }
            else {
                $("#update-info").modal('hide');
                swal("修改成功", "", "success");
                $("button").click(function (){
                    location.reload();
                });
                loadAadmin(saveInfo.name);
            }
        },
        error:function (){
            alert("更新失败");
        }
    });
});
