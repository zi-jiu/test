<%--
  Created by IntelliJ IDEA.
  User: 字九
  Date: 2020/3/19
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
    <head>
        <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>blog</title>

<%--

        <style>
            body{
                background:url(${pageContext.request.contextPath}/static/images/bg.jpg) repeat center 0;
            }
        </style>

--%>

        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/static/css/bootstrap.css" rel="stylesheet">

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="${pageContext.request.contextPath}/static/css/ie-10.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/static/css/signin.css" rel="stylesheet">


        <script src="${pageContext.request.contextPath}/static/js/ie-emulation-modes-warning.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.8.min.js"></script>
</head>

<body>

<div class="container">
    <form id="login" class="form-signin" action="admin/login_json.controller" method="post">
        <h2 class="form-signin-heading">登 录</h2>

        <label for="name" class="sr-only">Login_name</label>
        <input type="text" id="name" name="name" class="form-control" placeholder="login_name" required autofocus>

        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>

        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>

        <button id="bottom-text" class="btn btn-lg btn-primary btn-block" type="button" data-dismiss="alert" aria-label="Close">Sign in</button>
    </form>

    <script>
        $("#bottom-text").click(function () {
            $.ajax({
                url:"${pageContext.request.contextPath}/admin/login_json.controller",
                type:"POST",
                dataType:"json",
                data:$("#login").serialize(),
                success:function (result) {
                    if(result.code=="1"){
                        window.location.href="${pageContext.request.contextPath}/admin/index.controller"
                    }else{
                        alert(result.message);
                    }
                }

            });
        });
    </script>

</div> <!-- /container -->
    <script src="${pageContext.request.contextPath}/static/js/ie10-viewport-bug-workaround.js"></script>
<%--<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->--%>
<%--<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>--%>



</body>
</html>