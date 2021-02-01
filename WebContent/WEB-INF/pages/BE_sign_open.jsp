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
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>打开签到</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="openSignRisk.action?riskId=${Risk.riskId}&confId=${Risk.confId}">        
      <div class="form-group">
        <div class="label">
          <label>签到任务id：</label>
        </div>
        <div class="field">
          <span style="line-height:33px;" >${Risk.riskId}</span>
        </div>
      </div>  
      <div class="form-group">
        <div class="label">
          <label>会议id：</label>
        </div>
        <div class="field">
          <span style="line-height:33px;" >${Risk.confId}</span>
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label>签到简介：</label>
        </div>
        <div class="field">
          <textarea class="input" name="signInfo" style=" height:90px;">${Risk.riskIntro}</textarea>
          <div class="tips"></div>
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 确认</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>