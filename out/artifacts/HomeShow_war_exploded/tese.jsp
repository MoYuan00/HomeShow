<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.lang.*" %>
<%@ page import="bean.Profile" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Images" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);

    // 获取数据
    Profile profile = new Profile();

    String content = null;
    List<Images> replies = null;

    // 获取 美景
    content = profile.getMJContent();
    replies = profile.getMJImages();
    pageContext.setAttribute( "mj_content", content);
    pageContext.setAttribute("mj_list", replies);

    // 获取 美食
    content = profile.getFoodContent();
    replies = profile.getFoodImages();
    pageContext.setAttribute( "food_content", content);
    pageContext.setAttribute("food_list", replies);

    // 获取 风土人情
    content = profile.getFTRQContent();
    replies = profile.getFTRQImages();
    pageContext.setAttribute( "ftrq_content", content);
    pageContext.setAttribute("fftrq_list", replies);


%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title> 特色介绍 </title>
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
                <c:choose>
                    <c:when test="${sessionScope.un != null}">
                        <a rel="nofollow" href="log/toLogout" class="dropdown-item">
                            <div class="notification">
                                <div class="notification-content">
                                    <i class="fa fa-power-off"></i>登出
                                </div>
                            </div>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a rel="nofollow" href="login.jsp" class="dropdown-item">
                            <div class="notification">
                                <div class="notification-content">
                                    <i class="fa fa-power-off"></i>登录
                                </div>
                            </div>
                        </a>
                    </c:otherwise>
                </c:choose>
            </ul>
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
                        <!-- Tab panes -->
                        <div class="tab-content tabs">
                            <h2>美景简介</h2>
                            <div role="tabpanel" class="tab-pane fade show active"  >
                                <%--                                简介内容--%>
                                <p>${pageScope.mj_content}</p>
                                <div class="row mt-3">
                                    <%--    简介图片--%>
                                    <div class="row mt-3">
                                        <c:forEach var="image" items="${pageScope.mj_list}">
                                            <div class="col-md-4 col-sm-6 mt-1">
                                                <div class="box-4">
                                                    <img src="${image.getImg()}">
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <h2>美食简介</h2>
                            <div role="tabpanel" class="tab-pane fade show active" >
                                <%--                                简介内容--%>
                                <p>${pageScope.food_content}</p>
                                <div class="row mt-3">
                                    <%--    简介图片--%>
                                    <div class="row mt-3">
                                        <c:forEach var="image" items="${pageScope.food_list}">
                                            <div class="col-md-4 col-sm-6 mt-1">
                                                <div class="box-4">
                                                    <img src="${image.getImg()}">
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <h2>风土人情简介</h2>
                            <div role="tabpanel" class="tab-pane fade show active"  >
                                <%--                                简介内容--%>
                                <p>${pageScope.food_content}</p>
                                <div class="row mt-3">
                                    <%--    简介图片--%>
                                    <div class="row mt-3">
                                        <c:forEach var="image" items="${pageScope.fftrq_list}">
                                            <div class="col-md-4 col-sm-6 mt-1">
                                                <div class="box-4">
                                                    <img src="${image.getImg()}">
                                                </div>
                                            </div>
                                        </c:forEach>
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