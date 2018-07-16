<%@page pageEncoding="utf-8" %>
<!DOCTYPE HTML>
<html>
 <head>
  <title> 失败页面</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${initParam.p }/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="${initParam.p }/assets/css/page-min.css" rel="stylesheet" type="text/css" />  
	<%@include file="../include/head.jsp"%>
 </head>
 <body>
  
  <div class="container">
    <div class="row">
      <div class="span10">
        <div class="tips tips-large tips-warning">
          <span class="x-icon x-icon-error">×</span>
          <div class="tips-content">
            <h2>失败信息</h2>
            ${msg }
            <p class="auxiliary-text">
             	 你可以继续操作以下内容：
            </p>
            <p>
              <a target="_top" href="${initParam.p }/_home_UI" class="page-action" data-type="setTitle" href="#">返回主页</a>
            </p>
          </div>
        </div>
      </div> 
    </div>
  </div>
  <script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="../assets/js/bui-min.js"></script>

  <script type="text/javascript" src="../assets/js/config-min.js"></script>
  <script type="text/javascript">
    BUI.use('common/page');
  </script>

<body>
</html>  