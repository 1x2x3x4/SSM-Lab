<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/lang/zh-CN.js"></script>
<style>
input {
	height: 35px;
}

.form-group {
	margin-bottom: 6px;
}
</style>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-key"></span> 修改新闻</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="${pageContext.request.contextPath}/news/updateNewsById">
				<input id="id" name="id" value="${news.id}" type="hidden" /> 
				<div class="form-group">
					<div class="label">
						<label for="sitename">新闻标题：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" name="title"
							value="${news.title}" size="50" placeholder="请输入新闻标题"
							data-validate="required:请输入新闻标题" />

					</div>
				</div>



				<div class="form-group">
					<div class="label">
						<label for="sitename">新闻类型：</label>
					</div>
					<div class="field">
						<select name="type" id="type" style="height: 35px; width: 120px;">
							<c:forEach items="${newsType}" var="c" varStatus="vs">
								<option value="${c.typeName}" selected="selected">${c.typeName}</option>
							</c:forEach>
						</select>
					</div>
				</div>



				<div class="form-group">
					<div class="label">
						<label for="sitename">新闻内容：</label>
					</div>
					<div class="field">
						<textarea id="addeditor_id" name="content" style="width: 96%; height: 350px; visibility: hidden;">${news.content}</textarea>
					</div>
				</div>


				<div class="form-group">
					<div class="label">
						<label for="sitename">发布作者：</label>
					</div>
					<div class="field">
						<input name="author" type="text" value="${news.author}"
							class="input w50" id="author" placeholder="请输入发布作者" size="50"
							data-validate="required:请输入发布作者" />
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							确认修改</button>
					</div>
				</div>
			</form>
			    <%
if ((String)request.getAttribute("update") == "success") { %>
    <script>
    alert("修改成功！");
    document.location = "${pageContext.request.contextPath}/news/findNews?pagenum=1"
    </script>
<%}%>
		</div>
	</div>
	<script type="text/javascript">
		//编辑富文本框
KindEditor.ready(function(K) {
var editor = K.create('#addeditor_id', {
										themeType : "simple",
										uploadJson : "/MyWeb045_HtmlIndex_IndexJob_IndexJob02U/Imgupload",
										resizeType : 1,
										imageTabIndex : 1,
										filterMode : true,
										allowPreviewEmoticons : false,
										allowImageUpload : true,
										allowFileManager : true,
										afterBlur : function() {
											this.sync();
										},
										afterUpload : function(url) {
											//上传图片后的代码
											var image = "<img src='"+url+"'/>";
											insertHtmlAtCaret(image);
										},
										items : [ 'source', 'undo', 'redo',
												'plainpaste', 'wordpaste',
												'clearhtml', 'quickformat',
												'selectall', 'fullscreen',
												'fontname', 'fontsize', '|',
												'forecolor', 'hilitecolor',
												'bold', 'italic', 'underline',
												'hr', 'removeformat', '|',
												'justifyleft', 'justifycenter',
												'justifyright',
												'insertorderedlist',
												'insertunorderedlist', '|',
												'link', 'image', 'unlink',
												'baidumap', 'emoticons' ]
									});
				});

		// 在光标处添加内容
		function insertHtmlAtCaret(html) {
			var sel, range;
			if (window.getSelection) {
				sel = window.getSelection();
				if (sel.getRangeAt && sel.rangeCount) {
					range = sel.getRangeAt(0);
					range.deleteContents();
					var el = document.createElement("textarea");
					el.innerHTML = html;
					var frag = document.createDocumentFragment(), node, lastNode;
					while ((node = el.firstChild)) {
						lastNode = frag.appendChild(node);
					}
					range.insertNode(frag);
					if (lastNode) {
						range = range.cloneRange();
						range.setStartAfter(lastNode);
						range.collapse(true);
						sel.removeAllRanges();
						sel.addRange(range);
					}
				}
			} else if (document.selection
					&& document.selection.type != "Control") {
				document.selection.createRange().pasteHTML(html);
			}
		}
	</script>
	${success}
</body>
</html>