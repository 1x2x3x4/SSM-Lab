<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin01/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin01/css/admin.css">
    <script src="${pageContext.request.contextPath}/admin01/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/admin01/js/pintuer.js"></script>
    <style>
        input {
            height: 30px;
        }

        .form-group {
            margin-bottom: -3px;
        }
    </style>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-key"></span> 修改管理员</strong></div>

    <div class="padding border-bottom">
        <ul class="search" style="padding-left: 10px;">
            <li><a class="button border-main icon-plus-square-o"
                   href="${pageContext.request.contextPath}/findAllAdmin">
                返回管理</a></li>
        </ul>
    </div>


    <div class="body-content">
        <form method="post" class="form-x" action="${pageContext.request.contextPath}/updateAdmin">

            <%--管理员账号--%>
            <div class="form-group">
                <div class="label">
                    <label for="sitename">姓 名：</label>
                </div>
                <div class="field">
                    <input id="id" name="id" type="hidden" value="${admin.id}"/>
                    <input id="username" type="text" class="input w50" name="username" value="${admin.username}"
                           size="50" placeholder="请输入姓名" data-validate="required:请输入姓名"/>
                </div>
            </div>

            <%--管理员密码--%>
            <div class="form-group">
                <div class="label">
                    <label for="sitename">密 码：</label>
                </div>
                <div class="field">
                    <input id="password" type="text" class="input w50" name="password" value="${admin.password}"
                           size="50" placeholder="请输入密码" data-validate="required:请输入密码,length#>=6:密码不能小于6位"/>
                </div>
            </div>

            <%--管理员性别--%>
                <div class="form-group">
                    <div class="label">
                        <label for="sitename">性 别：</label>
                    </div>
                    <div class="field">
                        <input id="sex" type="text" class="input w50" name="sex" value="${admin.sex}" size="50"
                               placeholder="请输入性别" />
                    </div>
                </div>

            <%--管理员年龄--%>
            <div class="form-group">
                <div class="label">
                    <label for="sitename">年 龄：</label>
                </div>
                <div class="field">
                    <input id="age" type="text" class="input w50" name="age" value="${admin.age}" size="50"
                           placeholder="请输入年龄" />
                </div>
            </div>

            <%--管理员职业--%>
            <div class="form-group">
                <div class="label">
                    <label for="sitename">职 业：</label>
                </div>
                <div class="field">
                    <input id="jobs" type="text" class="input w50" name="jobs" value="${admin.jobs}" size="30"
                           placeholder="请输入职业" data-validate="请输入职业"/>
                </div>
            </div>

            <%--手机号码--%>
            <div class="form-group">
                <div class="label">
                    <label for="sitename">手机号码：</label>
                </div>
                <div class="field">
                    <input id="phone" type="text" class="input w50" name="phone" value="${admin.phone}" size="50"
                           placeholder="请输入手机号码" data-validate="required:请输入11位手机号码"/>
                </div>
            </div>

            <%--身份证号码--%>
            <div class="form-group">
                <div class="label">
                    <label for="sitename">身份证号码：</label>
                </div>
                <div class="field">
                    <input id="id_number" type="text" class="input w50" name="id_number" value="${admin.id_number}"
                           size="50" placeholder="请输入身份证号码" data-validate="required:请输入18位身份证号码"/>
                </div>
            </div>


            <%--地址--%>
            <div class="form-group">
                <div class="label">
                    <label for="sitename">地 址：</label>
                </div>
                <div class="field">
						<textarea name="address" cols="45" rows="8" class="input w51"
                                  size="50" placeholder="请输入地址详细内容!"
                                  data-validate="required:请输入地址详细内容！">${admin.address}</textarea>


                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 确认修改</button>
                </div>
            </div>
        </form>
        <%
            if ((String) request.getAttribute("update") == "success") { %>
        <script>
            alert("修改成功！");
            document.location = "${pageContext.request.contextPath}/admin01/findAdmin?pagenum=1"
        </script>
        <%}%>
    </div>
</div>
</body>
</html>