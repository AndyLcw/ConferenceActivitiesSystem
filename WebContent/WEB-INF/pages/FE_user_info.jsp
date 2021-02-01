<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="assets/BE_index/css/pintuer.css">
<link rel="stylesheet" href="assets/BE_index/css/admin.css">
<script src="assets/BE_index/js/jquery.js"></script>
<script src="assets/BE_index/js/pintuer.js"></script>
</head>
<body>
<%
	String path = request.getContextPath();
	String basePath =request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/pics/"; 
%>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 修改信息</strong></div>
  <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
      	<li>
      	<a class="button button-little bg-green" href="jumpTo_FE_index.action" ><span class="icon-home"></span> 返回首页</a> 
      	</li>
      </ul>
  </div>
  <div class="body-content">
    <form action="updateUserInfo.action" method="post" class="form-x" enctype="multipart/form-data">
      <input type="hidden" value="${User.userId}" name="userId">
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${User.userName}" name="userName" data-validate="required:请输入用户名">
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>用户性别：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${User.userGender}" name="userGender" data-validate="required:请输入用户性别" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户头像：</label>
        </div>
        <div class="field">
          <input type="file" name="userIcon" class="input w50" >
          <img src="<%=basePath%>${User.userIcon}" alt="" width="50" height="50" />
        </div>
      </div>  
      <div class="form-group">
        <div class="label">
          <label>用户类别：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${User.userType}" name="userType" data-validate="required:请输入用户类别" />
          <div class="tips"></div>
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label>用户学院：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${User.userCollege}" name="userCollege" data-validate="required:请输入用户学院" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>学号/教工号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${User.stuNumber}" name="stuNumber" data-validate="required:请输入学号/教工号" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>手机号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${User.userPhone}" name="userPhone" data-validate="required:请输入手机号" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>邮箱：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${User.userEmail}" name="userEmail" data-validate="required:请输入邮箱" />
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>   
        </div>
      </div>      
    </form>
  </div>
</div>
</body>
</html>