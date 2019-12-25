<%@ page language="Java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.lang.*" %>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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


    <title>Mr.wHo's Website</title>
    <link rel="shortcut icon" href="img/favicon.ico">

    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/font-icon-style.css">
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->

    <!-- jstl -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>


<body>


<!--====================================================
                         MAIN NAVBAR
======================================================-->
<header class="header">
    <nav class="navbar navbar-expand-lg">
        <div class="search-box">
            <button class="dismiss"><i class="icon-close"></i></button>
            <form id="searchForm" action="user/searchScore" role="search" >
                <input type="search" placeholder="Search Now" class="form-control" name="sSearch">
            </form>
        </div>
        <div class="container-fluid ">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
                <div class="navbar-header">
                    <a href="index.jsp" class="navbar-brand">
                        <div class="brand-text brand-big hidden-lg-down">Mr.wHo's Website</div>
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
                <!-- Expand-->
                <!--<li class="nav-item d-flex align-items-center full_scr_exp"><a class="nav-link" href="#"><img src="img/expand.png" onclick="toggleFullScreen(document.body)" class="img-fluid" alt=""></a></li>-->
                <!-- Search-->
                <li class="nav-item d-flex align-items-center"><a id="search" class="nav-link" href="#"><i class="icon-search"></i></a></li>

                <!-- Messages-->
                <li class="nav-item dropdown"><a id="profile" class="nav-link logout" data-target="#" href="profile.jsp" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <div class="photo">
                        <%
                            request.setAttribute("NAME", session.getAttribute("un"));
                            if (session.getAttribute("un") != null){
                        %>
                        <img src="img/head.png" alt="..." class="img-fluid rounded-circle" style="height: 35px; width: 35px;">
                        <%
                        }
                        else {
                        %>
                        <img src="img/work/3.jpg" alt="..." class="img-fluid rounded-circle" style="height: 40px; width: 40px;">
                        <%
                            }
                        %>
                    </div>
                </a>
                    <ul aria-labelledby="profile" class="dropdown-menu profile">
                        <li>
                            <a rel="nofollow" href="#" class="dropdown-item d-flex">
                                <div class="photo">
                                    <%
                                        request.setAttribute("NAME", session.getAttribute("un"));
                                        if (session.getAttribute("un") != null){
                                    %>
                                    <img src="img/head.png" alt="..." class="img-fluid rounded-circle" style="height: 35px; width: 35px;">
                                    <%
                                    }
                                    else {
                                    %>
                                    <img src="img/work/3.jpg" alt="..." class="img-fluid rounded-circle" style="height: 40px; width: 40px;">
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
                <li class="nav-item d-flex align-items-center"><a id="menu-toggle-right" class="nav-link" href="#"><i class="fa fa-bars"></i></a></li>
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
                    <img src="img/head.png" alt="..." class="img-fluid rounded-circle" style="height: 50px; width: 50px;">
                    <%
                    } else {
                    %>
                    <img src="img/work/3.jpg" alt="..." class="img-fluid rounded-circle" style="height: 50px; width: 50px;">
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
            <li class="active"> <a href="index.jsp"><i class="icon-home"></i>Home</a></li>
            <li> <a href="profile.jsp"> <i class="fa fa-user-o "></i>Profile </a></li>
            <li><a href="#cc" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>Core Competence</a>
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

    <div class="content-inner chart-cont">

        <!--***** CONTENT *****-->
        <div class="row">
            <%--<form servlets="<%=basePath%>user/showScore" method="post" style="width: 100%;max-width: 100%">--%>
            <table class="table table-hover">
                <thead>
                <tr class="bg-info text-white">
                    <th>#</th>
                    <th>CourseID</th>
                    <th>CourseName</th>
                    <th>Score</th>
                    <th>Operation</th>
                </tr>
                </thead>
                <tbody style="vertical-align: center;">


                <%--searched? or get all--%>
                <%
                    if (session.getAttribute("searchScores") != null){
                        request.setAttribute("scoresList", session.getAttribute("searchScores"));
                    }
                    else{
                    request.setAttribute("scoresList", session.getAttribute("scores"));
                    }
                %>
                <c:forEach var="s_score" items="${scoresList}" varStatus="status">
                    <c:if test="${(status.index+1) % 2 == 0}">
                        <c:if test="${(status.index+1) % 4 == 0}">
                            <tr  class="table-info">
                        </c:if>
                        <c:if test="${(status.index+1) % 4 != 0}">
                            <tr  class="table-success">
                        </c:if>
                    </c:if>
                    <c:if test="${(status.index+1) % 2 != 0}">
                        <tr>
                    </c:if>
                        <th scope="row">${status.index + 1}</th>
                        <td>${s_score.getId()}</td>
                        <td>${s_score.getName()}</td>
                        <td>${s_score.getScore()}</td>
                        <td>
                            <%
                                request.setAttribute("NAME", session.getAttribute("un"));
                                if (session.getAttribute("un") != null) {
                            %>
                            <a href="user/deleteScore?id=${s_score.getId()}" class="btn-outline-danger">delete<span class="fa fa-remove "></span></a>&nbsp;&nbsp;&nbsp;
                            <%--<a href="#" class="btn-outline-primary">edit<span class="fa fa-pencil-square-o "></span></a>--%>
                            <% } %>
                        </td>
                    </tr>
                </c:forEach>

                <tr>
                    <%
                        request.setAttribute("NAME", session.getAttribute("un"));
                        if (session.getAttribute("un") != null) {
                    %>
                    <td></td><td></td>
                    <td><a class="btn-outline-info" href="#aScore" data-toggle="modal">add score record <span class="fa fa-plus"></span></a></td>
                    <td></td><td></td>
                    <%}%>
                </tr>
                </tbody>
            </table>
            <div aria-hidden="true" aria-labelledby="scoreModalLabel" role="dialog" tabindex="-1" id="aScore" class="modal fade" style="top: 90px;">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <!--***** USER INFO *****-->
                            <div class="col-md-12">
                                <div class="card form" id="lform">
                                    <div class="card-header">
                                        <h3 style="display: inline"><i class="fa fa-commenting-o"></i> Add Score</h3>
                                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">X</button>
                                    </div>
                                    <form action="<%=basePath%>user/addScore" method="get">
                                        <div class="row" style="margin-top: 20px;">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="cId">Course Id</label>
                                                    <input type="number" class="form-control" id="cId" name="cId" placeholder="Enter id...">
                                                </div>
                                                <div class="form-group">
                                                    <label for="cName">Course Name</label>
                                                    <input type="text" class="form-control" id="cName" name="cName" placeholder="Enter name...">
                                                </div>
                                                <div class="form-group">
                                                    <label for="cScore">Score</label>
                                                    <input type="number" step="0.1" class="form-control" id="cScore" name="cScore" placeholder="Enter score...">
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-general btn-blue mr-2" style="margin-left: 40%;width: 20%">Add</button>
                                    </form>
                                </div>
                            </div>

                        </div>
                        <!-- /.modal-content -->
                    </div>
                </div>
            <%--</form>--%>
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
    //         legend: {display: false},
    //         title: {
    //             display: true,
    //             text: ''
    //         }
    //     }
    // });
</script>
</body>

</html>