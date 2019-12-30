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
<%@ page import="bean.User" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);

    User user = new User();
    List<User> users = user.getUsers();
    pageContext.setAttribute("list", users);

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title>用户管理</title>
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

            <div class="col-md-9 col-lg-12">
                <div class="card hovercard">
                    <div class="tab" role="tabpanel">
                        <!-- Tab panes -->
                        <div class="tab-content tabs">
                            <h2>用户管理</h2>
                                <div class="panel-body" style="padding-top: 0;">
                                <%--添加用户 弹窗--%>
                                    <%--编辑回复信息弹窗--%>
                                    <div class="panel panel-default panel-faq">
                                        <a href="#myModal-r--r" data-toggle="modal"
                                           title="Compose"
                                           class="btn btn-general btn-white">
                                            添加用户</a>
                                        <!-- Modal -->
                                        <div aria-hidden="true" aria-labelledby="myModalLabel"
                                             role="dialog"
                                             tabindex="-1"
                                             id="myModal-r--r" class="modal fade"
                                             style="display: none;">
                                            <div class="modal-dialog" style="margin-top: 10%">
                                                <div class="modal-content">
                                                    <div class="col-md-12">
                                                        <div class="card form" id="form111">
                                                            <div class="card-header">
                                                                <h3 style="display: inline">
                                                                    <i class="fa fa-user"></i>
                                                                    添加用户
                                                                </h3>
                                                                <button aria-hidden="true"
                                                                        data-dismiss="modal"
                                                                        class="close" type="button">
                                                                    ×
                                                                </button>
                                                            </div>
                                                            <form action="${path}addUser">
                                                                <%--修改回复信息需要 回复信息的id--%>
                                                                <input type="hidden" name="jumpPath"
                                                                       value="userManager.jsp">
                                                                <div class="form-group">
                                                                    <label for="title-2">用户名</label>
                                                                    <input type="text"
                                                                           class="form-control"
                                                                           id="title-2"
                                                                           aria-describedby="title"
                                                                           name="username"
                                                                           placeholder="username"
                                                                           >
                                                                </div>

                                                                <div class="form-group"
                                                                     style="margin-top: 0;">
                                                                    <label for="exampleTextarea-2">密码</label>
                                                                    <input class="form-control"
                                                                              id="exampleTextarea-2"
                                                                              rows="4"
                                                                              name="password"
                                                                              placeholder="password"/>
                                                                </div>
                                                                <button type="submit"
                                                                        class="btn btn-general btn-blue mr-2">
                                                                    确认添加
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
                            <div role="tabpanel" class="tab-pane fade show active" id="prof">
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <table class="table">
                                            <tr>
                                                <td>id</td>
                                                <td>username</td>
                                                <td>password</td>
                                                <td>保存修改</td>
                                                <td>删除用户</td>
                                            </tr>
                                            <c:forEach var="user" items="${pageScope.list}">
                                                <tr>
                                                    <form action="${path}updateUser" method="post">
                                                        <input type="hidden" name="jumpPath"
                                                               value="userManager.jsp">
                                                        <input type="hidden" name="id"
                                                               value="${user.id}">
                                                        <td>${user.id}</td>
                                                        <td>
                                                            <%-- 如果是管理员就不能修改名称 --%>
                                                                <input type="text" name="username"
                                                                       class="form-control disabled"
                                                                    ${"admin".equals(user.username) ? "readonly" : ''}
                                                                       value="${user.username}">
                                                        </td>
                                                        <td><input class="form-control" type="text" name="password"
                                                                   value="${user.password}"></td>
                                                        <td>
                                                            <button class="btn btn-white" type="submit">保存</button>
                                                        </td>
                                                    </form>
                                                    <td>
                                                            <%--                                                        如果用户是管理员就不允许删除--%>
                                                        <c:choose>
                                                            <c:when test='${!"admin".equals(user.username)}'>
                                                                <%-- 添加删除按钮 --%>
                                                                <form action="${path}/deleteUser">
                                                                    <input type="hidden" name="id"
                                                                           value="${user.getId()}">
                                                                    <input type="hidden" name="jumpPath"
                                                                           value="userManager.jsp">
                                                                    <button type="submit" class="btn btn-danger">
                                                                        删除用户
                                                                    </button>
                                                                </form>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="text-danger">管理员账号不允许删除</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                        <br>
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