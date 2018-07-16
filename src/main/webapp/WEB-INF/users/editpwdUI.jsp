<%@page pageEncoding="utf-8" %>
<!DOCTYPE HTML>
<html>
 <head>
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
   <%@include file="../include/head.jsp" %>
 </head>
 <body>
  
  <div class="container">
    <form action="${initParam.p }/user_editpwd" method="post" id ="J_Form" class="form-horizontal">
      <!--    -->
      <h3>修改密码</h3>
      <div class="row">
        <div class="control-group span24">
          <label class="control-label"><s>*</s>旧密码：</label>
          <div class="controls">
            <input name="oldpwd" type="text" class="control-text" data-rules="{required:true}">
          </div>
        </div>
        <div class="control-group span24">
          <label class="control-label"><s>*</s>新密码：</label>
          <div class="controls">
            <input name="newpwd" type="text" class="control-text" data-rules="{required:true}">
          </div>
        </div>
      </div>

      <div class="row">
        <div class="control-group span24">
          <label class="control-label"><s>*</s>确认密码：</label>
          <div class="controls">
            <input name="newpwd2" type="text" class="control-text"  data-rules="{required:true}">
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