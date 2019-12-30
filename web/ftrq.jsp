<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.lang.*" %>
<%@ page import="bean.Profile" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Images" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);

    List<Profile> profiles = Profile.getFTRQProfile();
    pageContext.setAttribute("profiles", profiles);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title>风土人情简介</title>
    <link rel="shortcut icon" href="img/favicon.ico">

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
                    <a href="index.jsp" class="navbar-brand">
                        <div class="brand-text brand-big hidden-lg-down">家乡展示</div>
                        <div class="brand-text brand-small"><img src="img/logo-icon.png" alt="Logo" class="img-fluid">
                        </div>
                    </a>
                    <a id="toggle-btn" href="#" class="menu-btn active">
                        <span></span>
                        <span></span>
                        <span></span>
                    </a>
                </div>
            </div>
            <%--            搜索条 --%>
            <jsp:include page="search-bar.jsp"/>
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
        <div class="row mt-2" id="card-prof">

            <div class="col-md-9">
                <div class="card hovercard">
                    <div class="tab" role="tabpanel">
                        <h2 class="text-lg-center h2" style="margin: 10px 10px">风土人情简介</h2>
                        <!-- Tab panes -->
                        <c:forEach var="profile" items="${profiles}" varStatus="status">
                            <div class="tab-content tabs">
                                <h2>${status.index + 1}.${profile.title}</h2>
                                <div role="tabpanel" class="tab-pane fade show active" id="prof">
                                        <%--                                简介内容--%>
                                    <p id="text-context">${profile.content}</p>
                                    <div class="row mt-3">
                                            <%--    简介图片--%>
                                        <div class="row mt-3">
                                            <c:forEach var="image" items="${profile.imageList}">
                                                <div class="col-md-4 col-sm-6 mt-1">
                                                    <div class="box-4">
                                                        <img src="${image.img}">
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
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

<script src="js/search.js"></script>
<link rel="stylesheet" href="css/search.css">

</body>

</html>