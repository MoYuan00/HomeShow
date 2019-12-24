<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.lang.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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

    <title> 家乡简介 </title>
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
    <link rel="stylesheet" href="css/ui-elements/timeline.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/pages/gallery.css">
    <link rel="stylesheet" href="css/apps/media.css">
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
                        <div class="brand-text brand-small"><img src="img/logo-icon.png" alt="Logo" class="img-fluid"></div>
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
                <a rel="nofollow" href="log/toLogout" class="dropdown-item">
                        <%} else {%>
                    <a rel="nofollow" href="login.jsp" class="dropdown-item">
                        <%}%>
                        <div class="notification">
                            <div class="notification-content"><i class="fa fa-power-off"></i>
                                <%if (session.getAttribute("un") != null) {%>
                                <%=session.getAttribute("un")%> 登出
                                <%} else {%>
                                登录
                                <%}%>
                            </div>
                        </div>
                    </a>
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
            <li class="active"> <a href="index.jsp"> <i class="fa fa-user-o"></i>美景管理</a></li>
            <li> <a href="user/getProfile"> <i class="fa fa-user-o"></i>美食管理</a></li>
            <li> <a href="tese.jsp" > <i class="fa fa-user-o"></i>风土人情管理</a></li>
            <li> <a href="user/getMessage"> <i class="fa fa-user-o"></i>留言管理</a></li>
        </ul>
        <%}else{%>
        <ul class="list-unstyled">
            <li class="active"> <a href="index.jsp"> <i class="fa fa-user-o"></i>首页</a></li>
            <li> <a href="user/getProfile"> <i class="fa fa-user-o"></i>家乡简介</a></li>
            <li> <a href="tese.jsp" > <i class="fa fa-user-o"></i>特色介绍</a></li>
            <li> <a href="user/getMessage"> <i class="fa fa-user-o"></i>个人简介</a></li>
        </ul>
        <%}%>
    </nav>

    <!--***** CONTENT INNER *****-->
    <div class="content-inner chart-cont">

        <!--***** CONTENT *****-->
        <div class="row mt-2" id="card-prof">

            <div class="col-md-9">
                <div class="card hovercard">
                    <div class="tab" role="tabpanel">

                        <!-- Tab panes -->
                        <div class="tab-content tabs">
                            <div role="tabpanel" class="tab-pane fade show active" id="prof">
                                <p> <%=session.getAttribute("content")%> </p>

                                <div class="row mt-3">
                                <%
                                List< String > list =(ArrayList< String >) session.getAttribute("list");
                                if(list != null){
                                String html = "";
                                    for (String img : list) {
                                    %>
                                        <div class="col-md-4 col-sm-6 mt-1">
                                            <div class="box-4">
                                                <img src="<%=img%>">
                                            </div>
                                        </div>
                                    <%
                                    }
                                }
                                %>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="buzz">
                                <div class="panel panel-default widget">
                                    <div class="panel-heading">
                                        <h3 class="panel-title"><i class="fa fa-comment"></i> Social Media~</h3>
                                    </div>

                                    <div class="row" id="report4">
                                        <div class="col-md-6">
                                            <div class="card text-center social-bottom sb-fb">
                                                <i class="fa fa-facebook"></i>
                                                <div>200 +</div>
                                                <p>Likes</p>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="card text-center social-bottom sb-tw">
                                                <i class="fa fa-twitter"></i>
                                                <div>50 +</div>
                                                <p>Following</p>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="img-wrapper" style="">
                                                <a href="img/wechat.jpg" title="Add if u want">
                                                    <img src="img/wechat.jpg" class="img-fluid" alt="Work" style="align-items: center;">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="card text-center social-bottom sb-in">
                                                <i class="fa fa-instagram"></i>
                                                <div>50 +</div>
                                                <p>Followers</p>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
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
<script>
</script>


</body>

</html>