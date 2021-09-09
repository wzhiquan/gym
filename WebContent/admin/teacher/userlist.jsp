<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	if(session.getAttribute("existTeacher") == null){
		response.sendRedirect("../index.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>课程下用户</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<script src="<%=basePath%>jquery.min.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
</head>
<body>

	<table class="table" >
		<thead>
			<tr>
				<th>用户昵称</th>
				<th>真实姓名</th>
				<th>联系方式</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${course.user}" var = "list">
				<tr>
				       <!-- 查看该用户的选报的课程 -->
					<td><a href = "user_find?id=${list.id}">${list.username}</a></td>
					<td>${list.name}</td>
					<td>${list.tel}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>