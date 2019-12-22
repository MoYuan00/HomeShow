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

    <title>留言板</title>
    <link rel="shortcut icon" href="img/favicon.ico">

    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/font-icon-style.css">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="css/pages/faq.css">
    <link rel="stylesheet" href="css/apps/email.css">
</head>

<body>

<!--====================================================
                         MAIN NAV BAR
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
                <li class="nav-item dropdown"><a id="profile" class="nav-link logout" data-target="#"
                                                 href="profile.jsp" data-toggle="dropdown" aria-haspopup="true"
                                                 aria-expanded="false">
                    <div class="photo">
                        <%
                            request.setAttribute("NAME", session.getAttribute("un"));
                            if (session.getAttribute("un") != null) {
                        %>
                        <img src="img/head.png" alt="..." class="img-fluid rounded-circle"
                             style="height: 50px; width: 50px;">
                        <%
                        } else {
                        %>
                        <img src="i¨mg/work/3.jpg" alt="..." class="img-fluid rounded-circle"
                             style="height: 50px; width: 50px;">
                        <%
                            }
                        %>
                    </div>
                </a>
                    <ul aria-labelledby="profile" class="dropdown-menu profile">
                        <li>
                            <a rel="nofollow" href="#" class="dropdown-item d-flex">
                                <div class="msg-profile">
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
                                    <%--<a rel="nofollow" href="log/toLogout" class="dropdown-item">--%>
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
                            <div class="tab-content tabs">
                                <div role="tabpanel" class="tab-pane fade show active" id="live">
                                    <!--<h3>Connect Live</h3>-->
                                    <div class="content newsf-list">
                                        <ul class="list-unstyled">
                                            <li class="border border-primary">
                                                <a rel="nofollow " href="#" class=" d-flex">
                                                    <div class="news-f-img"><img src="img/head.png" alt="..."
                                                                                 class="img-fluid rounded-circle"></div>
                                                    <div class="msg-body">
                                                        <h6 class="h5 msg-nav-h6">Jason Doe</h6>
                                                        <small>Sent You Message</small>
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="border border-success">
                                                <a rel="nofollow" href="#" class=" d-flex">
                                                    <div class="news-f-img"><img src="img/head.png" alt="..."
                                                                                 class="img-fluid rounded-circle"></div>
                                                    <div class="msg-body">
                                                        <h6 class="h5 msg-nav-h6">Modified hand-cart</h6>
                                                        <small>The idea is to incorporate easy...</small>
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="border border-info">
                                                <a rel="nofollow" href="#" class=" d-flex">
                                                    <div class="news-f-img"><img src="img/head.png" alt="..."
                                                                                 class="img-fluid rounded-circle"></div>
                                                    <div class="msg-body">
                                                        <h6 class="h5 msg-nav-h6">Low cost Modern printer</h6>
                                                        <small>A dot matrix printer modified at...</small>
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="border border-primary">
                                                <a rel="nofollow" href="#" class=" d-flex">
                                                    <div class="news-f-img"><img src="img/avatar-1.jpg" alt="..."
                                                                                 class="img-fluid rounded-circle"></div>
                                                    <div class="msg-body">
                                                        <h6 class="h5 msg-nav-h6">Low cost Modern printer</h6>
                                                        <small>A dot matrix printer modified at...</small>
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="border border-success">
                                                <a rel="nofollow" href="#" class=" d-flex">
                                                    <div class="news-f-img"><img src="img/avatar-2.jpg" alt="..."
                                                                                 class="img-fluid rounded-circle"></div>
                                                    <div class="msg-body">
                                                        <h6 class="h5 msg-nav-h6">Low cost Modern printer</h6>
                                                        <small>A dot matrix printer modified at...</small>
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="border border-info">
                                                <a rel="nofollow" href="#" class=" d-flex">
                                                    <div class="news-f-img"><img src="img/avatar-3.jpg" alt="..."
                                                                                 class="img-fluid rounded-circle"></div>
                                                    <div class="msg-body">
                                                        <h6 class="h5 msg-nav-h6">Low cost Modern printer</h6>
                                                        <small>A dot matrix printer modified at...</small>
                                                    </div>
                                                </a>
                                            </li>
                                            <li><a rel="nofollow" href="#"
                                                   class="dropdown-item all-notifications text-center"> <strong>Read all
                                                messages </strong></a></li>

                                        </ul>
                                    </div>
                                </div>

                            </div>
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
            <div class="avatar">
                <div class="photo">
                    <%
                        request.setAttribute("NAME", session.getAttribute("un"));
                        if (session.getAttribute("un") != null) {
                    %>
                    <img src="img/head.png" alt="..." class="img-fluid rounded-circle"
                         style="height: 50px; width: 50px;">
                    <%
                    } else {
                    %>
                    <img src="img/work/3.jpg" alt="..." class="img-fluid rounded-circle"
                         style="height: 50px; width: 50px;">
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="title">
                <h1 class="h4">Hi, ${NAME}</h1>
            </div>
        </div>
        <hr>
        <!-- Sidebar Navidation Menus-->
        <ul class="list-unstyled">
            <li class="active"><a href="index.jsp"><i class="icon-home"></i>Home</a></li>
            <li><a href="profile.jsp"> <i class="fa fa-user-o "></i>Profile </a></li>
            <li><a href="#cc" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>Core
                Competence</a>
                <ul id="cc" class="collapse list-unstyled">
                    <li></li>
                    <li><a href="#">Research</a></li>
                    <li><a href="user/getScore">Score</a></li>
                    <li><a href="user/getSkill">Development Skills</a></li>
                    <li><a href="#">Rewards</a></li>
                </ul>
            </li>
            <li><a href="user/getMessage"> <i class="icon-mail"></i>MessageBoard</a></li>
        </ul>
    </nav>

    <%--    主要内容从这里开始 --%>
    <div class="content-inner chart-cont">
        <!--***** CONTENT *****-->
        <div class="container">
            <%--            一行 --%>
            <div class="row">
                <!-- 显示留言标题的面板 和 点击留言 （左边的导航栏）-->
                <div class="col-md-4">
                    <nav class="nav vert-tab flex-column">
                        <%-- 点击可以留言 --%>
                        <a class="nav-link tab-faq" href="#lMessage" data-toggle="modal" style="border-style: outset">
                            <h3> 点击留言 </h3>
                            <small>I'd like to hear your voice.</small>
                        </a>
                        <%--留言的 弹出窗口 --%>
                        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="lMessage"
                             class="modal fade" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!--***** USER INFO *****-->
                                    <div class="col-md-12">
                                        <div class="card form" id="lform">
                                            <div class="card-header">
                                                <h3 style="display: inline"><i class="fa fa-commenting-o"></i> Message
                                                    Board</h3>
                                                <button aria-hidden="true" data-dismiss="modal" class="close"
                                                        type="button">X
                                                </button>
                                            </div>
                                            <form action="<%=basePath%>user/addMessage" method="get">
                                                <div class="form-group">
                                                    <label for="lTitle">Title</label>
                                                    <input type="text" class="form-control" id="lTitle"
                                                           placeholder="Enter title" name="lTitle">
                                                </div>

                                                <div class="form-group" style="margin-top: 0;">
                                                    <label for="lTextarea">Content</label>
                                                    <textarea class="form-control" id="lTextarea" rows="8"
                                                              placeholder="Let me hear your thought"
                                                              name="lContent"></textarea>
                                                </div>

                                                <div class="row mt-3">
                                                    <div class="col-md-12">
                                                        <div class="card-header">
                                                            <h3><i class="fa fa-user-circle"></i> User Info</h3>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row" style="margin-top: 20px;">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="lName">Full Name</label>
                                                            <input type="text" class="form-control" id="lName"
                                                                   name="lName" placeholder="Enter name">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="lEmail">Email address</label>
                                                            <input type="email" class="form-control" id="lEmail"
                                                                   name="lEmail" placeholder="Enter email">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="lNumber">Contact Num</label>
                                                            <input type="number" class="form-control" id="lNumber"
                                                                   name="lNum" placeholder="Enter number">
                                                        </div>
                                                    </div>
                                                </div>

                                                <button type="submit" class="btn btn-general btn-blue mr-2">Submit
                                                </button>
                                                <button type="reset" class="btn btn-general btn-white">Cancel</button>
                                            </form>
                                        </div>
                                    </div>

                                </div>
                                <!-- /.modal-content -->
                            </div>
                        </div>
                        <%--显示留言标题--%>
                        <c:forEach var="s_message" items="${messages}" varStatus="status">
                            <a class="nav-link tab-faq js-scroll-trigger" href="#MSG${status.index}">
                                <h3><i class="fa fa-dot-circle-o"></i>
                                    <c:if test="${s_message != null && s_message.getTitle().length() > 14 }">
                                        ${s_message.getTitle().substring(0,15)}...
                                    </c:if>
                                    <c:if test="${s_message.getTitle().length()<15}">
                                        ${s_message.getTitle()}
                                    </c:if>
                                </h3>
                                <c:if test="${s_message.getContent() != null && s_message.getContent().length() > 20}">
                                    <small>${s_message.getContent().substring(0,20)}...</small>
                                </c:if>
                                <c:if test="s_message == null || s_message < 20">
                                    <small>${s_message.getContent()}</small>
                                </c:if>
                            </a>
                        </c:forEach>
                    </nav>
                </div>

                <%--显示所有的留言的面板--%>
                <div class="col-md-8">
                    <!-- 遍历所有的留言 -->
                    <c:forEach var="s_message" items="${messages}" varStatus="status">
                        <div class="faq-cont" id="MSG${status.index}">
                            <div class="faq-heading-cont">
                                <!--<h3><i class="fa fa-power-off"></i> Basic Question</h3>-->
                            </div>
                            <div class="panel-group" id="accordion-${status.index}">
                                    <%--message--%>
                                <div class="panel panel-default panel-faq">
                                    <div class="panel-heading">
                                        <a data-toggle="collapse" data-parent="#accordion-${status.index}"
                                           href="#faq-sub-cat${s_message.getId()}">
                                            <h4 class="panel-title"><i class="fa fa-dot-circle-o"></i>
                                                    ${status.index+1} ${s_message.getTitle()}
                                                <span class="pull-right"><i class="fa fa-plus"></i></span>
                                            </h4>
                                        </a>
                                    </div>
                                    <div id="faq-sub-cat${s_message.getId()}" class="panel-collapse active">
                                        <div class="panel-body">
                                            <ul>
                                                <li class="list-group-item">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <img src="img/avatar-2.jpg" class="img-circle img-fluid"
                                                                 alt=""/></div>
                                                        <div class=" col-md-10">
                                                            <div>
                                                                <div class="mic-info">
                                                                    By: <a href="#">${s_message.getUsername()}</a>
                                                                    at ${s_message.getTime()}
                                                                </div>
                                                            </div>
                                                            <div class="comment-text">
                                                                    ${s_message.getContent()}
                                                            </div>
                                                            <%if (session.getAttribute("un") != null) {%>
                                                            <div style="float: right">
                                                                <a href="#"
                                                                   class="btn btn-sm btn-hover btn-primary"><span
                                                                        class="fa fa-edit"
                                                                        style="padding-right:3px;"></span>edit</a>
                                                                <a href="user/deleteMessage?id=${s_message.getId()}"
                                                                   class="btn btn-sm btn-hover btn-danger"><span
                                                                        class="fa fa-remove"
                                                                        style="padding-right:3px;"></span>delete</a>
                                                            </div>
                                                            <% } %>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <c:forEach var="replies" items="${repliesList}" varStatus="status">
                                    <c:forEach var="s_reply" items="${replies}" varStatus="status">
                                        <c:if test="${s_reply.getMessageid() == s_message.getId()}">
                                            <%--SHOW REPLY--%>
                                            <div class="panel panel-default panel-faq">
                                                <div class="panel-heading">
                                                    <a data-toggle="collapse" data-parent="#accordion-${status.index}"
                                                       href="#faq-sub-cat${status.index}-${s_reply.getReplyid()}">
                                                        <h4 class="panel-title">
                                                                ${s_reply.getTitle()}
                                                            <span class="pull-right"><i class="fa fa-plus"></i></span>
                                                        </h4>
                                                    </a>
                                                </div>
                                                <div id="faq-sub-cat${status.index}-${s_reply.getReplyid()}"
                                                     class="panel-collapse collapse">
                                                    <div class="panel-body" style="padding-bottom: 0;">
                                                        By: <a href="#">${s_reply.getUsername()}</a>
                                                        at ${s_reply.getTime()}
                                                    </div>
                                                    <div class="panel-body" style="padding-top: 0;">
                                                            ${s_reply.getContent()}
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>


                                <div class="panel panel-default panel-faq">
                                    <a href="#myModal" data-toggle="modal" title="Compose" class="btn btn-compose">
                                        Reply</a>
                                    <!-- Modal -->
                                    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1"
                                         id="myModal" class="modal fade" style="display: none;">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <!--***** REPLY INFO *****-->
                                                <div class="col-md-12">
                                                    <div class="card form" id="form1">
                                                        <div class="card-header">
                                                            <h3 style="display: inline"><i
                                                                    class="fa fa-commenting-o"></i>
                                                                Send Reply</h3>
                                                            <button aria-hidden="true" data-dismiss="modal"
                                                                    class="close"
                                                                    type="button">×
                                                            </button>
                                                        </div>
                                                        <form action="user/addReply">
                                                            <input type="hidden" value="${s_message.getId()}"
                                                                   name="rmsgId">
                                                            <div class="form-group">
                                                                <label for="title">Title</label>
                                                                <input type="text" class="form-control" id="title"
                                                                       aria-describedby="title" name="rTitle"
                                                                       placeholder="Enter title">
                                                            </div>

                                                            <div class="form-group" style="margin-top: 0;">
                                                                <label for="exampleTextarea">Content</label>
                                                                <textarea class="form-control" id="exampleTextarea"
                                                                          rows="8" name="rContent"
                                                                          placeholder="Let me hear your thought"></textarea>
                                                            </div>

                                                            <div class="row mt-3">
                                                                <div class="col-md-12">
                                                                    <div class="card-header">
                                                                        <h3><i class="fa fa-user-circle"></i> User Info
                                                                        </h3>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row" style="margin-top: 20px;">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label for="name">Full Name</label>
                                                                        <input type="text" class="form-control"
                                                                               id="Name" name="rName"
                                                                               aria-describedby="emailHelp"
                                                                               placeholder="Enter name">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="email">Email address</label>
                                                                        <input type="email" class="form-control"
                                                                               id="Email" name="rEmail"
                                                                               aria-describedby="emailHelp"
                                                                               placeholder="Enter email">
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label for="name">Contact Num</label>
                                                                        <input type="number" class="form-control"
                                                                               name="rNumber"
                                                                               id="number" aria-describedby="emailHelp"
                                                                               placeholder="Enter number">
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <button type="submit" class="btn btn-general btn-blue mr-2">
                                                                Submit
                                                            </button>
                                                            <button type="reset" class="btn btn-general btn-white">
                                                                Cancel
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>

                                    </div>

                                </div>
                            </div>

                        </div>

                        <br><!-- 给每条留言都添加间隔 -->
                    </c:forEach>
                </div><!-- 一条留言信息 -->

            </div><!-- row end -->

        </div><!-- 留言面板结束 -->

    </div>
</div>
</div>

</div>
</div>

<!--Global Javascript -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/popper/popper.min.js"></script>
<script type="text/javascript" src="js/tether.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/chart.min.js"></script>
<script type="text/javascript" src="js/front.js"></script>

<!--Core Javascript -->
<script>
    new Chart(document.getElementById("myChart-nav").getContext('2d'), {
        type: 'doughnut',
        data: {
            labels: ["M", "T", "W", "T", "F", "S", "S"],
            datasets: [{
                backgroundColor: [
                    "#2ecc71",
                    "#3498db",
                    "#95a5a6",
                    "#9b59b6",
                    "#f1c40f",
                    "#e74c3c",
                    "#34495e"
                ],
                data: [12, 19, 3, 17, 28, 24, 7]
            }]
        },
        options: {
            legend: {display: false},
            title: {
                display: true,
                text: ''
            }
        }
    });
</script>
<script>
    (function ($) {
        var mn = $(".vert-tab");
        var mns = "vert-tab-scrolled";
        $(window).scroll(function () {
            if ($(this).scrollTop() > $('header').height()) {
                mn.addClass(mns);
            } else {
                mn.removeClass(mns);
            }
        });
        $('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function () {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html, body').animate({
                        scrollTop: (target.offset().top - 22)
                    }, 700, "easeInOutExpo");
                    return false;
                }
            }
        });
    })(jQuery);
</script>
</body>

</html>
