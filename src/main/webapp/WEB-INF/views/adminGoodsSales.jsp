<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhangxin
  Date: 2019/5/13
  Time: 15:45
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>后台管理</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <!--
    Visual Admin Template
    http://www.templatemo.com/preview/templatemo_455_visual_admin
    -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/templatemo-style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <%--swal弹框--%>
    <script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sweetalert.css">

</head>
<body>
<!-- Left column -->
<div class="templatemo-flex-row">
    <jsp:include page="sidebar.jsp"></jsp:include>
    <!-- Main content -->
    <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-top-nav-container">
            <div class="row">
                <nav class="templatemo-top-nav col-lg-12 col-md-12">
                    <ul class="text-uppercase">

                    </ul>
                </nav>
            </div>
            <div style="
            place-content: flex-end;
            margin-top: 15px;
            margin-left: auto;
            display: flex;
            ">
                <input id="goodsName" type="text" value="" placeholder="请输入商品名称"/>
                <button class="templatemo-activity-btn" style="color: #ffffff; background-color: #39ADB4" onclick="selectGoodsByName()">查询</button>
            </div>
        </div>
        <div class="templatemo-content-container">
            <div class="templatemo-content-widget no-padding">
                <div class="panel panel-default table-responsive">
                    <table id="goodsinfo" class="table table-striped table-bordered templatemo-user-table">
                        <thead>
                        <tr>
<%--                            <a href="" class="white-text templatemo-sort-by"></a>--%>
                            <td>goodsId<span class="caret"></span></td>
                            <td>商品名<span class="caret"></span></td>
                            <td>
                                <select class="select_px" style="background-color:#39ADB4; border: 0px" name="sale" id="sale">
                                    <option value="0">销量</option>
                                    <option value="ASC">销量升序</option>
                                    <option value="DESC">销量降序</option>
                                </select>
                            </td>
                            <td>
                                <select class="select_cate" style="background-color:#39ADB4; border: 0px ">
                                </select>
                            </td>
<%--                            <td><a href="" class="white-text templatemo-sort-by">分类<span class="caret"></span></a></td>--%>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>

            <div class="pagination-wrap" id="page-div-nav">
                <div class="page-info" id="page-info-area">
                </div>
            </div>
        </div>
    </div>
</div>
<div id="path" style="display: none;">${pageContext.request.contextPath}</div>
<div id="categoryid"  style="display: none;">${categoryid}</div>
<!-- JS -->
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
<script src="${pageContext.request.contextPath}/js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
<%--<script src="https://www.google.com/jsapi"></script> <!-- Google Chart -->--%>
<script>

</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/templatemo-script.js"></script>      <!-- Templatemo Script -->
<script src="${pageContext.request.contextPath}/js/adminGoodsSales.js"></script>
</body>
</html>
