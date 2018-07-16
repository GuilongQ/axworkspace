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
<script>
	$(function() {
		$("input[name=mindate]").datepick({dateFormat:"yy-mm-dd"});
		$("input[name=maxdate]").datepick({dateFormat:"yy-mm-dd"});
	});
</script>
</head>
<body>
	<h3>成绩列表</h3>
	
	

	<table width="100%">
		<tr>
			<td colspan="7">
				<form id="ff" action="${initParam.p }/score_find" method="post">
						<input type="hidden" name="p" />
						课程<input type="text" name="cname" value="${cname }"/>
						学生<input type="text" name="realname" value="${realname }"/>
						<br >
						日期
						<input name="mindate" type="text" value="<fmt:formatDate value='${mindate }' pattern='yyyy-MM-dd'/>" />
						 - 
						<input name="maxdate" type="text" value="<fmt:formatDate value='${maxdate }' pattern='yyyy-MM-dd'/>" />
						<br /> 
						<button type="submit">search</button>
				</form>
			</td>
		</tr>
		<tr>
			<td>成绩id</td>
			<td>课程</td>
			<td>学生</td>
			<td>成绩</td>
			<td>日期</td>
			<td>类型</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${page.list }" var="s">
			<tr>
				<td>${s.scoreid}</td>
				<td>${s.course.cname}</td>
				<td>${s.user.realname}</td>
				<td>${s.score}</td>
				<td>${s.examdate}</td>
				<td>${s.eaxmtype}</td>
				<td>
					删除
					|
					修改
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="7">
				<%@ include file="../include/page.jsp" %>
			</td>
		</tr>
	</table>
<body>
</html>

<s:debug></s:debug>



