<%--
    个人信息页面 - 当前系统没有使用 - 没有个人信息查看和管理功能
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="Java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.lang.*" %>
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

    <title> Profile </title>
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
    <nav class="navbar navbar-expand-lg">
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
                        <div class="brand-text brand-big hidden-lg-down">Mr.wHo's Website</div>
                        <div class="brand-text brand-small">
                            <img src="img/logo-icon.png" alt="Logo" class="img-fluid">
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
                <li class="nav-item d-flex align-items-center"><a id="search" class="nav-link" href="#"><i
                        class="icon-search"></i></a></li>
                <!-- Messages-->
                <li class="nav-item dropdown"><a id="profile" class="nav-link logout" data-target="#" href="profile.jsp"
                                                 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <div class="photo">
                        <%
                            request.setAttribute("NAME", session.getAttribute("un"));
                            if (session.getAttribute("un") != null) {
                        %>
                        <img src="img/head.png" alt="..." class="img-fluid rounded-circle"
                             style="height: 35px; width: 35px;">
                        <%
                        } else {
                        %>
                        <img src="img/work/3.jpg" alt="..." class="img-fluid rounded-circle"
                             style="height: 40px; width: 40px;">
                        <%
                            }
                        %>
                    </div>
                </a>
                    <ul aria-labelledby="profile" class="dropdown-menu profile">
                        <li>
                            <a rel="nofollow" href="#" class="dropdown-item d-flex">
                                <div class="msg-profile">
                                    <div class="photo">
                                        <%
                                            request.setAttribute("NAME", session.getAttribute("un"));
                                            if (session.getAttribute("un") != null) {
                                        %>
                                        <img src="img/head.png" alt="..." class="img-fluid rounded-circle">
                                        <%
                                        } else {
                                        %>
                                        <img src="img/work/3.jpg" alt="..." class="img-fluid rounded-circle">
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="msg-body">
                                    <h3 class="h5">Mr.wHo</h3><span>huhanlin@bjfu.edu.cn</span>
                                </div>
                            </a>
                            <hr>
                        </li>
                        <li>
                            <a rel="nofollow" href="profile.jsp" class="dropdown-item">
                                <div class="notification">
                                    <div class="notification-content"><i class="fa fa-user "></i>My Profile</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a rel="nofollow" href="profile.jsp" class="dropdown-item">
                                <div class="notification">
                                    <div class="notification-content"><i class="fa fa-cog"></i>To be continue...</div>
                                </div>
                            </a>
                            <hr>
                        </li>
                        <li>
                            <%if (session.getAttribute("un") != null) {%>
                            <a rel="nofollow" href="log/toLogout" class="dropdown-item">
                                    <%} else {%>
                                <a rel="nofollow" href="login.jsp" class="dropdown-item">
                                    <%}%>
                                    <div class="notification">
                                        <div class="notification-content"><i class="fa fa-power-off"></i>
                                            <%if (session.getAttribute("un") != null) {%>
                                            Logout
                                            <%} else {%>
                                            Login
                                            <%}%>
                                        </div>
                                    </div>
                                </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item d-flex align-items-center"><a id="menu-toggle-right" class="nav-link" href="#"><i
                        class="fa fa-bars"></i></a></li>

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
        <div class="sidebar-header d-flex align-items-center">
            <div class="photo">
                <%
                    request.setAttribute("NAME", session.getAttribute("un"));
                    if (session.getAttribute("un") != null) {
                %>
                <img src="img/head.png" alt="..." class="img-fluid rounded-circle" style="height: 50px; width: 50px;">
                <%
                } else {
                %>
                <img src="img/work/3.jpg" alt="..." class="img-fluid rounded-circle" style="height: 50px; width: 50px;">
                <%
                    }
                %>
            </div>
            <div class="title">
                <h1 class="h4">Hi, ${NAME}</h1>
            </div>
        </div>
        <hr>
        <!-- Sidebar Navidation Menus-->
        <ul class="list-unstyled">
            <li><a href="index.jsp"><i class="icon-home"></i>Home</a></li>
            <li><a href="profile.jsp"> <i class="fa fa-user-o"></i>Profile</a></li>
            <li><a href="#cc" aria-expanded="false" data-toggle="collapse" class="active"> <i
                    class="icon-interface-windows"></i>Core
                Competence</a>
                <ul id="cc" class="collapse list-unstyled">
                    <li></li>
                    <li><a href="#">Research</a></li>
                    <li><a href="user/getScore">Score </a></li>
                    <li><a href="user/getSkill">Development Skills</a></li>
                    <li><a href="#">Rewards</a></li>
                </ul>
            </li>
            <li><a href="messageBoard.jsp"> <i class="icon-mail"></i>MessageBoard</a></li>
        </ul>
    </nav>

    <!--***** CONTENT INNER *****-->
    <div class="content-inner chart-cont">

        <!--***** CONTENT *****-->
        <div class="row mt-2" id="card-prof">
            <div class="col-md-3">
                <div class="card hovercard">
                    <div class="cardheader" style="background: url('img/bg-i.jpg');"></div>
                    <div class="avatar">
                        <img alt="" src="img/head.png" class="img-fluid">
                    </div>
                    <div class="info">
                        <div class="title">
                            <a target="_blank" href="#">Mr.wHo</a>
                        </div>
                        <div class="desc">huhanlin@bjfu.edu.cn</div>
                        <hr>
                    </div>
                    <nav class="nav text-center prof-nav">
                        <ul class="list-unstyled">
                            <li><a href="#prof">Profile</a></li>
                            <li><a href="#buzz">AddME</a></li>
                            <li><a href="#hobby">...</a></li>
                        </ul>
                    </nav>
                    <div class="bottom">
                        <a class="btn btn-info btn-twitter btn-sm" href="#">
                            <i class="fa fa-twitter"></i>
                        </a>
                        <a class="btn btn-danger btn-sm" rel="publisher"
                           href="#">
                            <i class="fa fa-google-plus"></i>
                        </a>
                        <a class="btn btn-primary btn-sm" rel="publisher"
                           href="#">
                            <i class="fa fa-facebook"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="card hovercard">
                    <div class="tab" role="tabpanel">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item ">
                                <a class="nav-link active" href="#prof" role="tab" data-toggle="tab"><span><i
                                        class="fa fa-user"></i></span> Profile</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#buzz" role="tab" data-toggle="tab"><span><i
                                        class="fa fa-wechat"></i></span> AddME</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#hobby" role="tab" data-toggle="tab"><span><i
                                        class="fa fa-cog"></i></span> ...</a>
                            </li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content tabs">
                            <div role="tabpanel" class="tab-pane fade show active" id="prof">
                                <p> This is hhl's website. It's my Pleasure to see u. :)  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nec urna aliquam,
                                    ornare eros vel, malesuada lorem. Nullam faucibus lorem at eros consectetur
                                    lobortis. Maecenas nec nibh congue, placerat sem id, rutrum velit. </p>


                                <div class="row mt-3">
                                    <div class="col-md-4 col-sm-6 mt-1">
                                        <div class="box-4">
                                            <img src="img/basketball.png">
                                            <div class="box-4-content">
                                                <h3 class="title">BasketBall</h3>
                                                <ul class="icon">
                                                    <li><a href="#"><i class="fa fa-star"></i></a>My favourite Sport
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 mt-1">
                                        <div class="box-4">
                                            <img src="img/work/1.jpg">
                                            <div class="box-4-content">
                                                <h3 class="title">Reading</h3>
                                                <ul class="icon">
                                                    <li><a href="#"><i class="fa fa-book"></i></a>Reading Makes a Better Life
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 mt-1">
                                        <div class="box-4">
                                            <img src="img/work/6.jpg">
                                            <div class="box-4-content">
                                                <h3 class="title">Game</h3>
                                                <ul class="icon">
                                                    <li><a href="#"><i class="fa fa-gamepad"></i></a>Just Relax :)
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="row mt-2">
                                    <h5 class="col-12 mb-2">My Info</h5>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <strong class="mr-5"><i class="fa fa-envelope"> E-mail: </i></strong>
                                            huhanlin@bjfu.edu.cn
                                        </div>
                                        <div class="form-group">
                                            <strong class="mr-5"><i class="fa fa-phone"> Phone: </i></strong> +86 1326
                                            0177 663
                                        </div>
                                        <div class="form-group">
                                            <strong class="mr-5"><i class="fa fa-map"> City: </i></strong> Beijing
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <strong class="mr-5"><i class="fa fa-globe"> Country: </i></strong> China
                                        </div>
                                        <div class="form-group">
                                            <strong class="mr-5"><i class="fa fa-map-marker"> Address: </i></strong>
                                            Beijing Forestry University 35, East Qinghua Road, Haidian District,
                                            Beijing, P. R. China
                                        </div>
                                        <div class="form-group">
                                            <strong class="mr-5"><i class="fa fa-globe"> Website: </i></strong>
                                            www.Mr_wHo.com
                                        </div>
                                    </div>
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
    // new Chart(document.getElementById("myChart-nav").getContext('2d'), {
    //     type: 'doughnut',
    //     data: {
    //         labels: ["M", "T", "W", "T", "F", "S", "S"],
    //         datasets: [{
    //             backgroundColor: [
    //                 "#2ecc71",
    //                 "#3498db",
    //                 "#95a5a6",
    //                 "#9b59b6",
    //                 "#f1c40f",
    //                 "#e74c3c",
    //                 "#34495e"
    //             ],
    //             data: [12, 19, 3, 17, 28, 24, 7]
    //         }]
    //     },
    //     options: {
    //         legend: { display: false },
    //         title: {
    //             display: true,
    //             text: ''
    //         }
    //     }
    // });
</script>


</body>

</html>