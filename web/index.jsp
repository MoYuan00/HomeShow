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

    <title>家乡展示管理</title>
    <link rel="shortcut icon" href="img/favicon.ico">

    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/font-icon-style.css">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="css/ui-elements/card.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

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
            <%--            登录注册--%>
            <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <c:choose>
                    <c:when test="${sessionScope.un != null}">
                        <li>
                            <a rel="nofollow" href="${path}user/logout" class="dropdown-item">
                                <div class="notification">
                                    <div class="notification-content">
                                        <i class="fa fa-power-off"></i>登出
                                    </div>
                                </div>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a rel="nofollow" href="login.jsp" class="dropdown-item">
                                <div class="notification">
                                    <div class="notification-content">
                                        <i class="fa fa-power-off"></i>登录
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a rel="nofollow" href="register.jsp" class="dropdown-item">
                                <div class="notification">
                                    <div class="notification-content"><i class="fa fa-power-off"></i>
                                        注册
                                    </div>
                                </div>
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </nav>
</header>

<!--====================================================
                        PAGE CONTENT
======================================================-->
<div class="page-content d-flex align-items-stretch">

    <!--***** SIDE NAVBAR *****-->
    <%--    侧边导航栏--%>
    <nav class="side-navbar">
        <!-- Sidebar Navidation Menus-->
        <jsp:include page="nav-ul.jsp"/>
    </nav>

    <!--***** CONTENT INNER *****-->
    <div class="content-inner col-md-9" >
        <div style="padding: 10px">
            <p class="text-info">
                <strong>北京</strong>被世界权威机构GaWC评为世界一线城市  。截至2018年末，北京常住人口2154.2万人，实现地区生产总值（GDP）30320亿元，人均地区生产总值实现14万元    。社会消费品零售总额11747.7亿元，批发业销售额57383.1亿元，人均可支配收入62361元，住户存款总额32507.8亿元，高新技术企业总数24691家  。联合国报告指出北京人类发展指数居中国城市第二位。
            </p>
        </div>
        <div id="demo" class="carousel slide" data-ride="carousel">
            <!-- 指示符 -->
            <ul class="carousel-indicators" style="">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
                <li data-target="#demo" data-slide-to="3"></li>
            </ul>
            <!-- 轮播图片 -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="./img/index1.png" class="img-fluid" style="border-radius: 10%; width:100%; height:400px;"
                         alt="img-2">
                </div>
                <div class="carousel-item">
                    <img src="./img/index2.png" class="img-fluid" style="border-radius: 10%; width:100%; height:400px;"
                         alt="img-2">
                </div>
                <div class="carousel-item">
                    <img src="./img/index3.png" class="img-fluid" style="border-radius: 10%; width:100%; height:400px;"
                         alt="img-3">
                </div>
                <div class="carousel-item">
                    <img src="./img/index4.png" class="img-fluid" style="border-radius: 10%; width:100%; height:400px;"
                         alt="img-4">
                </div>
            </div>
            <!-- 左右切换按钮 -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev"  >
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next" >
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>

        <div style="margin-top: 50px;">
            <a href=""><img src="./img/index1.png" class="img-fluid"
                            style="border-radius: 10%; width: 250px; margin: 0 10px;" alt="img-1"></a>
            <a href=""><img src="./img/index2.png" class="img-fluid"
                            style="border-radius: 10%; width: 250px; margin: 0 10px;" alt="img-2"></a>
            <a href=""><img src="./img/index3.png" class="img-fluid"
                            style="border-radius: 10%; width: 250px; margin: 0 10px;" alt="img-3"></a>
            <a href=""><img src="./img/index4.png" class="img-fluid"
                            style="border-radius: 10%; width: 250px; margin: 0 10px;" alt="img-3"></a>
        </div>
    </div>
</div>


<!--Global Javascript -->
<script src="js/jquery.min.js"></script>
<script src="js/popper/popper.min.js"></script>
<script src="js/tether.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.cookie.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/chart.min.js"></script>
<script src="js/front.js"></script>

<!--Core Javascript -->
<%--<script src="js/mychart.js"></script>--%>

</body>

</html>