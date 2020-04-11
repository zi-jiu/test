<%--
  Created by IntelliJ IDEA.
  User: 字九
  Date: 2020/3/22
  Time: 11:43
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
<script src="${pageContext.request.contextPath}/static/js/ie-emulation-modes-warning.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.8.min.js"></script>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
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
<table id="table" class="table table-hover" style="margin-left:40px; margin-right: auto;">
    <br />
    <button type="button" id="del" class="btn btn-default" style="margin-left:40px; margin-right: auto;">
        <span class="glyphicon glyphicon-trash"></span> 删除
    </button>

    <a href="${pageContext.request.contextPath}/article_info/listNormal.controller">
        <button type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-ok"></span> 不想删除了...
        </button>
    </a>

    <%--表头--%>
    <tr>
        <th style="width: 10%">序 号</th>
        <th>分 类</th>
        <th>文 章 标 题</th>
        <th>撰 写 日 期</th>
        <th>阅 读 量</th>
        <th>简 介</th>
    </tr>


    <%--表体--%>
    <tbody>
    <c:choose>
        <c:when test="${fmtw:length(pageInfo.list)==0}">
            <tr>
                <td colspan="7" style="text-align: center">你还没有写文章</td>
            </tr>
        </c:when>
        <c:otherwise>
            <c:forEach items="${pageInfo.list}" var="entity" varStatus="status">
                <tr>
                    <td ><input type="checkbox" value="${entity.id}" name="id" ></td>
                    <td >${entity.name}</td>
                    <td >${entity.title}</td>
                    <td > <fmt:formatDate value="${entity.updateTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                    <td >${entity.viewCount}</td>
                    <td >${entity.contentText}</td>
                </tr>
            </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>

</table>
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
                <a href="${pageContext.request.contextPath}/article_info/listNormal.controller?pageNumber=1">首页</a>
            </li>
            <!-- 如果还有前页就访问当前页码-1的页面， -->
            <c:if test="${pageInfo.hasPreviousPage}">
                <li>
                    <a href="${pageContext.request.contextPath}/article_info/listNormal.controller?pageNumber=${pageInfo.pageNum-1}" aria-label="Previous">
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
                <li ><a href="${pageContext.request.contextPath}/article_info/listNormal.controller?pageNumber=${page_Nums}">${page_Nums}</a></li>
            </c:if>
            </c:forEach>
            </li>
            <!-- 如果还有后页就访问当前页码+1的页面， -->
            <c:if test="${pageInfo.hasNextPage}">
                <li>
                    <a href="${pageContext.request.contextPath}/article_info/listNormal.controller?pageNumber=${pageInfo.pageNum+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
            <li><a href="${pageContext.request.contextPath}/article_info/listNormal.controller?pageNumber=${pageInfo.pages}">末页</a></li>
        </ul>
    </div>
</div>
</body>
<script>
    var idArr = new Array();

    //保存按钮点击时间
    $("#del").click(function () {
        //清空，防止脏数据
        idArr = [];
        //id
        $(':checkbox[name="id"]:checked').each(function () {
            idArr.push($(this).val());
        });

        if(idArr.length==0){
            alert("请选择要删除的数据");
        }

        if(idArr.length!=0){
            $.ajax({
                url:"${pageContext.request.contextPath}/article_info/del.json",
                type:"post",
                dataType:"json",
                traditional:"true",
                data:{
                    "idArr":idArr
                },
                success:function (result) {
                    if(result.code=="1"){
                        window.location.href="${pageContext.request.contextPath}/article_info/listNormal.controller"
                    }else{
                        alert(result.message)
                    }
                }

            });
        }



    });


</script>
</html>
