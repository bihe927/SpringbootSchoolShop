<%--
  Created by IntelliJ IDEA.
  User: zhangxin
  Date: 2019/5/13
  Time: 15:45
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<!--
Material Design Lite
Copyright 2015 Google Inc. All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License
-->
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>个人信息</title>

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

    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <%--弹窗--%>
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/adminInformation.js"></script>
    <script src="${pageContext.request.contextPath}/js/md5.js"></script>
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/templatemo-style.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sweetalert.css">
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
    </style>
</head>
<body>

<%--修改商品信息模态框--%>
<!-- Modal -->

<div class="modal fade" id="update-info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">

    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">修改个人信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update-form" name="update-form" method="post">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">昵称</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="name" id="name">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="saveInfo" >保存</button>
            </div>
        </div>
    </div>
</div>

<%--修改商品信息模态框--%>
<!-- Modal -->
<div class="modal fade" id="update-Psw" tabindex="-1" role="dialog" aria-labelledby="myModalLabelPsw">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabelPsw">修改密码</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="updatePsw-form" name="update-form" method="post">
                    <div class="form-group">
                        <label for="oldPsw" class="col-sm-2 control-label">旧密码</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" name="oldPsw" id="oldPsw">
                        </div>
                    </div>
                    <div class="form-group" style="display: none" id="oldPswError">
                        <label for="name" class="col-sm-2 control-label"></label>
                        <div class="col-sm-9">
                            <label style="color: #BD1F3B">密码错误</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="newPsw" class="col-sm-2 control-label">新密码</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" name="newPsw" id="newPsw">
                        </div>
                    </div>
                    <div class="form-group" style="display: none" id="newPswError">
                        <label for="name" class="col-sm-2 control-label"></label>
                        <div class="col-sm-9">
                            <label style="color: #BD1F3B">密码应长度大于6</label>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="savePsw" >保存</button>
            </div>
        </div>
    </div>
</div>
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
        </div>
        <div class="templatemo-content-container">
            <div class="templatemo-content-widget no-padding">
                <div class="panel panel-default table-responsive">
                    <table id="goodsinfo" class="table table-striped table-bordered templatemo-user-table">
                        <thead>
                        <tr>
                            <%--                            <a href="" class="white-text templatemo-sort-by"></a>--%>
                            <td>id<span class="caret"></span></td>
                            <td>用户名<span class="caret"></span></td>
                            <td>修改信息</td>
                                <td>修改密码</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td id="pid"></td>
                            <td id="pname"></td>
                            <td><button class="templatemo-edit-btn" id="changeInfo">修改信息</button></td>
                            <td><button class="templatemo-edit-btn" id="changePsw">修改密码</button></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
<input type="hidden" id="adminName" value="${admin.getAdminname()}">
            <input type="hidden" id="password" value="">
            <div class="pagination-wrap" id="page-div-nav">
                <div class="page-info" id="page-info-area">
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.bootcss.com/material-design-lite/1.3.0/material.min.js"></script>
</body>
</html>
