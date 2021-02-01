<%@page import="edu.dlpu.controller.ImgUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String path = request.getContextPath();
	String basePath =request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/pics/"; 
%>
	<h1>成功！！！</h1>
	${teacher }
	<hr>
	<!-- 测试动态显示图片 -->
	<div>
		<c:forEach items="<%=ImgUtils.getAllPath() %>" var="path">
			<div>
				<img src="/ConferenceActivitiesSystem/${path}">
			</div>
		</c:forEach>
	</div>
	<!-- 测试Model存储数据是否可以多个页面展示 -->
	<hr>
	<h1> 测试Model存储数据是否可以多个页面展示</h1>
	      <c:forEach var="conf" items="${AllConference}">
            <tr>
		      	<td><%-- ${conf.confId} --%>xxx</td>
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
		        		<a class="button border-main" href="jumpTo_BE_conference_update.action"><span class="icon-edit"></span> 修改</a>
		        		<a class="button border-red" href="javascript:void(0)" onclick="return del(1,1,1)"><span class="icon-trash-o"></span> 删除</a>
		        	</div>
		        </td>
      		</tr>
      </c:forEach>
</body>
</html>