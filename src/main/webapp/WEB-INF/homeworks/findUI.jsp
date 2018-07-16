<%@ page pageEncoding="utf-8"%>
<%@ include file="../include/head.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>表单中的表格</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${initParam.p }/assets/css/dpl-min.css" rel="stylesheet"
	type="text/css" />
<link href="${initParam.p }/assets/css/bui-min.css" rel="stylesheet"
	type="text/css" />
<link href="${initParam.p }/assets/css/page-min.css" rel="stylesheet"
	type="text/css" />
<!-- 下面的样式，仅是为了显示代码，而不应该在项目中使用-->
<link href="${initParam.p }/assets/css/prettify.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
code {
	padding: 0px 4px;
	color: #d14;
	background-color: #f7f7f9;
	border: 1px solid #e1e1e8;
}

body {
	padding: 30px;
}
</style>
</head>
<body>
	<h3>作业列表</h3>

	<table width="100%">
		<tr>
			<td colspan="4">
				<form id="ff" action="${initParam.p }/homework_find" method="post">
					<input type="hidden" name="p" />
					姓名:<input type="text" name="realname" value="${realname }" />
					信息:<input type="text" name="info" value="${info }" />
					<button type="submit">search</button>
				</form>
			</td>
		</tr>
		<tr>
			<td>作业id</td>
			<td>学生</td>
			<td>信息</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${page.list }" var="h">
			<tr>
				<td>${h.homeworkid}</td>
				<td>${h.user.realname}</td>
				<td>${h.info}</td>
				<td>
					<a onclick="return confirm('确认删除?')" href="${initParam.p }/homework_delete?homeworkid=${h.homeworkid}">删除</a>
					|
					<a href="${initParam.p }/homework_updateUI?homeworkid=${h.homeworkid}">修改</a>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4">
				<%@ include file="../include/page.jsp" %>
			</td>
		</tr>
	</table>
<body>
</html>
