<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: -ZQ-
  Date: 2019/12/25
  Time: 23:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<ul class="list-unstyled">
    <c:choose>
        <c:when test="${sessionScope.un != null}">
            <li><a href="mjManager.jsp"> <i class="fa fa-user-o"></i>美景管理</a></li>
            <li><a href="foodManager.jsp"> <i class="fa fa-user-o"></i>美食管理</a></li>
            <li><a href="ftrqManager.jsp"> <i class="fa fa-user-o"></i>风土人情管理</a></li>
            <li><a href="messageBoard.jsp"> <i class="fa fa-user-o"></i>留言管理</a></li>
        </c:when>
        <c:otherwise>
            <li class="active"><a href="index.jsp"> <i class="fa fa-user-o"></i>首页</a></li>
            <li><a href="profile.jsp"> <i class="fa fa-user-o"></i>家乡简介</a></li>
            <li><a href="tese.jsp"> <i class="fa fa-user-o"></i>特色介绍</a></li>
            <li><a href="messageBoard.jsp"> <i class="fa fa-user-o"></i>游客留言</a></li>
            <li><a href="own.jsp"> <i class="fa fa-user-o"></i>个人简介</a></li>
        </c:otherwise>
    </c:choose>
</ul>
</body>
</html>
