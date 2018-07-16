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
	<h3>托管类型列表</h3>

	<table width="100%">
		<tr>
			<td>托管类型id</td>
			<td>托管类型名称</td>
			<td>托管类型描述</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${list }" var="t">
			<tr>
				<td>${t.trusteetypeid}</td>
				<td>${t.tname}</td>
				<td>${t.info}</td>
				<td>
					<a onclick="return confirm('确认删除?')" href="${initParam.p }/trusteetype_delete?trusteetypeid=${t.trusteetypeid}">删除</a>
					|
					<a href="${initParam.p }/trusteetype_updateUI?trusteetypeid=${t.trusteetypeid}">修改</a>
					
				</td>
			</tr>
		</c:forEach>
	</table>
<body>
</html>
