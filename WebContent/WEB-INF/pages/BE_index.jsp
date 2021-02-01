<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理中心</title>  
    <link rel="stylesheet" href="assets/BE_index/css/pintuer.css">
    <link rel="stylesheet" href="assets/BE_index/css/admin.css">
    <script src="assets/BE_index/js/jquery.js"></script>   
</head>
<body style="background-color:#f2f9fd;">
<%
	String path = request.getContextPath();
	String basePath =request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/pics/"; 
%>
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h2><img src="<%=basePath%>${Admin.adminIcon}" class="radius-circle rotate-hover" height="50" width="50" alt="" />工大会议活动管理</h2>
  </div>
  <div class="head-l">
  	<a class="button button-little bg-green" href="jumpTo_FE_index.action" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;
  	<a class="button button-little bg-red" href="logoutAdmin.action"><span class="icon-power-off"></span> 退出登录</a> 
  </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-user"></span>信息管理</h2>
  <ul style="display:block">
    <li><a href="jumpTo_BE_admin_info.action" target="right"><span class="icon-caret-right"></span>修改信息</a></li>
<!--     
    <li><a href="page.html" target="right"><span class="icon-caret-right"></span>单页管理</a></li>  
    <li><a href="adv.html" target="right"><span class="icon-caret-right"></span>首页轮播</a></li>   
    <li><a href="book.html" target="right"><span class="icon-caret-right"></span>留言管理</a></li>     
    <li><a href="column.html" target="right"><span class="icon-caret-right"></span>栏目管理</a></li>
     -->
  </ul>   
  <h2><span class="icon-tasks"></span>活动管理</h2>
  <ul>
    <li><a href="jumpTo_BE_conference.action" target="right"><span class="icon-caret-right"></span>会议活动管理</a></li>
<!--     <li><a href="add.html" target="right"><span class="icon-caret-right"></span>添加内容</a></li>
    <li><a href="cate.html" target="right"><span class="icon-caret-right"></span>分类管理</a></li>  -->       
  </ul> 
  <h2><span class="icon-calendar-o"></span>报名管理</h2>
  <ul>
    <li><a href="jumpTo_BE_apply.action" target="right"><span class="icon-caret-right"></span>报名管理</a></li>
    <li><a href="selectAllApply.action" target="right"><span class="icon-caret-right"></span>报名表管理</a></li>
        
  </ul> 
    <h2><span class="icon-calendar"></span>签到管理</h2>
  <ul>
    <li><a href="selectAllOpenConference.action" target="right"><span class="icon-caret-right"></span>签到管理</a></li>
    <li><a href="selectAllRisk.action" target="right"><span class="icon-caret-right"></span>签到任务表管理</a></li>      
  </ul> 
      <h2><span class="icon-bar-chart-o"></span>统计管理</h2>
  <ul>
  
    <li><a href="jumpTo_BE_apply_management.action" target="right"><span class="icon-caret-right"></span>报名数据管理</a></li>
    <li><a href="jumpTo_BE_sign_management.action" target="right"><span class="icon-caret-right"></span>签到数据管理</a></li> 
    
    <li><a href="selectAllFeedback.action" target="right"><span class="icon-caret-right"></span>反馈管理</a></li>        
  </ul>
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  <li><a  class="icon-home"> 首页</a></li>
  <li><a  id="a_leader_txt">修改密码</a></li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="jumpTo_BE_admin_info.action" name="right" width="100%" height="100%"></iframe>
</div>
</body>
</html>