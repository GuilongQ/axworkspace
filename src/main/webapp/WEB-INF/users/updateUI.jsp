<%@ page pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../include/head.jsp"%>

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
</style>
<script>
	$(function(){
		$("input[name=rid]").click(function(){
			$("input[name=price]").removeAttr("disabled");
			$("input[name=sal]").removeAttr("disabled");
			$("tglx").removeAttr("disabled");
			$("jxms").removeAttr("disabled");
			if($(this).next().html()=="教师"){
				$("input[name=price]").attr("disabled","disabled");
				$("#tglx").attr("disabled","disabled");
			}else if($(this).next().html()=="学生"){
				$("input[name=sal]").attr("disabled","disabled");
			}else if($(this).next().html()=="厨师"){
				$("input[name=price]").attr("disabled","disabled");
				$("#tglx").attr("disabled","disabled");
				$("#jxms").attr("disabled","disabled");
			}
		});
		$("input[name=username]").blur(function(){
   			var val = $(this).val();
   			var span = $(this).next;
   			var self = this;
   			$.ajax({
   				type:"post",
   				url:"${initParam.p}/user_isUsernameExists",
   				data:{username:val},
   				success:function(data){
   					if(data.result=="1"){
   					$("#savebtn").attr("disabled","disabled");
   					self.focus();
   					}else{
   						$("#savebtn").removeAttr("disabled");
   					}
   				}
   			});
   		});
		
		$("#roomselect option[value=${user.room.roomid}]").attr("selected","selected");
		<c:if test="${user.teachmode.teachmodeid!=null}">
			$("#jxms option[value=${user.teachmode.teachmodeid}]").attr("selected","selected");
		</c:if>
		<c:if test="${user.trusteetype.trusteetypeid!=null}">
			$("#tglx option[value=${user.trusteetype.trusteetypeid}]").attr("selected","selected");
		</c:if>
		$("input[name=rid][value=${userrole.rid}]").trigger("click");
	});
	
</script>
</head>
<body>
	<div class="container">
		<form action="${initParam.p }/user_update" id="J_Form"
			class="form-horizontal">
			<input type="hidden" name="uid" value="${user.uid }" />
			<h3>修改用户信息</h3>
			<div class="row">
				<div class="control-group span20">
					<label class="control-label"><s>*</s>角色：</label>
					<div class="controls">
						<c:forEach items="${roleList }" var="r">
							<label> <input type="radio" name="rid" value="${r.rid }" /><span>${r.rname }</span>
							</label>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="control-group span8">
					<label class="control-label"><s>*</s>房间：</label>
					<div class="controls">
						<select id="roomselect" name="room.roomid">
							<option value="0">--请选择--</option>
							<c:forEach items="${roomList }" var="r">
								<option value="${r.roomid }">${r.position }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label"><s>*</s>教学模式：</label>
					<div class="controls">
						<select id="jxms" name="teachmode.teachmodeid">
							<option value="0">--请选择--</option>
							<c:forEach items="${teachmodeList }" var="t">
								<option value="${t.teachmodeid}">${t.tname}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="control-group span16">
					<label class="control-label"><s>*</s>托管类型：</label>
					<div class="controls">
						<select id="tglx" name="trusteetype.trusteetypeid">
							<option value="0">--请选择--</option>
							<c:forEach items="${trusteetypeList }" var="t">
								<option value="${t.trusteetypeid }">${t.tname}</option>
							</c:forEach>
						</select>
					</div>
				</div>


				<div class="control-group span8">
					<label class="control-label"><s>*</s>账号：</label>
					<div class="controls">
						<input value="${user.username }" name="username" type="text"
							class="control-text" data-rules="{required:true}" />
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label"><s>*</s>密码：</label>
					<div class="controls">
						<input value="${user.password }" name="password" type="text"
							class="control-text" data-rules="{required:true}" />
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label"><s>*</s>真实姓名：</label>
					<div class="controls">
						<input value="${user.realname }" name="realname" type="text"
							class="control-text" data-rules="{required:true}" />
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label"><s>*</s>性别：</label>
					<div class="controls">
						<label> <input name="gender" type="radio" value="男"
							${user.gender=="男"?"checked":"" } />男
						</label> <label> <input name="gender" type="radio" value="女"
							${user.gender=="女"?"checked":"" } />女
						</label>
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label"><s>*</s>生日：</label>
					<div class="controls">
						<input type="text" value="${user.birthday }"
							name="birthday" type="text" class="control-text"
							data-rules="{required:true}" />
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label"><s>*</s>手机：</label>
					<div class="controls">
						<input value="${user.cellphone }" name="cellphone" type="text"
							class="control-text" data-rules="{required:true}" />
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label"><s>*</s>住址：</label>
					<div class="controls">
						<input value="${user.address }" name="address" type="text"
							class="control-text" data-rules="{required:true}" />
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label"><s>*</s>邮箱：</label>
					<div class="controls">
						<input value="${user.email }" name="email" type="text"
							class="control-text" data-rules="{required:true}" />
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label"><s>*</s>收费：</label>
					<div class="controls">
						<input value="${user.price }" name="price" type="text"
							class="control-text" data-rules="{required:true}" />
					</div>
				</div>
				<div class="control-group span8">
					<label class="control-label"><s>*</s>月薪：</label>
					<div class="controls">
						<input value="${user.sal }" name="sal" type="text"
							class="control-text" data-rules="{required:true}" />
					</div>
				</div>
			</div>
			<hr />

			<div class="row">
				<div class="form-actions offset3">
					<button id="savebtn" type="submit" class="button button-primary">修改</button>
					<button type="reset" class="button">重置</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="../assets/js/bui-min.js"></script>

	<script type="text/javascript" src="../assets/js/config-min.js"></script>
	<script type="text/javascript">
    BUI.use('common/page');
  </script>
	<!-- 仅仅为了显示代码使用，不要在项目中引入使用-->
	<script type="text/javascript" src="../assets/js/prettify.js"></script>
	<script type="text/javascript">
    $(function () {
      prettyPrint();
    });
  </script>
	<script type="text/javascript">
</script>
<body>
</html>
