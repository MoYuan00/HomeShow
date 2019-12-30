<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: -ZQ-
  Date: 2019/12/25
  Time: 23:17
  To change this template use FileUploader | Settings | FileUploader Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<ul class="list-unstyled">
    <%--        如果是管理员--%>
    <c:if test='${sessionScope.un != null && sessionScope.un.equals("admin") }'>
        <li><a href="mjManager.jsp"> <i class="fa fa-user-o"></i>美景管理</a></li>
        <li><a href="foodManager.jsp"> <i class="fa fa-user-o"></i>美食管理</a></li>
        <li><a href="ftrqManager.jsp"> <i class="fa fa-user-o"></i>风土人情管理</a></li>
        <li><a href="messageManager.jsp"> <i class="fa fa-user-o"></i>留言管理</a></li>
        <li><a href="userManager.jsp"> <i class="fa fa-user-o"></i>用户管理</a></li>
    </c:if>
    <%--    如果登录的不是管理员，或者没有登录--%>
    <c:if test='${sessionScope.un == null  || !"admin".equals(sessionScope.un)}'>
        <li class="active"><a href="index.jsp"> <i class="fa fa-user-o"></i>首页</a></li>
        <li><a href="profile.jsp"> <i class="fa fa-user-o"></i>家乡简介</a></li>
        <li>
            <a href="#cc" aria-expanded="false" data-toggle="collapse" class="active">
            <i class="fa fa-user-o"></i>特色简介</a>
            <ul id="cc" class="collapse list-unstyled">
                <li></li>
                <li><a href="mj.jsp">美景简介</a></li>
                <li><a href="food.jsp">美食简介</a></li>
                <li><a href="ftrq.jsp">风土人情简介</a></li>
            </ul>
        </li>
        <li><a href="own.jsp"> <i class="fa fa-user-o"></i>个人信息</a></li>
    </c:if>
    <%--        如果是游客 就可以留言--%>
    <c:if test='${!sessionScope.un.equals("admin")}'>
        <li><a href="messageBoard.jsp"> <i class="fa fa-user-o"></i>游客留言</a></li>
    </c:if>

</ul>
</body>
</html>
