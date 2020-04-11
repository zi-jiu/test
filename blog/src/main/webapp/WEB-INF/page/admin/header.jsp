<%--
  Created by IntelliJ IDEA.
  User: 字九
  Date: 2020/3/22
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>blog</title>
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
</head>

<style>
    .page-header{ margin-left:40px; margin-right: auto; }
</style>


<style>
    .btn-group-down{ margin-left:auto; margin-right: 40px; }
</style>



<body>

<!-- 头加退出按钮-->
<div class="page-header">
    <h1>博 客 后 台 <small> blog controller</small></h1>
    <span style="float:right;">
		  <div class="btn-group-down" role="group" >
              <a href="${pageContext.request.contextPath}/admin/login_out.controller">
		        <button type="button" class="btn btn-default">退        出</button>
              </a>
		  </div>
	</span>
    <br/>
    <br/>
</div>


</body>
</html>
