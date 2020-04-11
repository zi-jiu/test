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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
    <div id="choice-box-menu-item" >
        <C:import url="../menu.jsp"></C:import>
    </div>
<!-- 表格-->
<table  class="table table-hover" style="margin-left:40px;">
    <br />
    <%--添加和更新按钮--%>
        <a href="${pageContext.request.contextPath}/type_info/list_add0.controller">
            <button type="button" id="add" class="btn btn-default" style="margin-left:40px; margin-right: auto;">
                <span class="glyphicon glyphicon-plus"></span>添加与更新
           </button>
        </a>

    <%--删除按钮--%>
    <a href="${pageContext.request.contextPath}/type_info/list_del.controller">
        <button type="button" id="delete" class="btn btn-default" >
            <span class="glyphicon glyphicon-minus"></span>删除
        </button>
    </a>

    <%--表头--%>
    <tr>
        <th style="width: 20%">id</th>
        <th style="width: 20%">排 序</th>
        <th>分   类   名   称</th>
    </tr>

    <%--表体--%>
    <tbody>
        <c:forEach items="${list}" var="entity" varStatus="status">
        <tr>
            <td >${entity.id}</td>
            <td >${entity.sort}</td>
            <td >${entity.name}</td>
        </tr>
        </c:forEach>
    </tbody>

</table>


</body>
</html>
