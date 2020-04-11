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
        <!-- Bootstrap core CSS -->
        <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
    </head>

    <style>
        .page-header{ margin-left:40px; margin-right: auto; }
    </style>

    <style>
        .btn-group-down{ margin-left:auto; margin-right: 40px; }
    </style>

    <style>
        .btn-group{ margin-left:40px; margin-right: auto; }
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

<!-- 分类菜单-->
<div class="btn-group">
    <a href="${pageContext.request.contextPath}/type_info/list.controller">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            文章分类 <span class="caret"></span>
        </button>
    </a>

    <a href="${pageContext.request.contextPath}/article_info/listNormal.controller">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            文章详情 <span class="caret"></span>
        </button>
    </a>

    <a href="${pageContext.request.contextPath}/article_info/listNormal_out.controller">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            回收站 <span class="caret"></span>
        </button>
    </a>

    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Action <span class="caret"></span>
    </button>

    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Action <span class="caret"></span>
    </button>
    <ul class="dropdown-menu">
        <li><a href="#">Action</a></li>
        <li><a href="#">Another action</a></li>
        <li><a href="#">Something else here</a></li>
        <li role="separator" class="divider"></li>
        <li><a href="#">Separated link</a></li>
    </ul>
</div>

<br />

</body>
</html>