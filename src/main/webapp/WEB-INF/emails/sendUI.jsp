<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>发送邮件界面</h3>
	<form action="${initParam.p }/email_send" method="post">
		<table>
			<tr>
				<td>from</td>
				<td><input name="from" type="text" placeholder="请输入发件邮件地址"   /></td> 
			</tr>
			<tr>
				<td>password</td>
				<td><input name="password" type="password" placeholder="请输入发件邮件授权码"   /></td> 
			</tr>
			<tr>
				<td>to</td>
				<td><input name="to" type="text" placeholder="请输入收件邮件地址"   /></td>
			</tr>
			<tr>
				<td>选择邮箱类型</td>
				<td>
					<select name="server">
						<option value="smtp.qq.com">qq邮箱</option>
						<option value="smtp.163.com">163邮箱</option>
						<option value="smtp.sohu.com">搜狐邮箱</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>标题</td>
				<td><input name="title" type="text" placeholder="请输入收件邮件标题"   /></td>
			</tr>
			<tr>
				<td>昵称</td>
				<td><input name="nick" type="text" placeholder="请输入昵称"   /></td>
			</tr>
			<tr>
				<td>内容</td>
				<td><input name="content" type="text" placeholder="请输入收件邮件内容"   /></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">发送</button>
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>