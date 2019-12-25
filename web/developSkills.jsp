<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="Java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.lang.*,java.sql.Date" %>
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

    <title> skill </title>
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
                                    <div class="notification-content"><i class="fa fa-cog"></i>...</div>
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
                <nav id="sidebar-wrapper">
                    <div class="sidebar-nav">
                        <div class="tab" role="tabpanel">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item ">
                                    <a class="nav-link active" href="#live" role="tab" data-toggle="tab"><i
                                            class="fa fa-envelope-o"></i> Message</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#trend" role="tab" data-toggle="tab"><i
                                            class="fa fa-rocket"></i> Trending</a>
                                </li>
                            </ul>
                            <%--<div class="tab-content tabs">--%>
                                <%--<div role="tabpanel" class="tab-pane fade show active" id="live">--%>
                                    <%--<!--<h3>Connect Live</h3>-->--%>
                                    <%--<div class="content newsf-list">--%>
                                        <%--<ul class="list-unstyled">--%>
                                            <%--<li class="border border-primary">--%>
                                                <%--<a rel="nofollow " href="#" class=" d-flex">--%>
                                                    <%--<div class="news-f-img"><img src="img/head.png" alt="..."--%>
                                                                                 <%--class="img-fluid rounded-circle"></div>--%>
                                                    <%--<div class="msg-body">--%>
                                                        <%--<h6 class="h5 msg-nav-h6">Jason Doe</h6>--%>
                                                        <%--<small>Sent You Message</small>--%>
                                                    <%--</div>--%>
                                                <%--</a>--%>
                                            <%--</li>--%>
                                            <%--<li class="border border-success">--%>
                                                <%--<a rel="nofollow" href="#" class=" d-flex">--%>
                                                    <%--<div class="news-f-img"><img src="img/head.png" alt="..."--%>
                                                                                 <%--class="img-fluid rounded-circle"></div>--%>
                                                    <%--<div class="msg-body">--%>
                                                        <%--<h6 class="h5 msg-nav-h6">Modified hand-cart</h6>--%>
                                                        <%--<small>The idea is to incorporate easy...</small>--%>
                                                    <%--</div>--%>
                                                <%--</a>--%>
                                            <%--</li>--%>
                                            <%--<li class="border border-info">--%>
                                                <%--<a rel="nofollow" href="#" class=" d-flex">--%>
                                                    <%--<div class="news-f-img"><img src="img/head.png" alt="..."--%>
                                                                                 <%--class="img-fluid rounded-circle"></div>--%>
                                                    <%--<div class="msg-body">--%>
                                                        <%--<h6 class="h5 msg-nav-h6">Low cost Modern printer</h6>--%>
                                                        <%--<small>A dot matrix printer modified at...</small>--%>
                                                    <%--</div>--%>
                                                <%--</a>--%>
                                            <%--</li>--%>
                                            <%--<li class="border border-primary">--%>
                                                <%--<a rel="nofollow" href="#" class=" d-flex">--%>
                                                    <%--<div class="news-f-img"><img src="img/avatar-1.jpg" alt="..."--%>
                                                                                 <%--class="img-fluid rounded-circle"></div>--%>
                                                    <%--<div class="msg-body">--%>
                                                        <%--<h6 class="h5 msg-nav-h6">Low cost Modern printer</h6>--%>
                                                        <%--<small>A dot matrix printer modified at...</small>--%>
                                                    <%--</div>--%>
                                                <%--</a>--%>
                                            <%--</li>--%>
                                            <%--<li class="border border-success">--%>
                                                <%--<a rel="nofollow" href="#" class=" d-flex">--%>
                                                    <%--<div class="news-f-img"><img src="img/avatar-2.jpg" alt="..."--%>
                                                                                 <%--class="img-fluid rounded-circle"></div>--%>
                                                    <%--<div class="msg-body">--%>
                                                        <%--<h6 class="h5 msg-nav-h6">Low cost Modern printer</h6>--%>
                                                        <%--<small>A dot matrix printer modified at...</small>--%>
                                                    <%--</div>--%>
                                                <%--</a>--%>
                                            <%--</li>--%>
                                            <%--<li class="border border-info">--%>
                                                <%--<a rel="nofollow" href="#" class=" d-flex">--%>
                                                    <%--<div class="news-f-img"><img src="img/avatar-3.jpg" alt="..."--%>
                                                                                 <%--class="img-fluid rounded-circle"></div>--%>
                                                    <%--<div class="msg-body">--%>
                                                        <%--<h6 class="h5 msg-nav-h6">Low cost Modern printer</h6>--%>
                                                        <%--<small>A dot matrix printer modified at...</small>--%>
                                                    <%--</div>--%>
                                                <%--</a>--%>
                                            <%--</li>--%>
                                            <%--<li><a rel="nofollow" href="#"--%>
                                                   <%--class="dropdown-item all-notifications text-center"> <strong>Read all--%>
                                                <%--messages </strong></a></li>--%>

                                        <%--</ul>--%>
                                    <%--</div>--%>
                                <%--</div>--%>

                            <%--</div>--%>
                        </div>
                    </div>
                </nav>
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
            <li><a href="#cc" aria-expanded="true" data-toggle="collapse" class="active"> <i class="icon-interface-windows"></i>Core
                Competence</a>
                <ul id="cc" class="collapse list-unstyled">
                    <li></li>
                    <li><a href="#">Research</a></li>
                    <li><a href="user/getScore">Score </a></li>
                    <li class="active"><a href="user/getSkill">Development Skills</a></li>
                    <li><a href="#">Rewards</a></li>
                </ul>
            </li>
            <li><a href="user/getMessage"> <i class="icon-mail"></i>MessageBoard</a></li>
        </ul>
    </nav>

    <!--***** CONTENT INNER *****-->
    <div class="content-inner" style="padding-left: 7%;padding-right: 7%;">
        <% request.setAttribute("skillsList", session.getAttribute("skills")); %>
        <!--***** develop skill learning TIMELINE *****-->
        <div class="main-timeline" id="timeline-1">

            <c:forEach var="s_skill" items="${skillsList}" varStatus="s">
                <div class="timeline">
                    <div class="timeline-icon"></div>
                    <div class="timeline-content">
                            <%--admin--%>
                        <%if (session.getAttribute("un") != null) {%>
                        <form action="<%=basePath%>user/editSkill" method="get">
                            <input type="hidden" value="${s_skill.getId()}" name="id">
                        <span class="date">
                            <input type="date" value="${s_skill.getDate()}" id="d_edit_Date" name="d_edit_Date" placeholder="Date..."
                                   style="border-style: hidden;width: 100%;display: block">
                            <% session.setAttribute("d_edit_Date", request.getParameter("d_edit_Date"));%>
                        </span>
                            <h5 class="title">
                                <input type="text" value="${s_skill.getName()}" id="d_edit_Name" name="d_edit_Name" placeholder="Name..."
                                       style="border-style: hidden;width: 100%;display: block">
                                <% session.setAttribute("d_edit_Name", request.getParameter("d_edit_Name"));%>
                            </h5>
                            <p class="description">
                                <input type="text" value="${s_skill.getDescription()}" id="d_edit_Description" name="d_edit_Description"
                                       placeholder="Description..."
                                       style="border-style: hidden;width: 100%;display: block">
                                <%
                                    session.setAttribute("d_edit_Description", request.getParameter("d_edit_Description"));%>
                            </p>
                            <button type="submit" class="btn-outline-info" style="display: inline-block;float: left">save</button>
                        </form>
                            <%--<a onclick="document.getElementById('editForm').submit()" class="btn-outline-primary" style="float: left">save<span class="fa fa-pencil-square-o "></span></a>&nbsp;&nbsp;&nbsp;--%>
                            <%--<a class="btn-outline-primary" style="float: left">save<span class="fa fa-pencil-square-o "></span></a>&nbsp;&nbsp;&nbsp;--%>
                        <a href="user/deleteSkill?id=${s_skill.getId()}" class="btn-outline-danger"
                           style="float: right">delete<span class="fa fa-remove "></span></a>
                        <%} else {%>
                        <span class="date">${s_skill.getDate()}</span>
                        <h5 class="title">${s_skill.getName()}</h5>
                        <p class="description">${s_skill.getDescription()}</p>
                        <% }%>
                    </div>
                </div>
            </c:forEach>

            <%if (session.getAttribute("un") != null) {%>
            <div class="timeline">
                <div class="timeline-icon"></div>
                <div class="timeline-content">
                    <form action="<%=basePath%>user/addSkill" method="get">
                    <span class="date">
                        <input type="text" class="" id="dDate" name="dDate" placeholder="Enter date..."
                               style="border-style: hidden">
                    </span>
                        <h5 class="title">
                            <input type="text" class="" id="dName" name="dName" placeholder="Skill's name..."
                                   style="border-style: hidden">
                        </h5>
                        <p class="description">
                            <input type="text" class="" id="dDescription" name="dDescription"
                                   placeholder="Description..." style="border-style: hidden">
                        </p>
                        <button type="submit" class="btn btn-general btn-blue mr-2">Add</button>
                    </form>
                </div>
            </div>
            <%}%>


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