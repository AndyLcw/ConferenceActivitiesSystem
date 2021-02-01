<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%
	String path = request.getContextPath();
	String basePath =request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/pics/"; 
%>
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">我的签到</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
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
      	<th width="5%">签到id</th>
        <th width="5%" style="text-align:left; padding-left:20px;">签到任务名</th>
        <th width="20%">签到任务简介</th>
        <th width="10%">开放时间</th>
        <th width="10%">关闭时间</th>
        <th width="5%">任务状态</th>
        <th width="10%">签到时间</th>
      </tr>

      <c:forEach var="us" items="${AllUserSign}">
            <tr>
		      	<td>${us.signId}</td>
		        <td style="text-align:left; padding-left:20px;">${us.riskName}</td>
		        <td>${us.riskIntro}</td>
		        <td>
					<fmt:formatDate value="${us.riskOpenTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
		        <td>
		        	<fmt:formatDate value="${us.riskEndTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
		        </td>
		        <td>${us.riskState}</td>
		        <td>
		        	<fmt:formatDate value="${us.signTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
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
</body>
</html>