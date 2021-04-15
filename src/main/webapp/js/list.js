$(document).ready(function (){
   $("[name='deleteList']").click(function (){
       alert('1234')
       var orderid=$(this).parents(".panel-body").find(".orderid").text();
       console.log(orderid)
       var order={};
       order.orderid = parseInt(orderid)
       $.ajax({
           type:"POST",
           url:"/shop/deleteList",
           contentType:"application/x-www-form-urlencoded; charset=utf-8",
           data:order,
           dataType:"json",
           success:function (result){
               swal(result.msg);
               $("button").click(function (){
                   location.reload();
               });
           },
           error:function (){
               alert("删除失败");
           }
       });
   });

    $("[name='finishList']").click(function (){
        var orderid=$(this).parents(".panel-body").find(".orderid").text();
        var order={};
        order.orderid = parseInt(orderid)
        console.log(orderid)
        $.ajax({
            type:"POST",
            url:"/shop/finishList",
            contentType:"application/x-www-form-urlencoded; charset=utf-8",
            data:order,
            dataType:"json",
            success:function (result){
                swal(result.msg);
                $("button").click(function (){
                    location.reload();
                });
            },
            error:function (){
                alert("点击失败");
            }
        });
    })

    var goodsId={};

    $("[name='evaluate']").click(function (){
        $("#evaluate").modal({
            backdrop:'static'
        });
        goodsId=$(this).parents(".panel-body").find(".col-lg-1").eq(0).text();

    })

    $("#star").raty({path: '../image/img'});

    $("#saveEvaluate").click(function (){
        var score=$("[name='score']").val();
        var content=$("#description").val();
        var comment={};
        comment.commentid={};
        comment.userid={};
        comment.goodsid=goodsId;
        comment.point=score;
        comment.content=content;
        $.ajax({
            type:"POST",
            url:"/shop/comment",
            contentType:"application/x-www-form-urlencoded; charset=utf-8",
            data:comment,
            dataType:"json",
            success:function (result){
                $("#evaluate").modal('hide');
                swal(result.msg);
            },
            error:function (){
                alert("评论失败");
            }
        });


    })

});