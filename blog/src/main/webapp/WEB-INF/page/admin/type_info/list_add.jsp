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
        <button type="button" id="add" class="btn btn-default" style="margin-left:40px; margin-right: auto;">
            <span class="glyphicon glyphicon-plus"></span> 添一条
        </button>

        <button type="button" id="save" class="btn btn-default">
        <span class="glyphicon glyphicon-ok"></span> 保存
        </button>

        <a href="${pageContext.request.contextPath}/type_info/list.controller">
            <button type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-ok"></span> 我不想添加了...
            </button>
        </a>

        <%--表头--%>
        <tr>
            <th style="width: 20%">id</th>
            <th style="width: 20%">排 序</th>
            <th>分   类   名   称</th>
        </tr>

    <tbody id="tbody">
    <c:forEach items="${list}" var="entity" varStatus="status">
        <tr>

            <td>
                <input id="id" type="text" placeholder="${entity.id}" value="${entity.id}" readonly="" class="form-control">
            </td>
            <td>
                <input id="sort" type="text" required="required"  value="${entity.sort}"
                       onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                       onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}"
                       name="sort" class="form-control" />
            </td>
            <td>
                <input type="text"  value="${entity.name}" id="name" name="name" class="form-control" required="required" />
            </td>
        </tr>
    </c:forEach>
    </tbody>

</table>
</body>
    <script>
        var idArr = new Array();
        var sortArr = new Array();
        var nameArr = new Array();
        //动态添加
        $("#add").click(function () {
            var html = '';
            html +='<tr>';
            html +='<td>\n' +
                '                <input class="form-control" id="id" type="text" placeholder="${entity.id}" value="${entity.id}" readonly="">\n' +
                '            </td>';
            html +='<td>\n' +
                '                <input type="text" id="sort" required="required"  value="${entity.sort}"\n' +
                '                       onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,\'\')}else{this.value=this.value.replace(/\\D/g,\'\')}"\n' +
                '                       onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,\'0\')}else{this.value=this.value.replace(/\\D/g,\'\')}"\n' +
                '                       name="sort" class="form-control" />\n' +
                '            </td>';
            html +='<td><input type="text" id="name" class="form-control" value="${entity.name}" required="required"/></td>';
            html +='</tr>';
            $("#tbody").append(html);
        });

        //保存按钮点击时间
        $("#save").click(function () {
            //清空，防止脏数据
            idArr = [];
            sortArr = [];
            nameArr = [];

            //id
            $(':input[id="id"]').each(function () {
                idArr.push($(this).val());
            });
            //sort
            $(':input[id="sort"]').each(function () {
                sortArr.push($(this).val());
            });
            //name
            $(':input[id="name"]').each(function () {
                nameArr.push($(this).val());
            });

            $.ajax({
                url:"${pageContext.request.contextPath}/type_info/list_add.json",
                type:"post",
                dataType:"json",
                traditional:"true",
                data:{
                    "idArr":idArr,
                    "sortArr":sortArr,
                    "nameArr":nameArr
                },
                success:function (result) {
                    if(result.code=="1"){
                        window.location.href="${pageContext.request.contextPath}/type_info/list.controller"
                    }else{
                        alert(result.message)
                    }
                }

            });




        });


    </script>
</html>
