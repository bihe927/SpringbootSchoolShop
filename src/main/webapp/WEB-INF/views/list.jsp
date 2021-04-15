<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhangxin
  Date: 2019/5/13
  Time: 15:45
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Pragma","No-cache");
    response.setHeader("Cache-Control","no-cache");
    response.setDateHeader("Expires", 0);
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>个人信息-我的订单</title>

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="images/android-desktop.png">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Material Design Lite">
    <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">

    <link rel="shortcut icon" href="images/favicon.png">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
    <link rel="canonical" href="http://www.example.com/">
    -->

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link href="https://cdn.bootcss.com/material-design-lite/1.3.0/material.cyan-light_blue.min.css" rel="stylesheet">
   <%-- <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.cyan-light_blue.min.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/infostyle.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/list.js"></script>
    <script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sweetalert.css">
    <script src="${pageContext.request.contextPath}/js/distpicker.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.raty.js"></script>

    <style>
        #view-source {
            position: fixed;
            display: block;
            right: 0;
            bottom: 0;
            margin-right: 40px;
            margin-bottom: 40px;
            z-index: 900;
        }

        .templatemo-blue-button {
            background-color: #39ADB4;
            border: none;
            color: white;
        }

        .no-border{border: 0px solid transparent !important;}

        .bs-example {
            position: relative;
            padding: 45px 15px 15px;
            margin: 0 -15px 15px;
            border-color: #e5e5e5 #eee #eee;
            border-style: solid;
            border-width: 1px 0;
            -webkit-box-shadow: inset 0 3px 6px rgba(0,0,0,.05);
            box-shadow: inset 0 3px 6px rgba(0,0,0,.05);
        }

        .finish-btn{
            background-color:#e65b0e !important;
        }

        .font-color{
            color: #00BBD6; !important;
        }


    </style>
</head>
<body>

<%--修改商品信息模态框--%>
<!-- Modal -->
<div class="modal fade" id="evaluate" tabindex="-1" role="dialog" aria-labelledby="myModalLabelPsw">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabelPsw">商品评价</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="updatePsw-form" name="update-form" method="post">
                    <div class="form-group">
                        <label for="star" class="col-sm-2 control-label">商品评分</label>
                        <div class="col-sm-9">
                            <div id="star" data-num="3.5"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-sm-2 control-label">详细描述</label>
                        <div class="col-sm-9">
                            <textarea class="form-control" rows="3" id="description"></textarea>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="saveEvaluate" >保存</button>
            </div>
        </div>
    </div>
