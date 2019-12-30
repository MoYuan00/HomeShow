<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="Java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.lang.*" %>
<%@ page import="bean.Message" %>
<%@ page import="bean.Reply" %>
<%@ page import="bean.User" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setAttribute("path", basePath);

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
    /*
        获取留言
     */
    Message message = new Message();
    pageContext.setAttribute("messages", message.getMessages());
    /*
     *  获取留言的回复信息
     */
    Reply reply = new Reply();
    pageContext.setAttribute("replies", reply.getReplies());

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

<!--=================================================
                         MAIN NAV BAR
====================================================-->
<header class="header">
    <nav class="navbar navbar-expand-lg ">
        <div class="container-fluid ">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
                <div class="navbar-header">
                    <a href="index.jsp" class="navbar-brand">
                        <div class="brand-text brand-big hidden-lg-down">Hi ${user.username}</div>
                        <div class="brand-text brand-small">
                            <img src="img/logo-icon.png" alt="Logo" class="img-fluid">
                        </div>
                    </a>
                    <%--                    这个是头部导航栏左边的更多 = 的点击入口  --%>
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

<!--====================================================
                        PAGE CONTENT 主要内容
======================================================-->
<div class="page-content d-flex align-items-stretch">

    <!--***** SIDE NAVBAR 左边的导航栏 *****-->
    <nav class="side-navbar">
        <!-- 左边的导航栏的导航部分 -->
        <jsp:include page="nav-ul.jsp"/>
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
                            <small>我们想听到你的声音。欢迎发表留言。</small>
                        </a>
                        <%--留言的 弹出窗口 --%>
                        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="lMessage"
                             class="modal fade" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!--***** USER INFO *****-->
                                    <div class="col-md-12">
                                        <div class="card form" >
                                            <div class="card-header">
                                                <h3 style="display: inline"><i class="fa fa-commenting-o"></i>留言板</h3>
                                                <button aria-hidden="true" data-dismiss="modal" class="close"
                                                        type="button">X
                                                </button>
                                            </div>
                                            <form action="${path}addMessage" method="post">
                                                <input type="hidden" name="jumpPath" value="messageBoard.jsp">
                                                <input type="hidden" name="user_id" value="${user.id}">
                                                <div class="form-group">
                                                    <label for="lTitle">标题</label>
                                                    <input type="text" class="form-control" id="lTitle"
                                                           placeholder="标题" name="title">
                                                </div>
                                                <div class="form-group" style="margin-top: 0;">
                                                    <label for="lTextarea">内容</label>
                                                    <textarea class="form-control" id="lTextarea" rows="5"
                                                              placeholder="在这里发表你的看法！"
                                                              name="content"></textarea>
                                                </div>
                                                <button type="submit" class="btn btn-general btn-blue mr-2">提交
                                                </button>
                                            </form>
                                        </div>
                                    </div>

                                </div>
                                <!-- /.modal-content -->
                            </div>
                        </div>
                        <%--显示留言标题--%>
                        <c:forEach var="s_message" items="${messages}" varStatus="s">
                            <a class="nav-link tab-faq js-scroll-trigger" href="#MSG${s.index}">
                                <h3><i class="fa fa-dot-circle-o"></i>
                                    <c:choose>
                                        <%--                                        当字符串过于长时的处理--%>
                                        <c:when test="${s_message != null && s_message.getTitle().length() > 14 }">
                                            ${s_message.getTitle().substring(0,15)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${s_message.getTitle()}
                                        </c:otherwise>
                                    </c:choose>
                                </h3>
                                <small>
                                    <c:choose>
                                        <%--                                        当字符串过于长时的处理--%>
                                        <c:when test="${s_message.getContent() != null && s_message.getContent().length() > 20}">
                                            ${s_message.getContent().substring(0,20)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${s_message.getContent()}
                                        </c:otherwise>
                                    </c:choose>
                                </small>
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
                            </div>
                                <%--                            一条留言--%>
                            <div class="panel-group" id="accordion-${status.index}">
                                    <%--message--%>
                                    <%--                                留言内容--%>
                                <div class="panel panel-default panel-faq">
                                    <div class="panel-heading">
                                        <a data-toggle="collapse" data-parent="#accordion-${status.index}"
                                           href="#faq-sub-cat${s_message.id}">
                                            <h4 class="panel-title"><i class="fa fa-dot-circle-o"></i>
                                                    ${status.index+1}) ${s_message.title}
                                                <span class="pull-right"><i class="fa fa-plus"></i></span>
                                            </h4>
                                        </a>
                                    </div>
                                    <div id="faq-sub-cat${s_message.id}" class="panel-collapse active">
                                        <div class="panel-body">
                                            <ul>
                                                <li class="list-group-item">
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <img src="${s_message.user.portrait_image}"
                                                                 class="img-circle img-fluid "
                                                                 alt="头像"/></div>
                                                        <div class=" col-md-10">
                                                            <div>
                                                                <div class="mic-info">
                                                                    <a href="#">${s_message.user.username}</a>
                                                                    ： ${s_message.time}
                                                                </div>
                                                            </div>
                                                            <div class="comment-text">
                                                                    ${s_message.content}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                    <%--一条留言的回复（每条留言都可以有多条回复）--%>
                                <c:forEach var="s_reply" items="${replies}" varStatus="s">
                                    <c:if test="${s_reply.messageid.equals(s_message.id)}">
                                        <%--SHOW REPLY--%>
                                        <div class="panel panel-default panel-faq">
                                            <div class="panel-heading">
                                                <a data-toggle="collapse" data-parent="#accordion-${s.index}"
                                                   href="#faq-sub-cat${s.index}-${s_reply.replyid}">
                                                    <h4 class="panel-title">
                                                            ${s_reply.title}
                                                        <span class="pull-right"><i class="fa fa-plus"></i></span>
                                                    </h4>
                                                </a>
                                            </div>
                                            <div id="faq-sub-cat${s.index}-${s_reply.replyid}"
                                                 class="panel-collapse collapse">
                                                <div class="panel-body" style="padding-bottom: 0;">
                                                    By: <a href="#">${s_reply.user.username}</a>
                                                    at ${s_reply.time}
                                                </div>
                                                <div class="panel-body" style="padding-top: 0;">
                                                        ${s_reply.content}
                                                </div>
                                            </div>
                                        </div>

                                    </c:if>
                                </c:forEach>
                                    <%--回复信息弹窗--%>
                                <div class="panel panel-default panel-faq">
                                    <a href="#myModal-${status.index}" data-toggle="modal" title="Compose"
                                       class="btn btn-compose">
                                        回复ta</a>
                                    <!-- Modal -->
                                    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
                                         tabindex="-1"
                                         id="myModal-${status.index}" class="modal fade" style="display: none;">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <!--***** REPLY INFO *****-->
                                                <div class="col-md-12">
                                                    <div class="card form" id="form1">
                                                        <div class="card-header">
                                                            <h3 style="display: inline">
                                                                <i class="fa fa-commenting-o"></i>
                                                                回复ta: ${s_message.title}</h3>
                                                            <button aria-hidden="true" data-dismiss="modal"
                                                                    class="close" type="button">×
                                                            </button>
                                                        </div>
                                                        <form action="${path}addReply" method="post">
                                                            <input type="hidden" name="jumpPath" value="messageBoard.jsp">
                                                            <input type="hidden" name="user_id" value="${user.id}">
                                                            <input type="hidden" value="${s_message.id}"
                                                                   name="rmsgId">
                                                            <div class="form-group">
                                                                <label for="title">标题</label>
                                                                <input type="text" class="form-control"
                                                                       id="title"
                                                                       aria-describedby="title" name="rTitle"
                                                                       placeholder="输入标题">
                                                            </div>

                                                            <div class="form-group" style="margin-top: 0;">
                                                                <label for="exampleTextarea">内容</label>
                                                                <textarea class="form-control"
                                                                          id="exampleTextarea"
                                                                          rows="4" name="rContent"
                                                                          placeholder="回复内容"></textarea>
                                                            </div>
                                                            <button type="submit"
                                                                    class="btn btn-general btn-blue mr-2">
                                                                回复
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

</body>

</html>
