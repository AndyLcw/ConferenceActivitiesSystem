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
    <div class="panel-head"><strong class="icon-reorder"> 签到管理</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
		<li><span style="color:red">${Message}</span></li>
        <li style="float: right">
          <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
      	<th width="5%">会议ID</th>
        <th width="20%" style="text-align:left; padding-left:20px;">会议活动名</th>
        <th width="5%">主持人</th>
        <th width="12%">时间</th>
        <th width="10%">地点</th>
        <th>地点图片</th>
        <th width="5%">时长</th>
        <th width="8%">最大人数</th>
        <th width="10%">设备</th>
        <th width="20%">操作</th>
      </tr>

      <c:forEach var="conf" items="${AllOpenConf}">
            <tr>
		      	<td>${conf.confId}</td>
		        <td style="text-align:left; padding-left:20px;">${conf.confName}</td>
		        <td>${conf.confPerson}</td>
		        <td>${conf.confTime}</td>
		        <td>${conf.confLocation}</td>
		        <td width="10%"><img src="<%=basePath%>${conf.confLocationImg}" alt="" width="50" height="50" /></td>
		        <td><font color="#00CC99">${conf.confLength}</font></td>
		        <td>${conf.confMaxPerson}</td>
		        <td>${conf.confDevice}</td>
		        <td>
					<div class="button-group">
		        		<a class="button border-main" href="jumpTo_BE_sign_risk.action?confId=${conf.confId}"><span class="icon-edit"></span> 创建签到任务</a>
		        	</div>
		        </td>
      		</tr>
      </c:forEach>
      <!-- 之后修改 -->
     
      <tr>
        <td colspan="12"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">

//搜索
function changesearch(){	
		
}

//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		
	}
}

</script>
</body>
</html>