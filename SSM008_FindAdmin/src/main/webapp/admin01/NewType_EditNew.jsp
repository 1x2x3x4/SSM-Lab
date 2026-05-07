<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/pintuer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/admin.css">
<script src="${pageContext.request.contextPath}/admin/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 修改新闻类</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="${pageContext.request.contextPath}/newsType/updateNewsTypeById">
 
      <div class="form-group">
        <div class="label">
          <label for="sitename">新闻类名称：</label>
        </div>
        <input id="typeId" name="typeId" type="hidden" value="${ newsType.typeId}"/> 
           <input id="method" name="method" type="hidden" value="updateNewsType"/> 
        <div class="field">
          <input type="text" class="input w50" id="typeName" value="${newsType.typeName}" name="typeName" size="50" placeholder="例：教育新闻" data-validate="required:请输入新闻类" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit">确认修改</button>
        </div>
      </div>      
    </form>
    		<%
if ((String)request.getAttribute("update") == "success") { %>
    <script>
    alert("修改成功！");
    document.location = "${pageContext.request.contextPath}/newsType/findNewsType?pagenum=1"
    </script>
    
<%}%>
  </div>
</div>
</body></html>