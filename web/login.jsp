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

    <title>login</title>
    
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
                  <form action="<%=basePath%>user/login" method="post">
                    <div class="form-group">
                      <label for="username">用户名</label>
                      <input type="text" class="form-control" id="username"
                             placeholder="username"   name="username">
                    </div>  
                    <div class="form-group">
                      <label for="example-password-input">密码</label>
                      <input class="form-control" type="password"
                             id="example-password-input"
                             placeholder="password" name="password">

                    </div>
                       <div>
                           <label for="remember">记住密码</label>
                           <input id="remember" type="checkbox" class="check">
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

                    <button onclick="login()" class="btn btn-general btn-blue" role="button">登录</button>
                    <button class="btn btn-general btn-white pull-right" type="button"
                            onclick = "window.location.href = '${path}index.jsp'">取消</button>
                    
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
<script>
    // 获取记住的密码
    var name = localStorage.getItem("keyName");
    var pw = localStorage.getItem("keyPass");
    $('#username').val(name);
    $('#example-password-input') .val(pw);
    if(pw != undefined && pw != ''){// 如果有密码
        $('#remember').attr("checked", "checked")
    }


    function login() {
        var strName = $('#username').val();
        var strPass = $('#example-password-input').val();
        localStorage.setItem('keyName',strName);
        // 如果选中记住密码
        if($('#remember').is(':checked')){
            localStorage.setItem('keyPass',strPass);
        }else{// 没有选中 清除密码
            localStorage.removeItem('keyPass');
        }
    }

</script>
</html>