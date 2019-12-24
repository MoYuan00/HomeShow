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
            <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
				<%if (session.getAttribute("un") != null) {%>
					<li>
						<a rel="nofollow" href="user/logout" class="dropdown-item">
							<div class="notification">
								<div class="notification-content"><i class="fa fa-power-off"></i>
									登出
								</div>
							</div>
						</a>
					</li>
				<%} else {%>
					<li>
						<a rel="nofollow" href="login.jsp" class="dropdown-item">
							<div class="notification">
								<div class="notification-content"><i class="fa fa-power-off"></i>
									登录
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
				<%}%>
            </ul>
        </div>
    </nav>
</header>

<!--====================================================
                        PAGE CONTENT
======================================================-->
<div class="page-content d-flex align-items-stretch">

    <!--***** SIDE NAVBAR *****-->
    <nav class="side-navbar">
        <!-- Sidebar Navidation Menus-->
        <%if (session.getAttribute("un") != null) {%>
        <ul class="list-unstyled">
            <li class="active"><a href="index.jsp"> <i class="fa fa-user-o"></i>美景管理</a></li>
            <li><a href="user/getProfile"> <i class="fa fa-user-o"></i>美食管理</a></li>
            <li><a href="tese.jsp"> <i class="fa fa-user-o"></i>风土人情管理</a></li>
            <li><a href="user/getMessage"> <i class="fa fa-user-o"></i>留言管理</a></li>
        </ul>
        <%} else {%>
        <ul class="list-unstyled">
            <li class="active"><a href="index.jsp"> <i class="fa fa-user-o"></i>首页</a></li>
            <li><a href="user/getProfile"> <i class="fa fa-user-o"></i>家乡简介</a></li>
            <li><a href="tese.jsp"> <i class="fa fa-user-o"></i>特色介绍</a></li>
            <li><a href="user/getMessage"><i class="fa fa-user-o"></i>游客留言</a></li>
        </ul>
        <%}%>
    </nav>

    <!--***** CONTENT INNER *****-->
    <div class="content-inner col-md-9" style="">

        <div id="demo" class="carousel slide" data-ride="carousel">
            <!-- 指示符 -->
            <ul class="carousel-indicators" style="">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>
            <!-- 轮播图片 -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="./img/w1.jpg" class="img-fluid" style="border-radius: 10%; width:1560px; height:800px;"
                         alt="img-1">
                </div>
                <div class="carousel-item">
                    <img src="./img/w2.jpg" class="img-fluid" style="border-radius: 10%; width:1560px; height:800px;"
                         alt="img-2">
                </div>
                <div class="carousel-item">
                    <img src="./img/w3.jpg" class="img-fluid" style="border-radius: 10%; width:1560px; height:800px;"
                         alt="img-3">
                </div>
            </div>
            <!-- 左右切换按钮 -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev" style="">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next" style="">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>

        <div style="margin-top: 50px;">
            <a href=""><img src="./img/w1.jpg" class="img-fluid"
                            style="border-radius: 10%; width: 250px; margin: 0 10px;" alt="img-1"></a>
            <a href=""><img src="./img/w2.jpg" class="img-fluid"
                            style="border-radius: 10%; width: 250px; margin: 0 10px;" alt="img-2"></a>
            <a href=""><img src="./img/w3.jpg" class="img-fluid"
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