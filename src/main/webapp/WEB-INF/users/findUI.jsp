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
	<h3>用户列表</h3>

	<table width="100%">
		<tr>
			<td colspan="8">
				<form id="ff" action="${initParam.p }/user_find" method="post">
					<input type="hidden" name="p" />
					姓名<input type="text" name="realname" value="${realname }" />
					手机<input type="text" name="cellphone" value="${cellphone }" />
					<button type="submit">search</button>
				</form>
			</td>
		</tr>
		<tr>
			<td>用户id</td>
			<td>账户</td>
			<td>密码</td>
			<td>真实姓名</td>
			<td>手机</td>
			<td>邮箱</td>
			<td>角色</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${page.list }" var="u">
			<tr>
				<td>${u.uid}</td>
				<td>${u.username}</td>
				<td>${u.password}</td>
				<td>
				<a href="${initParam.p }/user_findOne?uid=${u.uid}">
				${u.realname}
				</a>
				</td>
				<td>${u.cellphone}</td>
				<td>${u.email}</td>
				<td>
					<c:forEach items="${u.roles }" var="r">
						${r.rname }
					</c:forEach>
				</td>
				<td>
					<a onclick="return confirm('确认删除?')" href="${initParam.p }/user_delete?uid=${u.uid}">删除</a>
					|
					<a href="${initParam.p }/user_updateUI?uid=${u.uid}">修改</a>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="8">
				<a href="javascript:changePage(1)">首页</a>
				<a href="javascript:changePage(${page.prev })">上一页</a>
					<c:forEach begin="${page.startPage }" end="${page.endPage }" var="x">
						<a href="javascript:changePage(${x})">
								<font ${x ==page.p ? "color=red" : "" }>${x }</font>
						</a>
					</c:forEach>
				<a href="javascript:changePage(${page.next })">下一页</a>
				<a href="javascript:changePage(${page.maxPage })">末页</a>
				<form style="display:inline;" action="${initParam.p }/user_find" method="post">
					<input style="width:20px;" type="text" name="p" />
					<input type="hidden" name="realname" value="${realname }" />
					<input type="hidden" name="cellphone" value="${cellphone }" />
					<button type="submit">GO</button>
				</form>
				
				<font color="orange" size="5">
					${page.p }
				</font>
				/
				${page.maxPage }
				
				共【${page.rowCount }】条记录
			</td>
		</tr>
	</table>
<body>
</html>
