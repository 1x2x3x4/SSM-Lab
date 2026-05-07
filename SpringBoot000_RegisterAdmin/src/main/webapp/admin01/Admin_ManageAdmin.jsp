<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/pintuer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/admin.css">
<script src="${pageContext.request.contextPath}/admin/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/pintuer.js"></script>
</head>
<body>
	

	<div class="panel admin-panel">
		<div class="panel-head">
			<strong class="icon-reorder"> 管理员管理</strong>
		</div>
		<table class="table table-hover text-center">
			<tr>
				<th width="120">管理员ID</th>
				<th>管理员账号</th>
				<th>管理员密码</th>
				<th>性&nbsp;&nbsp;别</th>
				<th>年&nbsp;&nbsp;龄</th>
				<th>职&nbsp;&nbsp;业</th>
				<th>电&nbsp;&nbsp;话</th>
				<th>身份证号</th>
				<th>住&nbsp;&nbsp;址</th>
				<th>管理员操作</th>
			</tr>
			<c:forEach items="${admin}" var="admin" varStatus="vs">
				<tr>
					<td>${admin.id}</td>
					<td>${admin.username}</td>
					<td>${admin.password}</td>
					<td>${admin.sex}</td>
					<td>${admin.age}</td>
					<td>${admin.jobs}</td>
					<td>${admin.phone}</td>
					<td>${admin.id_number}</td>
					<td>${admin.address}</td>
					<td>
						<div class="button-group">
						<a class="button border-green" href="${pageContext.request.contextPath}/admin/findAdminById?id=${admin.id}">修改</a>
						</div>
						<div class="button-group">
							<button class="button border-red" onclick="deleteAdmin(${admin.id})">删除</button>
						</div>

					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="10"><%@include file="Page.jsp"%></td>
			</tr>
		</table>
	</div>

	<%
if ((String)request.getAttribute("delete") == "success") { %>
    <script>
    alert("删除成功！");
    document.location = "${pageContext.request.contextPath}/admin/findAdmin?pagenum=1"
    </script>
    
<%}%>


</body>
<script>
		function deleteAdmin(param) {
			
		
			if (window.confirm("您确定要删除该条新闻吗？")) {
				document.location = "${pageContext.request.contextPath}/admin/deleteAdminById?id="+param;
			}
		}
	</script>
</html>