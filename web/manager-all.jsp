<%@ page import="java.util.List" %>
<%@ page import="bean.Profile" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: -ZQ-
  Date: 2019/12/30
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理风土人情，美景，美食</title>
</head>
<body>
<%
    // 获取参数
    String type = request.getParameter("type");
    String jumpPath = request.getParameter("jumpPath");
    pageContext.setAttribute("jumpPath", jumpPath);
    if(type != null){
        List<Profile> profiles = Profile.getProfileByType(type);
        pageContext.setAttribute("profiles", profiles);
    }else {
        return;
    }
%>
<c:forEach var="profile" items='${profiles}' varStatus="s">
    <div class="tab-content tabs">
        <div role="tabpanel" class="tab-pane fade show active" id="prof">
            <form action="${path}updateContent" method="post">
                <div>
                    <label for="profile-title${s.index}">标题</label>
                    <input class="form-control" type="text" name="title"
                           value="${profile.title}">
                </div>
                <div>
                    <label for="textarea${s.index}">简介内容</label>
                    <textarea name="content" id="textarea"${s.index}
                              class="form-control-range text-area" style="width: 100%"
                              rows="7">${profile.content}</textarea>
                </div>
                <input type="hidden" name="jumpPath" value="${jumpPath}">
                <input type="hidden" name="id" value="${profile.id}">
                <button type="submit" class="btn btn-primary">保存修改</button>
                <a class="btn btn-danger" href="./deleteProfile?id=${profile.id}&jumpPath=${jumpPath}">删除简介</a>
            </form>
            <div class="row mt-3">
                    <%--    简介图片--%>
                <div class="row mt-3">
                    <c:forEach var="image" items="${profile.imageList}">
                        <div class="col-md-4 col-sm-6 mt-1">
                            <div class="box-4">
                                <img src="${path}${image.img}">
                                <div class="box-4-content">
                                        <%-- 添加删除按钮 --%>
                                    <h3 class="text-center">
                                        <form action="${path}/deleteImages">
                                            <input type="hidden" name="id"
                                                   value="${image.id}">
                                            <input type="hidden" name="jumpPath"
                                                   value="${jumpPath}">
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
            <%--                                添加图片的表单--%>
        <div>
            <form action="${path}/addImages" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="exampleFormControlFile1">添加图片</label>
                    <input type="hidden" name="type" value="mj">
                    <input type="hidden" name="profile_id" value="${profile.id}">
                    <input type="hidden" name="jumpPath" value="${jumpPath}">
                    <input type="file" name="uploadFile" class="form-control-file"
                           id="exampleFormControlFile1"
                           accept="image/png, image/jpeg, image/gif, image/jpg">
                    <button type="submit" class="btn btn-primary">提交选择的文件</button>
                </div>
            </form>
        </div>
    </div>
</c:forEach>

</body>
</html>
