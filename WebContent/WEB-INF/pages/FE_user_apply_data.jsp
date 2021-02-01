<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 我的报名</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
      	<li>
      		<a class="button button-little bg-green" href="jumpTo_FE_index.action" ><span class="icon-home"></span> 返回首页</a> 
      	</li>
		<li><span style="color:red">${Message}</span></li>
        <li style="float: right">
          <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="10%" style="text-align:left; padding-left:20px;">会议活动名</th>
        <th width="5%">主持人</th>
        <th width="12%">时间</th>
        <th width="10%">地点</th>
        <th>地点图片</th>
        <th width="5%">时长</th>
        <th width="8%">最大人数</th>
        <th width="10%">设备</th>
        <th width="15%">报名时间</th>
        <th width="10%">签到</th>
      </tr>
      <!-- 遍历 -->
<!--       <tr>
      	<td>5</td>
        <td style="text-align:left; padding-left:20px;">工业大学2020上半学期开学问题</td>
        <td>芮小苗</td>
        <td>2020-5-20-9:00</td>
        <td>综合楼A610</td>
        <td width="10%"><img src="assets/BE_index/images/11.jpg" alt="" width="50" height="50" /></td>
        <td><font color="#00CC99">2h</font></td>
        <td>100</td>
        <td>白板、颜料笔、黑板檫、投影</td>
        <td>
        	<div class="button-group">
        		<a class="button border-main" href="jumpTo_BE_conference_update.action"><span class="icon-edit"></span> 修改</a>
        		<a class="button border-red" href="javascript:void(0)" onclick="return del(1,1,1)"><span class="icon-trash-o"></span> 删除</a>
        	</div>
        </td>
      </tr> -->
      <c:forEach var="apply" items="${AllApplyByUser}">
            <tr>
		        <td style="text-align:left; padding-left:20px;">${apply.confName}</td>
		        <td>${apply.confPerson}</td>
		        <td>${apply.confTime}</td>
		        <td>${apply.confLocation}</td>
		        <td width="10%"><img src="<%=basePath%>${apply.confLocationImg}" alt="" width="50" height="50" /></td>
		        <td><font color="#00CC99">${apply.confLength}</font></td>
		        <td>${apply.confMaxPerson}</td>
		        <td>${apply.confDevice}</td>
		        <td>${apply.applyTime}</td>
		        <td><a href="jumpTo_FE_sign_info.action?confId=${apply.confId}" style="color:#00CC99">签到</a></td>
      		</tr>
      </c:forEach>
      <!-- 之后修改 -->
     
      <tr>
        <td colspan="12"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
      </tr>
    </table>
  </div>
</form>

</body>
</html>