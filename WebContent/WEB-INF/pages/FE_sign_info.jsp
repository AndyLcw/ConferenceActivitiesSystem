<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>签到任务</strong></div>
  <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
      	<li>
      	<a class="button button-little bg-green" href="jumpTo_FE_index.action" ><span class="icon-home"></span> 返回首页</a> 
      	</li>
      </ul>
  </div>
  <div class="body-content">
    <form method="post" class="form-x" action="addUserSign.action?signId=${Risk.signId}&riskState=${Risk.riskState}">        
      <div class="form-group">
        <div class="label">
          <label>签到任务id：</label>
        </div>
        <div class="field">
          <span style="line-height:33px;" >${Risk.riskId}</span>
          &nbsp;&nbsp;
          <span style="color:red">${Message}</span>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>签到任务名：</label>
        </div>
        <div class="field">
        	<span style="line-height:33px;" >${Risk.riskName}</span>
          <div class="tips"></div>
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label>签到任务简介：</label>
        </div>
        <div class="field">
          <p class="input" style=" height:90px;">${Risk.riskIntro}</p>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>任务状态：</label>
        </div>
        <div class="field">
          <span style="line-height:33px;" >${Risk.riskState}</span>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>开放时间：</label>
        </div>
        <div class="field">
          <span style="line-height:33px;" >
          <fmt:formatDate value="${Risk.riskOpenTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
          </span>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>结束时间：</label>
        </div>
        <div class="field">
          <span style="line-height:33px;" >
          <fmt:formatDate value="${Risk.riskEndTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
          </span>
        </div>
      </div>     
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 确认签到</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>