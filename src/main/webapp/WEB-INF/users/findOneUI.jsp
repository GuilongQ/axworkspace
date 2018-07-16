<%@ page pageEncoding="utf-8" %>
<!DOCTYPE HTML>
<html>
 <head>
 <%@ include file="../include/head.jsp" %>
  <title> 表单中的表格</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${initParam.p }/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="${initParam.p }/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="${initParam.p }/assets/css/page-min.css" rel="stylesheet" type="text/css" />   <!-- 下面的样式，仅是为了显示代码，而不应该在项目中使用-->
   <link href="${initParam.p }/assets/css/prettify.css" rel="stylesheet" type="text/css" />
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
   		$("input[name=rid]").click(function() {
   			$("input[name=price]").removeAttr("disabled");
   			$("input[name=sal]").removeAttr("disabled");
   			$("#tglx").removeAttr("disabled");
   			$("#jxms").removeAttr("disabled");
   			
   			if($(this).next().html() == "教师") {
				$("input[name=price]").attr("disabled","disabled");
				$("#tglx").attr("disabled","disabled");
				
   			} else if($(this).next().html() == "学生") {
   				$("input[name=sal]").attr("disabled","disabled");
   			} else if($(this).next().html() == "厨师") {
				$("input[name=price]").attr("disabled","disabled");
				$("#tglx").attr("disabled","disabled");
				$("#jxms").attr("disabled","disabled");
   			}
   		});
   		
   		
   		$("input[name=username]").blur(function() {
   			var val = $(this).val();
   			
   			var span = $(this).next();
   			
   			var self = this; 
   			
   			$.ajax({
   				type:"post",
   				url:"${initParam.p}/user_isUsernameExists",
   				data:{username:val},
   				
   				success:function(data) {  
   					if(data.result=="1") {
   						$("#saveBtn").attr("disabled","disabled");
   						self.focus();
   					} else {
   						$("#saveBtn").removeAttr("disabled");
   					}
   				}
   			});
   			
   		});
   		
   		
   		
   	});
   </script>
 </head>
 <body>
  
  <div class="container">
    <form action="${initParam.p }/user_save" id ="J_Form" class="form-horizontal">
      <!--    -->
      <h3>查询用户详细</h3>
      <div class="row">
      	<div class="control-group span20">
      		 <label class="control-label"><s>*</s>角色：</label>
      		 <div class="controls">
      		 	<c:forEach items="${user.roles }" var="r">
      		 		${r.rname }
      		 	</c:forEach>
	         </div>
      	</div>
      </div>
      <div class="row">
        <div class="control-group span8">
          <label class="control-label"><s>*</s>房间：</label>
          <div class="controls">
          	${user.room.position }
	      </div>
        </div>
        <div class="control-group span8">
          <label class="control-label"><s>*</s>教学模式：</label>
          <div class="controls">
            	${user.teachmode.tname }
          </div>
        </div>
        <div class="control-group span16">
          <label class="control-label"><s>*</s>托管类型：</label>
          <div class="controls">
            	${user.trusteetype.tname }
          </div>
        </div>
        
        
        <div class="control-group span8">
          <label class="control-label"><s>*</s>账号：</label>
          <div class="controls">
            ${user.username }
          </div>
        </div>
        <div class="control-group span8">
          <label class="control-label"><s>*</s>密码：</label>
          <div class="controls">
            ${user.password }
          </div>
        </div>
        <div class="control-group span8">
          <label class="control-label"><s>*</s>真实姓名：</label>
          <div class="controls">
          	${user.realname }
          </div>
        </div>
        <div class="control-group span8">
          <label class="control-label"><s>*</s>性别：</label>
          <div class="controls">
          	${user.gender }
          </div>
        </div>
        <div class="control-group span8">
          <label class="control-label"><s>*</s>生日：</label>
          <div class="controls">
          	${user.birthday }
          </div>
        </div>
        <div class="control-group span8">
          <label class="control-label"><s>*</s>手机：</label>
          <div class="controls">
          	${user.cellphone }
          </div>
        </div>
        <div class="control-group span8">
          <label class="control-label"><s>*</s>住址：</label>
          <div class="controls">
          	${user.address }
          </div>
        </div>
        <div class="control-group span8">
          <label class="control-label"><s>*</s>邮箱：</label>
          <div class="controls">
          	${user.email }
          </div>
        </div>
        <div class="control-group span8">
          <label class="control-label"><s>*</s>收费：</label>
          <div class="controls">
          	${user.price }
          </div>
        </div>
        <div class="control-group span8">
          <label class="control-label"><s>*</s>月薪：</label>
          <div class="controls">
          	${user.sal }
          </div>
        </div>
      </div>
      <hr/>
      
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