</div>
<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
    <header class="demo-header mdl-layout__header mdl-color--grey-100 mdl-color-text--grey-600">
        <div class="mdl-layout__header-row">
            <span class="mdl-layout-title" style="color: #0f0f0f">订单管理</span>
            <div class="mdl-layout-spacer"></div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
            </div>
        </div>
    </header>
    <jsp:include page="sider.jsp"></jsp:include>
    <main class="mdl-layout__content mdl-color--grey-100">
            <div class="mdl-grid demo-content" id="parent">
                <c:forEach items="${orderList}" var="order">
                <c:if test="${!order.issend}">
                <div class="panel panel-danger" style="width: 100%">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                                未发货
                        </h3>
                    </div>
                    <div class="panel-body">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>订单号</th>
                                                <th>订单日期</th>
                                                <th>收货地址</th>
                                                <th>原价</th>
                                                <th>现价</th>
                                                <th>商品号</th>
                                                <th>商品名称</th>
                                                <th>价格</th>
                                                <th>数量</th>
                                            </tr>
                                            </thead>
                                            <c:forEach items="${order.goodsInfo}" var="good">
                                            <tbody>
                                            <tr class="active">
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${order.orderid}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                <td>${order.ordertime.year+1900} 年
                                                        ${order.ordertime.month+1} 月
                                                        ${order.ordertime.date} 日
                                                </td>
                                                <td>${order.address.province}
                                                        ${order.address.city}
                                                        ${order.address.county}
                                                </td>
                                                <td>${order.oldprice}</td>
                                                <td>${order.newprice}</td>
                                                <td class="col-lg-1">
                                                        ${good.goodsid}
                                                </td>
                                                <td class="col-lg-2">
                                                    <a href="${pageContext.request.contextPath}/detail?goodsid=${good.goodsid}">${good.goodsname}</a>
                                                </td>
                                                <td class="col-lg-1">
                                                        ${good.price}
                                                </td>
                                                <td class="col-lg-1">
                                                        ${order.num}
                                                </td>
                                            </tr>
                                            </tbody>
                                            </c:forEach>
                                        </table>
                                    </div>
                </div>
                </c:if>
                    <c:if test="${order.issend&&!order.isreceive}">
                <div class="panel panel-info" style="width: 100%">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            未收货
                        </h3>
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>订单号</th>
                                <th>订单日期</th>
                                <th>收货地址</th>
                                <th>原价</th>
                                <th>现价</th>
                                <th>商品号</th>
                                <th>商品名称</th>
                                <th>价格</th>
                                <th>数量</th>
                            </tr>
                            </thead>
                            <c:forEach items="${order.goodsInfo}" var="good">
                                <tbody>
                                <tr class="warning">


                                    <td class="orderid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${order.orderid}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

                                    <td>${order.ordertime.year+1900} 年
                                            ${order.ordertime.month+1} 月
                                            ${order.ordertime.date} 日
                                    </td>
                                    <td>${order.address.province}
                                            ${order.address.city}
                                            ${order.address.county}
                                    </td>
                                    <td>${order.oldprice}</td>
                                    <td>${order.newprice}</td>
                                    <td class="col-lg-1">
                                            ${good.goodsid}
                                    </td>
                                    <td class="col-lg-2">
                                        <a href="${pageContext.request.contextPath}/detail?goodsid=${good.goodsid}">${good.goodsname}</a>
                                    </td>
                                    <td class="col-lg-1">
                                            ${good.price}
                                    </td>
                                    <td class="col-lg-1">
                                            ${order.num}
                                    </td>
                                </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                        <div class="mdl-card__actions mdl-card--border">
                            <button type="button" name="finishList" class="btn btn-success">确认收货</button>
                        </div>
                    </div>
                </div>
                    </c:if>
                    <c:if test="${order.iscomplete}">
                <div class="panel panel-success" style="width: 100%">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            已完成
                        </h3>
                    </div>
                    <div class="panel-body">

                        <table class="table">
                            <thead>
                            <tr>
                                <th>订单号</th>
                                <th>订单日期</th>
                                <th>收货地址</th>
                                <th>原价</th>
                                <th>现价</th>
                                <th>商品号</th>
                                <th>商品名称</th>
                                <th>价格</th>
                                <th>数量</th>
                            </tr>
                            </thead>
                            <c:forEach items="${order.goodsInfo}" var="good">
                                <tbody>
                                <tr class="success">
                                    <td class="orderid">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${order.orderid}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td>${order.ordertime.year+1900} 年
                                            ${order.ordertime.month+1} 月
                                            ${order.ordertime.date} 日
                                    </td>
                                    <td>${order.address.province}
                                            ${order.address.city}
                                            ${order.address.county}
                                    </td>
                                    <td>${order.oldprice}</td>
                                    <td>${order.newprice}</td>
                                    <td class="col-lg-1">
                                            ${good.goodsid}
                                    </td>
                                    <td class="col-lg-2">
                                        <a href="${pageContext.request.contextPath}/detail?goodsid=${good.goodsid}">${good.goodsname}</a>
                                    </td>
                                    <td class="col-lg-1">
                                            ${good.price}
                                    </td>
                                    <td class="col-lg-1">
                                            ${order.num}
                                    </td>
                                    <td>
                                        <button type="button" name="evaluate" class="btn btn-default">评价</button>
                                    </td>
                                </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                        <div class="mdl-card__actions mdl-card--border">
                            <button type="button" name="deleteList" class="btn btn-danger">删除订单</button>
                        </div>
                    </div>

                </div>
                    </c:if>
                </c:forEach>
            </div>
    </main>
</div>
<%--<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>--%>
<script src="https://cdn.bootcss.com/material-design-lite/1.3.0/material.min.js"></script>
</body>
</html>
