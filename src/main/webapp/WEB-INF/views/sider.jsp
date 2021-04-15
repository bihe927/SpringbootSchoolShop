<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="demo-drawer mdl-layout__drawer ">
    <ul id="test" class="nav nav-pills nav-stacked">
        <li><a class="mdl-navigation__link" href="${pageContext.request.contextPath}/main" style="color: black"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">home</i>主页</a></li>
        <li><a class="mdl-navigation__link" onclick="get()" href="javascript:js_method();"  style="color: black"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">inbox</i>个人信息</a></li>
        <li><a class="mdl-navigation__link" href="${pageContext.request.contextPath}/info/list" style="color: black"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">forum</i>订单管理</a></li>
        <li><a class="mdl-navigation__link" href="${pageContext.request.contextPath}/info/address" style="color: black"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">local_offer</i>地址管理</a></li>
        <li><a class="mdl-navigation__link" href="${pageContext.request.contextPath}/info/favorite" style="color: black"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">flag</i>我的收藏</a></li>
    </ul>
</div>

<div id="path" style="display: none;">${pageContext.request.contextPath}</div>
<script type="text/javascript">

    function get() {
        let path = $("#path").text();
        $.ajax({
            type: "GET",
            url: path+"/information",
            contentType:"application/x-www-form-urlencoded; charset=utf-8",
            success: function(result){
                if (result.msg=="更新失败")
                {
                    swal(result.msg);
                }
                else {
                    window.location.href = path+"/information";
                }
            },
            error:function (){
                alert("更新失败");
            }
        });
    }
</script>