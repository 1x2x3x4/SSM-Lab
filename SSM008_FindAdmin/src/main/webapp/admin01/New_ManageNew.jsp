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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/css/pintuer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/css/admin.css">
<script src="${pageContext.request.contextPath}/admin/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/pintuer.js"></script>
</head>
<!-- <script type="text/javascript">
		function deleteNews(param){
			 if(window.confirm("您确定要删除该条新闻吗？")){
				 document.location = "${pageContext.request.contextPath}/news/deleteNewsById?id="+param;
			 }
		}
		
	</script> -->
<body>
	<form method="post" action="">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder"> 新闻列表</strong>
			</div>


			<div class="padding border-bottom">
				<ul class="search">
					<li><a class="button border-main icon-plus-square-o"
						href="${pageContext.request.contextPath}/news/goAddNews">
							添加内容</a></li>
					<li>
						<button type="button" class="button border-green" id="checkall">
							<span class="icon-check"></span> 全选
						</button>
						<button type="button" class="button border-red"
							onclick="deleteAllNews()">
							<span class="icon-trash-o"></span> 批量删除
						</button>
					</li>
				</ul>
			</div>


			<table class="table table-hover text-center">
				<tr>
					<th width="5%"></th>
					<th width="5%">新闻ID</th>
					<th width="10%">新闻类型</th>
					<th width="10%">新闻标题</th>
					<!--<th width="30%">新闻类容</th>-->
					<th width="10%">发布时间</th>
					<th width="10%">发布作者</th>
					<th width="20%">操作</th>
				</tr>
				<c:forEach items="${page.records}" var="c" varStatus="vs">
					<tr>
						<td><input id='ck' name='ck' type='checkbox' value="${c.id}"></td>
						<td>${c.id}</td>
						<td>${c.type}</td>
						<td>${c.title}</td>
						<!--<td>${c.content}</td>-->
						<td>${c.date}</td>
						<td>${c.author}</td>
						<td>
							<div class="button-group">
								<a class="button border-green"
									href="${pageContext.request.contextPath}/news/findNewsById?id=${c.id}">修改</a>
							</div>
							<div class="button-group">
								<a class="button border-red" id="DelNewsss"
									onclick="deleteNews(${c.id})"> 删除</a>
							</div>

						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="8"><%@include file="Page.jsp"%></td>
				</tr>
			</table>
		</div>
	</form>
<%
if ((String)request.getAttribute("delete") == "success") { %>
    <script>
    alert("删除成功！");
    document.location = "${pageContext.request.contextPath}/news/findNews?pagenum=1"
    </script>
    
<%}%>

</body>
<script>
	//全选/全不选
	$("#checkall").click(function(){ 
		  $("input[name='ck']").each(function(){
			  if (this.checked) {
				  this.checked = false;
			  }
			  else {
				  this.checked = true;
			  }
		  });
		})
	//批量删除
	function deleteAllNews(){
		   var checks = $("input[name='ck']:checked");
		   if(checks.length == 0){ 
				alert('未选中任何项！');
				return false;
			}
	 if(confirm('确定要删除所选吗?')){
	   //将获取的值存入数组
	   var ids = new Array();
	   checks.each(function(){
	    ids.push(this.value);
	   });
	
	$.ajax({
        type: 'GET',
        url: "${pageContext.request.contextPath}/news/deleteNewsByIds?ids="+ids,
        dataType: 'json',
        success: function (data) {
          if (data.code == 200) {
        	 alert(data.msg);
        	 document.location = "${pageContext.request.contextPath}/news/findNews?pagenum=1";
          }
        },
        error: function (data) {
        	alert(data.msg);
        },
	});

	 }
	
	}

		function deleteNews(param) {
			if (window.confirm("您确定要删除该条新闻吗？")) {
				document.location = "${pageContext.request.contextPath}/news/deleteNewsById?id="+param;
			}
		}
	</script>
</html>