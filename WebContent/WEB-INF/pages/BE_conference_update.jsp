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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改会议活动</strong></div>
  <div class="body-content">
    <form action="updateConferenceById.action" method="post" class="form-x" enctype="multipart/form-data">  
	 <!-- 获取会议活动的id-->
	  <input type="hidden" value="${Conference.confId}" name="confId">
      <div class="form-group">
        <div class="label">
          <label>会议名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${Conference.confName}" name="confName" data-validate="required:请输入会议活动名" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>会议类型：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${Conference.confType}" name="confType" data-validate="required:请输入会议类型（学术会议、教务活动、校园生活、其他）" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>会议主持人：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${Conference.confPerson}" name="confPerson" data-validate="required:请输入会议主持人" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>会议时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${Conference.confTime}" name="confTime" data-validate="required:请输入会议时间" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>会议地点：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${Conference.confLocation}" name="confLocation" data-validate="required:请输入会议地点" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>会议时长：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${Conference.confLength}" name="confLength" data-validate="required:请输入会议时长" />
          <div class="tips"></div>
        </div>
      </div>      
      
      <div class="form-group">
        <div class="label">
          <label>会议地点图片：</label>
        </div>
        <div class="field">
          <input type="file" id="url1" name="confLocationImg" class="input tips" style="width:25%; float:left;"  value=""  data-toggle="hover" data-place="right" data-image="" />
          <img src="<%=basePath%>${Conference.confLocationImg}" alt="" width="50" height="50" />
        </div>
        
      </div>     
      <div class="form-group">
        <div class="label">
          <label>会议最大容纳人数：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${Conference.confMaxPerson}" name="confMaxPerson" placeholder="请输入数字" data-validate="required:请输入会议最大容纳人数" />
          <div class="tips"></div>
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label>会议设备：</label>
        </div>
        <div class="field">
          <textarea class="input" name="confDevice" style=" height:90px;">${Conference.confDevice}</textarea>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>会议活动简介：</label>
        </div>
        <div class="field">
          <textarea class="input" name="confIntro" style=" height:90px;">${Conference.confIntro}</textarea>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 修改会议活动</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>