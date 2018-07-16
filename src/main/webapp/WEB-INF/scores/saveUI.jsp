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
 </head>
 <body>
  <script>
  	$(function() {
  		$("#roomselect").change(function() {
  			
  			var roomid = this.value;
  			
  			$.ajax({
  				type:"post",
  				url:"${initParam.p}/user_findStudentByRoom",
  				data:{"room.roomid": roomid},
  				dataType:"json",
  				success:function(data) {
  					
  					$("#studentselect").empty();
  					for(var i = 0; i < data.length; i++) {
  						$("#studentselect").append("<option value="+data[i].uid+">"+data[i].realname+"</option>");
  					}
  					
  				}
  			});
  			
  		});
  		
  		$("input[name=examdate]").datepick({dateFormat:"yy-mm-dd"});
  	});
  </script>
  
  <div class="container">
    <form action="${initParam.p }/score_save" id ="J_Form" class="form-horizontal">
      <!--    -->
      <h3>添加成绩信息</h3>
      <div class="row">
        <div class="control-group span12">
          <label class="control-label"><s>*</s>课程名称：</label>
          <div class="controls">
            <select name="course.courseid">
            	<option>--请选择--</option>
            	<c:forEach items="${courseList }" var="c">
            		<option value="${c.courseid }">${c.cname }</option>
            	</c:forEach>
            </select>
          </div>
        </div>
        <div class="control-group span12">
          <label class="control-label"><s>*</s>房间：</label>
          <div class="controls">
            <select id="roomselect">
            	<option>--请选择--</option>
            	<c:forEach items="${roomList }" var="r">
            		<option value="${r.roomid}">${r.position }</option>
            	</c:forEach>
            </select>
          </div>
        </div>
         <div class="control-group span12">
          <label class="control-label"><s>*</s>学生：</label>
          <div class="controls">
            <select name="user.uid" id="studentselect">
            </select>
          </div>
        </div>
        
        <div class="control-group span12">
          <label class="control-label"><s>*</s>成绩：</label>
          <div class="controls">
            <input name="score" type="text" />
          </div>
        </div>
        
        
         <div class="control-group span12">
          <label class="control-label"><s>*</s>日期：</label>
          <div class="controls">
            <input readonly="readonly" name="examdate" type="text" />
          </div>
        </div>
        
        
         <div class="control-group span12">
          <label class="control-label"><s>*</s>类型：</label>
          <div class="controls">
            <select name="eaxmtype">
            	<option>--请选择--</option>
            	<option>--期中--</option>
            	<option>--期末--</option>
            	<option>--测验--</option>
            </select>
          </div>
        </div>
        
      </div>
      <hr/>
      
      <div class="row">
        <div class="form-actions offset3">
          <button type="submit" class="button button-primary">保存</button>
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