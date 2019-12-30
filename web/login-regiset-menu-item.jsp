<%@ page import="bean.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: -ZQ-
  Date: 2019/12/30
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);

    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {// 如果没有登录
    } else {
        // 获取用户的所有信息
        User user = new User();
        user.setId(userId);
        user = user.getUserInfoById();
        pageContext.setAttribute("user", user);// 放入页面环境
    }
%>
<html>
<head>
    <title>菜单的注册或者登陆按钮</title>
</head>
<body>
<ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
    <c:choose>
        <c:when test="${pageScope.user != null}">
            <li class="nav-item dropdown">
                <a id="profile" class="nav-link logout" data-target="#"
                   href="#" data-toggle="dropdown" aria-haspopup="true"
                   aria-expanded="false">
                    <div class="photo">
                        <img src="${user.portrait_image}" alt="头像" class="img-fluid rounded-circle"
                             style="height: 50px; width: 50px;">
                    </div>
                </a>
                    <%--                    点击头像的下拉菜单--%>
                <ul aria-labelledby="profile" class="dropdown-menu profile">
                    <li>
                        <a rel="nofollow" href="${path}user/logout" class="dropdown-item">
                            <div class="notification">
                                <div class="notification-content"><i class="fa fa-power-off"></i>
                                    退出登录
                                </div>
                            </div>
                        </a>
                    </li>
                </ul>
            </li>
        </c:when>
        <c:otherwise>
            <li>
                <a rel="nofollow" href="${path}login.jsp" class="dropdown-item">
                    <div class="notification">
                        <div class="notification-content">
                            <i class="fa fa-power-off"></i>登录
                        </div>
                    </div>
                </a>
            </li>
            <li>
                <a rel="nofollow" href="register.jsp" class="dropdown-item">
                    <div class="notification">
                        <div class="notification-content"><i class="fa fa-power-off"></i>
                            注册
                        </div>
                    </div>
                </a>
            </li>
        </c:otherwise>
    </c:choose>
</ul>
</body>
</html>
