<%--
  Created by IntelliJ IDEA.
  User: -ZQ-
  Date: 2019/12/25
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.lang.*" %>
<%@ page import="bean.Profile" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Images" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);

    Profile profile = new Profile();
    String content = profile.getMJContent();
    List<Images> replies = profile.getMJImages();
    pageContext.setAttribute("content", content);
    pageContext.setAttribute("list", replies);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title>美景管理</title>
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
            <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <c:choose>
                    <c:when test="${sessionScope.un != null}">
                        <a rel="nofollow" href="${path}log/toLogout" class="dropdown-item">
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
        <div class="row mt-2">

            <div class="col-md-9">
                <div class="card hovercard">
                    <div class="tab" role="tabpanel">
                        <!-- Tab panes -->
                        <div class="tab-content tabs">
                            <h2>美景管理</h2>
                            <div>
                                <form action="${path}/addImages" method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="exampleFormControlFile1">添加图片：</label>
                                        <input type="hidden" name="type" value="mj">
                                        <input type="hidden" name="jumpPath" value="mjManager.jsp">
                                        <input type="file" name="uploadFile" class="form-control-file"
                                               id="exampleFormControlFile1"
                                               accept="image/png, image/jpeg, image/gif, image/jpg">
                                        <button type="submit" class="btn btn-primary">提交选择的文件</button>
                                    </div>
                                </form>
                            </div>

                            <div role="tabpanel" class="tab-pane fade show active" id="prof">
                                <%--                                简介内容--%>
<%--                                <p>${pageScope.content}</p>--%>
                                    <form>
                                        <div class="form-group">
                                            <label for="textarea">简介内容:</label>
                                            <textarea id="textarea" class="form-control-range text-area"
                                                      rows="7" cols="58">${pageScope.content}</textarea>
                                            <button type="submit" class="btn btn-primary">保存简介内容修改</button>
                                        </div>
                                    </form>
                                <div class="row mt-3">
                                    <%--    简介图片--%>
                                    <div class="row mt-3">
                                        <c:forEach var="image" items="${pageScope.list}">
                                            <div class="col-md-4 col-sm-6 mt-1">
                                                <div class="box-4">
                                                    <img src="${path}${image.getImg()}">
                                                    <div class="box-4-content">
                                                            <%-- 添加删除按钮 --%>
                                                        <h3 class="text-center">
                                                            <form action="${path}/deleteImages">
                                                                <input type="hidden" name="id"
                                                                       value="${image.getId()}">
                                                                <input type="hidden" name="jumpPath"
                                                                       value="mjManager.jsp">
                                                                <button type="submit" class="btn btn-danger">删除图片
                                                                </button>
                                                            </form>
                                                        </h3>
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
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