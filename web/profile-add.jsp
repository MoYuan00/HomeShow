<%--
  Created by IntelliJ IDEA.
  User: -ZQ-
  Date: 2019/12/30
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加一个简介</title>
</head>
<body>
<%
    pageContext.setAttribute("jumpPath", request.getParameter("jumpPath"));
    pageContext.setAttribute("type", request.getParameter("type"));
%>
<div >
    <%-- 点击可以留言 --%>
    <a class=" " href="#lMessage" data-toggle="modal" style="border-style: outset">
        <button class="btn btn-info"> 新增一条简介</button>
    </a>
    <%--留言的 弹出窗口 --%>
    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="lMessage"
         class="modal fade" style="display: none; margin-top: 70px">
        <div class="modal-dialog "  >
            <div class="modal-content">
                <!--***** USER INFO *****-->
                <div class="col-md-12">
                    <div class="card form" id="lform">
                        <div class="card-header">
                            <h3 style="display: inline"><i class="fa fa-commenting-o"></i>新增简介</h3>
                            <button aria-hidden="true" data-dismiss="modal" class="close"
                                    type="button">X
                            </button>
                        </div>
                        <form action="${path}addProfile" method="post">
                            <input type="hidden" name="jumpPath" value="${jumpPath}">
                            <input type="hidden" name="type" value="${type}">
                            <div class="form-group">
                                <input type="text" class="form-control" id="lTitle"
                                       placeholder="标题" name="title">
                            </div>
                            <div class="form-group" style="margin-top: 0;">
                                <textarea class="form-control"   rows="5"
                                          placeholder="内容"
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
</div>
</body>
</html>
