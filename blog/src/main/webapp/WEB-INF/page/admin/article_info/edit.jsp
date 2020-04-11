<%--
  Created by IntelliJ IDEA.
  User: 字九
  Date: 2020/3/22
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="margin" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 插件引入 -->
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <base href="<%=basePath%>">
    <title>文章编辑</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/editor.md-master/css/editormd.css" />

    <script src="${pageContext.request.contextPath}/static/js/jquery-1.8.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/editor.md-master/editormd.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-fileinput-master/css/fileinput.css" rel="external nofollow" >
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-fileinput-master/js/fileinput.js"></script>
    <!-- 这个是汉化-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-fileinput-master/js/locales/zh.js"></script>



    <style>
        .title{ margin-left:40px; margin-right: auto; }
    </style>

    <style>
        .cover{ margin-left:40px; margin-right: auto; }
    </style>

    <style>
        .choice{ margin-left:40px; margin-right: auto; }
    </style>

</head>
<body>
<%--头部--%>
<div id="window-header" style="margin-left:40px; margin-right: auto;">
    <c:import url="../header.jsp"></c:import>
</div>
<%--菜单menu--%>
<div id="choice-box-menu-item">
    <C:import url="../menu.jsp"></C:import>
</div>
<!-- 表格-->
<table  class="table table-hover" style="margin-left:40px;">
    <form id="form" name="form" method="post" >
        <input type="hidden" name="id" value="${articleInfo.id}">

        <%--文章标题--%>
        <div class="title">
        <label for="title">Title </label>
        <input type="text" id="title" name="title" value="${articleInfo.title}" style="width: 500px" class="form-control" placeholder="title" required>
        </div>

            <%--分类选择框--%>
        <div class="choice">
                <label for="typeId">文章分类</label>
            <select name="typeId" id="typeId" style="width: 100px;" class="form-control">
                <C:forEach items="${typeList}" var="typeInfo" varStatus="status">
                    <option selected value="${typeInfo.id}">${typeInfo.name}</option>
                </C:forEach>
            </select>
        </div>

        <br/>

            <%--文件上传插件--%>
        <div class="form-group" style="margin-left:40px;margin-right: 340px">
            <div class="file-loading">
                <input id="file-1" name="file"  type="file" multiple class="file" data-overwrite-initial="false" data-theme="fas">
            </div>
        </div>

        <br/>
        <br/>
            <%--封面--%>
            <div class="cover" style="margin-left:40px;">
                <label for="cover">cover </label>
                <input type="text" id="cover" name="cover" value="${articleInfo.cover}" style="width: 800px" class="form-control" placeholder="title" >
            </div>
        <br/>

        <%--Editor.md富文本编辑器--%>
            <div id="my-editormd" >
                <textarea id="my-editormd-markdown-doc" name="my-editormd-markdown-doc" style="display:none;">${articleInfo.content}</textarea>
                <!-- 注意：name属性的值-->
                <textarea id="my-editormd-html-code" name="my-editormd-html-code" style="display:none;"></textarea>
            </div>


            <%--文章内容--%>
            <input type="hidden" id="content" name="content">
            <%--文章简介--%>
            <input type="hidden" id="contentText" name="contentText">

        <button id="save" name="save" type="submit" style="margin-left:40px; margin-right: auto;width: 70px" class="btn btn-primary">保存</button>

    </form>

</table>

<script>
    $("#file-1").fileinput({
        language: 'zh', //设置语言
        theme: 'fas',
        Param:'file',
        uploadUrl: '${pageContext.request.contextPath}/article_info/upload.json', // you must set a valid URL here else you will get an error
        allowedFileExtensions: ['jpg', 'png', 'gif'],
        overwriteInitial: false,
        maxFileSize: 1000,
        maxFilesNum: 1,
        slugCallback: function (filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
    });
    //这是提交完成后的回调函数
    $("#file-1").on("fileuploaded", function(event, data) {
        var form = data.form, files = data.files, extra = data.extra,
            response = data.response, reader = data.reader;
        console.log(response.adress);//打印出返回的json
        var a = response.adress;
        $("#cover").attr("value","http://3mf0744750.wicp.vip/upload"+a);
    });

    $(function() {
        editormd("my-editormd", {//注意1：这里的就是上面的DIV的id属性值
            width   : "90%",
            height  : 500,
            syncScrolling : "single",
            path    : "${pageContext.request.contextPath}/static/editor.md-master/lib/",//注意2：你的路径
            saveHTMLToTextarea : true, //注意3：这个配置，方便post提交表单
            /**上传图片相关配置如下*/
            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "${pageContext.request.contextPath}/article_info/editormdPic",//注意你后端的上传图片服务地址
        });
    });

    $('#my-editormd').bind('input propertychange', function() {
        var content = $('.editormd-markdown-textarea').val()
        console.log(content); //content富文本编辑器的编辑内容
        $("#content").val(content);
        $("#contentText").val(content.substring(0,100));
    });

    $("#save").click(function () {
        console.log("12345234523456");
        $.ajax({
            url:"${pageContext.request.contextPath}/article_info/save",
            type:"POST",
            dataType:"json",
            data:$("#form").serialize(),
            success:function (result) {
                console.log("123");
                console.log(result);
                if(result.code=="1"){
                    console.log("成功");
                    window.location.href="${pageContext.request.contextPath}/article_info/listNormal.controller";
                }else{
                    alert(result.message);
                }
            }
        });
    });

</script>

</body>
</html>
