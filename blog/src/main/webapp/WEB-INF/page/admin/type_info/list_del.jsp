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

    <a href="${pageContext.request.contextPath}/type_info/list.controller">
        <button type="button" class="btn btn-default">
            <span class="glyphicon glyphicon-ok"></span> 不想删除了...
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
            <td ><input type="checkbox" value="${entity.id}" name="id" ></td>
            <td >${entity.sort}</td>
            <td >${entity.name}</td>
        </tr>
    </c:forEach>
    </tbody>

</table>
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
                url:"${pageContext.request.contextPath}/type_info/list_del.json",
                type:"post",
                dataType:"json",
                traditional:"true",
                data:{
                    "idArr":idArr
                },
                success:function (result) {
                    if(result.code=="1"){
                        window.location.href="${pageContext.request.contextPath}/type_info/list.controller"
                    }else{
                        alert(result.message)
                    }
                }

            });
        }



    });


</script>
</html>
