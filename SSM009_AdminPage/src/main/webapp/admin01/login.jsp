<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>SSM后台管理系统(李亮2025新创版)</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin01/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin01/js/login.js"></script>
<link href="${pageContext.request.contextPath}/admin01/css/login2.css" rel="stylesheet" type="text/css" />
</head>
<script language="javascript" type="text/javascript">
	function check() {
		if (document.form2.username.value == "") {
			alert("请输入登录账号!");
			return false;
		}
		if (document.form2.password.value == "") {
			alert("请输入登录密码!");
			return false;
		}
		if (document.form2.password2.value == "") {
			alert("请输入重复密码!");
			return false;
		}
		if (document.form2.password.value != document.form2.password2.value) {
			alert("对不起!重复密码不等于登录密码");
			return false;
		}

		return true;

	}
</script>
<body>
	<h1>
		系统后台登录界面<sup>(登录功能)</sup>
	</h1>

	<div class="login"
		style="margin-top: 50px; border-radius: 5px; box-shadow: 4px 4px 8px #666; border: 1px solid #dcdcdc;">
		<div class="header">
			<div class="switch" id="switch">
				<a class="switch_btn_focus" id="switch_qlogin"
					href="javascript:void(0);" tabindex="7">快速登录</a> <a
					class="switch_btn" id="switch_login" href="javascript:void(0);"
					tabindex="8">快速注册</a>
				<div class="switch_bottom" id="switch_bottom"
					style="position: absolute; width: 64px; left: 0px;"></div>
			</div>
		</div>
		<div class="web_qr_login" id="web_qr_login"
			style="display: block; height: 235px;">



			<!--登录-->
			<div class="web_login" id="web_login">
				<div class="login-box">
					<div class="login_form">
						<form action="${pageContext.request.contextPath}/loginAdmin" accept-charset="utf-8" id="login_form" class="loginForm" method="post">
							<input type="hidden" name="did" value="0" /> <input
								type="hidden" name="to" value="log" />
							<div class="uinArea" id="uinArea">
								<label class="input-tips" for="username">帐号：</label>
								<div class="inputOuter" id="uArea">
									<input type="text" id="username" name="username"
										value="${cookie.username.value}" class="inputstyle" />
								</div>
							</div>
							<div class="pwdArea" id="pwdArea">
								<label class="input-tips" for="password">密码：</label>
								<div class="inputOuter" id="pArea">

									<input type="password" id="password" name="password"
										value="${cookie.password.value}" class="inputstyle" />
								</div>
							</div>

							<div style="margin-left: 45px; margin-top: 10px">
								<input style="vertical-align: middle;" type="checkbox"
									value="yes" name="remember">记住密码<br />

							</div>

							<div style="padding-left: 50px; margin-top: 10px;">
								<input type="submit" value="登 录" style="width: 150px;"
									class="button_blue" />
							</div>
						</form>
					</div>
				</div>
			</div>
			<!--登录end-->
		</div>
		<!--注册-->
		<div class="qlogin" id="qlogin" style="display: none;">
			<div class="web_login">
				<form name="form2" id="regUser" accept-charset="utf-8"
					action="${pageContext.request.contextPath }/registerAdmin" method="post">
					<input type="hidden" name="method" value="register" /> <input
						type="hidden" name="to" value="reg" /> <input type="hidden"
						name="did" value="0" />
					<ul class="reg_form" id="reg-ul">
						<div id="userCue" class="cue">快速注册请注意格式</div>
						<li><label for="username" class="input-tips2">用户名：</label>
							<div class="inputOuter2">
								<input type="text" id="username" name="username" maxlength="16"
									class="inputstyle2" />
							</div></li>
						<li><label for="password" class="input-tips2">密码：</label>
							<div class="inputOuter2">
								<input type="password" id="password" name="password"
									maxlength="16" class="inputstyle2" />
							</div></li>
						<li><label for="password" class="input-tips2">确认密码：</label>
							<div class="inputOuter2">
								<input type="password" id="password2" name="password2"
									maxlength="16" class="inputstyle2" />
							</div></li>

						<li>
							<div class="inputArea">

								<input type="submit" id="reg" onClick="return check()"
									style="margin-top: 10px; margin-left: 85px;"
									class="button_blue" value="同意协议并注册" /> <a href="#"
									class="zcxy" target="_blank.">注册协议</a>
							</div>
						</li>
						<div class="cl"></div>
					</ul>
				</form>
			</div>
		</div>
		<div style="text-align: center">
		<%
			Object obj = request.getAttribute("message");
			if (obj != null) {
				out.print(obj);
			}
		%>
		</div>
		<!--注册end-->
	</div>
</body>
</html>