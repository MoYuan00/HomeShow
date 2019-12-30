<%@ page import="bean.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: -ZQ-
  Date: 2019/12/25
  Time: 23:22
  To change this template use FileUploader | Settings | FileUploader Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {// 如果没有登录
        response.sendRedirect("./login.jsp");
        return;
    }
    // 获取用户的所有信息
    User user = new User();
    user.setId(userId);
    user = user.getUserInfoById();
    pageContext.setAttribute("user", user);// 放入页面环境
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title> 个人简介 </title>
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
        <div class="row mt-2">
            <div class="col-md-9">
                <div class="card hovercard">
                    <div class="tab" role="tabpanel">
                        <!-- Tab panes -->
                        <div class="tab-content tabs">
                            <h2>个人介绍</h2>
                            <div role="tabpanel" class="tab-pane fade show active" id="prof">
                                <%--                                    将表单分成两半 -一栏是头像，一栏是其他信息--%>
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-control pull-right">
                                            <div style="min-height: 200px">
                                                头像
                                                <div class="avatar">
                                                    <img class="img-fluid" src="${user.portrait_image}"
                                                         style="max-height: 180px;width: 100%">
                                                </div>
                                                <form action="./updateUserPortraitImage" method="post"
                                                      enctype="multipart/form-data">
                                                    <input type="hidden" name="id" value="${user.id}">
                                                    <input type="hidden" name="jumpPath" value="own.jsp">
                                                    <input type="file" class="form-control-file" accept="image/jpeg,image/png"
                                                           name="portrait_image">
                                                    <button class="btn btn-primary">点击保存头像</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <form action="./updateUserInfo" method="post">
                                            <input type="hidden" name="id" value="${user.id}">
                                            <input type="hidden" name="jumpPath" value="own.jsp">
                                            <div  >
                                                用户名:
                                                <input type="text" name="username"
                                                       class="form-control disabled"
                                                        ${"admin".equals(user.username) ? "readonly" : ''}
                                                       value="${user.username}">
                                            </div>
                                            <div  >
                                                密码:
                                                <input class="form-control" type="password" name="password" value="${user.password}">
                                            </div>
                                            <div  >
                                                年龄:
                                                <input class="form-control" type="number" name="age" min="1" max="200" step="1"
                                                       value="${user.age}">
                                            </div>
                                            <div >
                                                生日:
                                                <input class="form-control" type="date" name="birthday" value="${user.birthday}">
                                            </div>
                                            <div  >
                                                邮箱:
                                                <input class="form-control" type="email" name="email" value="${user.email}">
                                            </div>
                                            <div >
                                                电话:
                                                <input class="form-control" type="tel" name="tel" value="${user.tel}">
                                            </div>
                                            <button type="submit" class="btn btn-primary">保存信息</button>
                                        </form>
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
