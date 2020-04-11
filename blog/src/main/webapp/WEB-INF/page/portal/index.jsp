<%--
  Created by IntelliJ IDEA.
  User: 字九
  Date: 2020/4/3
  Time: 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmtw" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en"><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Memory</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">

    <meta name="description" content="">
    <meta name="author" content="">

   <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.css" rel="stylesheet" >

    <link rel="canonical" href="https://v4.bootcss.com/docs/examples/album/">

    <style>
        .bg-light {
            background-color: #f8f9fa!important;
        }
        *, ::after, ::before {
            box-sizing: border-box;
        }

        div {
            display: block;
        }
        .card-body {
            -ms-flex: 1 1 auto;
            flex: 1 1 auto;
            min-height: 1px;
            padding: 1.25rem;
        }
        .card {
            position: relative;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-direction: column;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 1px solid rgba(0,0,0,.125);
            border-radius: .25rem;
        }

        body {
            margin: 0;
            font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
            font-size: 1.7rem;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            text-align: left;
            background-color: #fff;
        }


        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
</head>
<body>
<header>
    <div class="navbar navbar-dark bg-dark shadow-sm">
        <div class="container d-flex justify-content-between">
            <a href="${pageContext.request.contextPath}/portal/me" class="navbar-brand d-flex align-items-center">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="mr-2" viewBox="0 0 24 24" focusable="false"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path><circle cx="12" cy="13" r="4"></circle></svg>
                <strong>关于我</strong>
            </a>
        </div>
    </div>
</header>
<main role="main">

    <section class="jumbotron text-center">
        <div class="container">
            <h1>Memory</h1>
            <p class="lead text-muted">zj</p>
        </div>
    </section>

    <div class="album py-5 bg-light">
        <div class="container">
            <div class="row">
                <c:forEach items="${pageInfo.list}" var="entity" varStatus="status">
                    <div class="col-md-4">
                        <div class="card mb-4 shadow-sm">
                            <img src="${entity.cover}" width="100%" height="225">
                            <div class="card-body">
                                <p class="card-text">${entity.contentText}</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-secondary">${entity.name}</button>
                                        &nbsp;
                                        <a href="${pageContext.request.contextPath}/portal/art.controller?id=${entity.id}">
                                            <button type="button" class="btn btn-sm btn-outline-secondary"> 查看详情</button>
                                        </a>
                                    </div>
                                    <small class="text-muted"> <fmt:formatDate value="${entity.updateTime}" pattern="yyyy-MM-dd HH:mm"/></small>
                                </div>
                            </div>
                        </div>
                        <br/>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <div style="float: right;">
        <div style="float: right;">
        </div>
        <div>
            <ul class="pagination">
                <!--
            <%--当前${pageInfo.pageNum}页,共${pageInfo.pages}页,总${pageInfo.total }条记录--%>
                1.pageContext.request.contextPath表示当前项目路径，采用的是绝对路径表达方式。一般为http:localhost:8080/项目名 。
                2.首页，末页的逻辑：pn=1访问第一次，pn=<%--${pageInfo.pages}--%>访问最后一页
              -->
                <li>
                    <a href="${pageContext.request.contextPath}/portal/index.controller?pageNumber=1">首页</a>
                </li>
                <!-- 如果还有前页就访问当前页码-1的页面， -->
                <c:if test="${pageInfo.hasPreviousPage}">
                    <li>
                        <a href="${pageContext.request.contextPath}/portal/index.controller?pageNumber=${pageInfo.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <li>
                    <!--遍历所有导航页码，如果遍历的页码页当前页码相等就高亮显示，如果相等就普通显示  -->
                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Nums">
                    <c:if test="${page_Nums==pageInfo.pageNum }">
                <li class="active"><a href="#">${page_Nums}</a></li>
                </c:if>
                <c:if test="${page_Nums!=pageInfo.pageNum }">
                    <li ><a href="${pageContext.request.contextPath}/portal/index.controller?pageNumber=${page_Nums}">${page_Nums}</a></li>
                </c:if>
                </c:forEach>
                </li>
                <!-- 如果还有后页就访问当前页码+1的页面， -->
                <c:if test="${pageInfo.hasNextPage}">
                    <li>
                        <a href="${pageContext.request.contextPath}/portal/index.controller?pageNumber=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/portal/index.controller?pageNumber=${pageInfo.pages}">末页</a></li>
            </ul>
        </div>
    </div>

</main>



<footer class="text-muted">
    <div class="container">
        <p class="float-right">
            <br/>
            <a href="#">回到顶部</a>
        </p>
        <br/><br/>
    </div>
</footer>
</body></html>