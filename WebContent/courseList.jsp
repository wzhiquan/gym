<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>课程列表</title>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
</head>
<body>
	<table class="table">
		<caption>课程列表: 共${count}个</caption>
		<thead>
			<tr>
				<th>课程名</th>
				<th>地点</th>
				<th>时间</th>
			    <th>课时</th>
				<th>教练</th>
				<th>描述</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var = "list">
				<tr>
					<td>${list.name}</td>
					<td>${list.place}</td>
					<td>${list.times}</td>
					<td>${list.keshi}</td>
					<td>${list.teacher.name}</td>
					<td>${list.remark}</td>
					 <td><a href="course_into?cid=${list.id}&uid=${existUser.id}&keshi=${list.keshi}">报班</a></td> 
				</tr> 
			</c:forEach>
		</tbody>
	</table>

</body>
</html>