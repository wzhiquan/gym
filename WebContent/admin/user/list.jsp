<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>会员列表</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<script src="<%=basePath%>jquery.min.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
</head>
<body>
	<h1>
		<span class="label label-default">会员列表 : 共${count }人</span>
	</h1>
	<table class="table">
		<thead>
			<tr>
				<th>用户昵称</th>
				<th>真实姓名</th>
				<th>登录密码</th>
				<th>联系方式</th>
				<th>身份证号</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<!-- 查看该用户的选报的课程 -->
					<td><a href="user_find?id=${list.id}">${list.username }</a></td>
					<td>${list.name }</td>
					<td>${list.password }</td>
					<td>${list.tel }</td>
					<td>${list.idcard }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>