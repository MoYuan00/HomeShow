<%--
  Created by IntelliJ IDEA.
  User: -ZQ-
  Date: 2019/12/25
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.lang.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title>美食管理</title>
    <link rel="shortcut icon" href="${path}img/favicon.ico">

    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="${path}css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${path}css/font-icon-style.css">
    <link rel="stylesheet" href="${path}css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="${path}css/ui-elements/card.css">
    <link rel="stylesheet" href="${path}css/style.css">
    <link rel="stylesheet" href="${path}css/ui-elements/timeline.css">
    <link rel="stylesheet" href="${path}css/profile.css">
    <link rel="stylesheet" href="${path}css/pages/gallery.css">
    <link rel="stylesheet" href="${path}css/apps/media.css">
    <!-- jstl -->
    <%--<%@ taglib prefix="co" uri="http://java.sun.com/jsp/jstl/core" %>--%>
</head>

<body>

<!--====================================================
                         MAIN NAVBAR
======================================================-->
<header class="header">
    <nav class="navbar navbar-expand-lg ">
        <div class="search-box">
            <button class="dismiss"><i class="icon-close"></i></button>
            <form id="searchForm" action="#" role="search">
                <input type="search" placeholder="Search Now" class="form-control">
            </form>
        </div>
        <div class="container-fluid ">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
                <div class="navbar-header">
                    <a href="${path}index.jsp" class="navbar-brand">
                        <div class="brand-text brand-big hidden-lg-down">家乡展示</div>
                        <div class="brand-text brand-small"><img src="${path}img/logo-icon.png" alt="Logo"
                                                                 class="img-fluid">
                        </div>
                    </a>
                    <a id="toggle-btn" href="#" class="menu-btn active">
                        <span></span>
                        <span></span>
                        <span></span>
                    </a>
                </div>
            </div>
            <%--            菜单的注册或者登陆按钮 --%>
            <jsp:include page="login-regiset-menu-item.jsp"/>
        </div>
    </nav>
</header>

<!-- ====================================================
                        PAGE CONTENT
====================================================== -->
<div class="page-content d-flex align-items-stretch">

    <!--***** SIDE NAVBAR *****-->
    <nav class="side-navbar">
        <!-- Sidebar Navidation Menus-->
        <jsp:include page="nav-ul.jsp"/>
    </nav>

    <!--***** CONTENT INNER *****-->
    <div class="content-inner chart-cont">

        <!--***** CONTENT *****-->
        <div class="row mt-2">

            <div class="col-md-9">
                <div class="card hovercard">
                    <div class="tab" role="tabpanel">
                        <!-- Tab panes -->
                        <h2>美食管理</h2>
                        <div class="pull-right">
                            <jsp:include page="profile-add.jsp">
                                <jsp:param name="jumpPath" value="foodManager.jsp"/>
                                <jsp:param name="type" value="food"/>
                            </jsp:include>
                        </div>
                        <jsp:include page="manager-all.jsp">
                            <jsp:param name="type" value="food"/>
                            <jsp:param name="jumpPath" value="foodManager.jsp"/>
                        </jsp:include>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!--Global Javascript -->
<script src="${path}js/jquery.min.js"></script>
<script src="${path}js/popper/popper.min.js"></script>
<script src="${path}js/tether.min.js"></script>
<script src="${path}js/bootstrap.min.js"></script>
<script src="${path}js/jquery.cookie.js"></script>
<script src="${path}js/jquery.validate.min.js"></script>
<script src="${path}js/chart.min.js"></script>
<script src="${path}js/front.js"></script>

<!--Core Javascript -->
<script>
</script>


</body>

</html>