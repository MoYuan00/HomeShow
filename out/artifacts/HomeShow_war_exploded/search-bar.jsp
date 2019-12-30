<%--
  Created by IntelliJ IDEA.
  User: -ZQ-
  Date: 2019/12/30
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搜索条</title>
</head>
<body>
<%--            固定在头部的搜索框 - 搜索当前页面的内容--%>
<div class="form-inline fixed-top row justify-content-center " style=" top:10px; max-width: 70%;margin: 0px auto;">
    <div class="col-md-8 col-sm-9  col-lg-8 text-center"
         style="background:#ffffff55; padding: 10px; border-radius: 30px">
        <input class="form-control text-right" id="key" type="text" placeholder="查找"/>
        <button type="button" class="btn btn-sm btn-white " onclick="next()">下一个</button>
        <button type="button" class="btn btn-sm btn-white" onclick="previous()">上一个</button>
    </div>
</div>
</body>
</html>
