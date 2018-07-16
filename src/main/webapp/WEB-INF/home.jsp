<%@page pageEncoding="utf-8" %>
<!DOCTYPE HTML>
<html>
 <head>
  <title>爱心托管管理系统</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="${initParam.p }/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
  <link href="${initParam.p }/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
   <link href="${initParam.p }/assets/css/main-min.css" rel="stylesheet" type="text/css" />
   <%@include file="include/head.jsp" %>
 </head>
 <body>

  <div class="header">
      <div class="dl-title">
			<span class="dl-title-text">爱心托管管理系统</span>
      </div>
    <div class="dl-log">欢迎您，<span class="dl-log-user">${user.realname }</span>
    <a href="${initParam.p }/logout_logout" title="退出系统" class="dl-log-quit">[退出]</a>
    <a href="${initParam.p }/users_editpwdUI_UI" class="dl-log-quit">修改密码</a>
    </div>
  </div>
  <div class="content">
    <div class="dl-main-nav">
      <div class="dl-inform"><div class="dl-inform-title">贴心小秘书<s class="dl-inform-icon dl-up"></s></div></div>
      <ul id="J_Nav"  class="nav-list ks-clear">
        <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">基础</div></li>
        <li class="nav-item"><div class="nav-item-inner nav-order">核心业务</div></li>
        <li class="nav-item"><div class="nav-item-inner nav-inventory">绩效</div></li>
        <li class="nav-item"><div class="nav-item-inner nav-supplier">报表统计</div></li>
      </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
   </div>
  <script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="./assets/js/bui.js"></script>
  <script type="text/javascript" src="./assets/js/config.js"></script>

  <script>
    BUI.use('common/main',function(){
      var config = [{
          id:'menu', 
          homePage : 'code',
          menu:[{
              text:'角色管理',
              items:[
                {id:'code',text:'添加角色',href:'${initParam.p}/roles_saveUI_UI',closeable : false},
                {id:'main-menu',text:'查看角色',href:'${initParam.p}/role_find'}
              ]
            },{
              text:'托管类型管理',
              items:[
                {id:'operation',text:'添加托管类型',href:'${initParam.p}/trusteetypes_saveUI_UI'},
                {id:'quick',text:'查看托管类型',href:'${initParam.p}/trusteetype_findUI'}  
              ]
            },{
              text:'教学模式管理',
              items:[
                {id:'resource',text:'添加教学模式',href:'${initParam.p}/teachmodes_saveUI_UI'},
                {id:'loader',text:'查看教学模式',href:'${initParam.p}/teachmode_find'}  
              ]
            },
            {
                text:'房间管理',
                items:[
                  {id:'addroom',text:'添加房间',href:'${initParam.p}/rooms_saveUI_UI'},
                  {id:'lookroom',text:'查看房间',href:'${initParam.p}/room_find'}  
                ]
              }
            ]
          },{
            id:'form',
            menu:[{
                text:'用户管理',
                items:[
                  {id:'code',text:'添加用户',href:'${initParam.p}/user_saveUI'},
                  {id:'example',text:'查看用户',href:'${initParam.p}/user_find'}
                ]
              },{
                text:'课程管理',
                items:[
                  {id:'success',text:'添加课程',href:'${initParam.p}/courses_saveUI_UI'},
                  {id:'fail',text:'查看课程',href:'${initParam.p}/course_find'}
                ]
              },{
                text:'作业管理',
                items:[
                  {id:'grid',text:'添加作业',href:'${initParam.p}/homework_saveUI'},
                  {id:'form-grid',text:'查看作业',href:'${initParam.p}/homework_find'},
                ]
              },{
                text:'成绩管理',
                items:[
                  {id:'grid',text:'添加成绩',href:'${initParam.p}/score_saveUI'},
                  {id:'form-grid',text:'查看成绩',href:'${initParam.p}/score_find'},
                  {id:'form-grid',text:'查看报表',href:'${initParam.p}/score_reportListUI'},
                ]
              },{
                text:'邮件',
                items:[
                  {id:'grid',text:'发送邮件',href:'${initParam.p}/email_sendUI'},
                ]
              }]
          },{
            id:'search',
            menu:[{
                text:'搜索页面',
                items:[
                  {id:'code',text:'搜索页面代码',href:'search/code.html'},
                  {id:'example',text:'搜索页面示例',href:'search/example.html'},
                  {id:'example-dialog',text:'搜索页面编辑示例',href:'search/example-dialog.html'},
                  {id:'introduce',text:'搜索页面简介',href:'search/introduce.html'}, 
                  {id:'config',text:'搜索配置',href:'search/config.html'}
                ]
              },{
                text : '更多示例',
                items : [
                  {id : 'tab',text : '使用tab过滤',href : 'search/tab.html'}
                ]
              }]
          },{
            id:'detail',
            menu:[{
                text:'详情页面',
                items:[
                  {id:'code',text:'详情页面代码',href:'detail/code.html'},
                  {id:'example',text:'详情页面示例',href:'detail/example.html'},
                  {id:'introduce',text:'详情页面简介',href:'detail/introduce.html'}
                ]
              }]
          }];
      new PageUtil.MainPage({
        modulesConfig : config
      });
    });
  </script>
 </body>
</html>
