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
<!DOCTYPE html>
<html lang="en">
<head>
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


    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-924459-10']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

    </script>

    <style>
        .navbar-inner {
            min-height: 40px;
            padding-left: 20px;
            padding-right: 20px;
            background-color: #d44413;
            background-image: -moz-linear-gradient(top, #ce4213, #dd4814);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ce4213), to(#dd4814));
            background-image: -webkit-linear-gradient(top, #ce4213, #dd4814);
            background-image: -o-linear-gradient(top, #ce4213, #dd4814);
            background-image: linear-gradient(to bottom, #13ceab, #14a4dd);
            background-repeat: repeat-x;
        }
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
            <a href="javascript:" onclick="history.go(-1);" class="navbar-brand d-flex align-items-center">
                <strong>返回上一页</strong>
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
</main>

<textarea theme="united" style="display:none;">
## 作者简介：<br/>
昵称：川<br/>
性别：男<br/>
时间：大二下，4月<br/>
方向：java后端<br/>
目标：大厂<br/>
爱好广泛：唱歌，跳舞，画画全都不会；<br/>尤其喜爱&yen;<br/>

## 关于项目：<br/>
项目名：Memory<br/>
项目描述：类似个人博客。主要功能（文章的添加，删除，修改，查询等）在后台管理实现，该页面只负责展示<br/>
<br/>
这个项目是为了ssm整合练手<br/>
因为项目存在很多不影响主要功能的bug，所以不能开源<br/>
> 项目使用了：<br/>
-  后端：ssm，拦截器，图片上传<br/>
-  前端：bootstrap，fileinput插件，md插件，strapdown插件<br/>

![](http://3mf0744750.wicp.vip/upload/2020/04/06/6e144da5-5d2c-4142-a353-bc15772831ad.png)
> 图为：前端导入文件（ps：写完这个我都觉得自己是前端了，吐了）

### 结语：
####加油！
![](http://3mf0744750.wicp.vip/upload/2020/04/06/ff7c63e6-86bc-4fb5-8cc2-87e3ac3e5e11.jpg)
</textarea>

</body>
<script src="${pageContext.request.contextPath}/static/strapdown-gh-pages/v/0.2/strapdown.js"></script>
</html>