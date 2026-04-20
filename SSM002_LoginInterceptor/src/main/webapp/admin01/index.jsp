<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>新闻信息管理系统</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/admin01/css/pintuer.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/admin01/css/admin.css">
    <script src="${pageContext.request.contextPath}/admin01/js/jquery.js"></script>
</head>
<body style="background-color: #f2f9fd;">
<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1>
            <img src="images/y.jpg" class="radius-circle rotate-hover" height="50" alt=""/>新闻后台管理系统
        </h1>
    </div>
    <div class="head-l" style="float: right; margin-right: 2%;">
        <span style="color: lightblue">
                <span style="color: white">登&nbsp;&nbsp;录：&nbsp;</span> ${userId}</span>
        <span style="margin-left: 20px; margin-right: 30px; color: white">身&nbsp;&nbsp;份：<span style="color: lightblue;">管理员</span>
                </span>
        <a class="button button-little bg-red"
           href="${pageContext.request.contextPath}/admin01/login.jsp">
            <span class="icon-power-off">退出登录</span>
        </a>
    </div>
</div>

<div class="leftnav">
    <div class="leftnav-title">
        <strong><span class="icon-list"></span>菜单列表</strong>
    </div>
    <h2>
        <span class="icon-pencil-square-o"></span>管理员管理
    </h2>
    <ul style="display: block;">
        <li><a href="${pageContext.request.contextPath}/admin01/Admin_AddAdmin.jsp" target="right">
            <span class="icon-caret-right"></span>添加管理员
        </a></li>
        <li><a href="${pageContext.request.contextPath}/findAllAdmin?pagenum=1" target="right">
            <span class="icon-caret-right"></span>管理员列表
        </a></li>
    </ul>
</div>

<script type="text/javascript">
    $(function () {
        $(".leftnav h2").click(function () {
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function () {
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>
<ul class="bread">
    <li><a href="${pageContext.request.contextPath}/admin01/index.jsp"
           target="_blank" class="icon-home">系统首页</a></li>
    <li><a href="##" id="a_leader_txt">网站信息</a></li>
</ul>
<div class="admin">
    <iframe scrolling="auto" rameborder="0" src="${pageContext.request.contextPath}/admin01/Main_info.jsp"
            name="right" width="100%" height="100%"></iframe>
</div>
$END$
</body>
</html>