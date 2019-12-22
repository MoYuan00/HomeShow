<%@ page language="Java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
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

    <title>register</title>

    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="${path}css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${path}css/font-icon-style.css">
    <link rel="stylesheet" href="${path}css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="${path}/css/pages/login.css">
</head>

<body>

<!--====================================================
                        PAGE CONTENT
======================================================-->
<section class="hero-area">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12 ">
                <div class="contact-h-cont">
                    <h3 class="text-center">家乡展示管理平台<img src="" class="img-fluid" alt=""></h3><br>
                    <form action="<%=basePath%>login/toLogin" method="post">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" id="username" placeholder="Enter Username" value="${username}" name="username">
                        </div>
                        <div class="form-group">
                            <label for="example-password-input">Password</label>
                            <input class="form-control" type="password"  id="example-password-input"  placeholder="Enter Password" value="${password}" name="password">
                        </div>

                        <%
                            if(request.getAttribute("message") != null) {
                        %>
                        <div style="color: red;">
                            <p>${message}</p>
                        </div>
                        <%
                            }
                        %>

                        <button class="btn btn-general btn-blue" role="button">Register</button>
                        <button class="btn btn-general btn-white" type="button" style="float: right;" onclick = "window.location.href = '${path}index.jsp'">Login</button>

                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<!--Global Javascript -->
<script src="${path}js/jquery.min.js"></script>
<script src="${path}js/tether.min.js"></script>
<script src="${path}js/bootstrap.min.js"></script>
</body>

</html>