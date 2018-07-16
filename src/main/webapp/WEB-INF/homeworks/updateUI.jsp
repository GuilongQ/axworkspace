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
  
  <div class="container">
    <form action="${initParam.p }/role_update" id ="J_Form" class="form-horizontal">
    	<input type="hidden" name="rid" value="${r.rid }">
      <!--    -->
      <h3>修改角色信息</h3>
      <div class="row">
        <div class="control-group span12">
          <label class="control-label"><s>*</s>角色名称：</label>
          <div class="controls">
            <input value="${r.rname }" name="rname" type="text" class="control-text" data-rules="{required:true}">
          </div>
        </div>
        <div class="control-group span12">
          <label class="control-label"><s>*</s>角色描述：</label>
          <div class="controls">
            <textarea name="info" style="width:300px; height:30px" name="info" type="text" class="control-text" data-rules="{required:true}">${r.info }</textarea>
          </div>
        </div>
      </div>
      <hr/>
      
      <div class="row">
        <div class="form-actions offset3">
          <button type="submit" class="button button-primary">修改</button>
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