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
<title>课程日志列表</title>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
</head>
<body>
	<table class="table">
		<thead>
			<tr>
				<th>课程名</th>
				<th>教练名</th>
				<th>学员名</th>
				<th>记录时间</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${loglist}" var = "list">
				<tr>
					<td>${list[0]}</td>
					<td>${list[1]}</td>
					<td>${list[2]}</td>
					<td>${list[3]}</td>
				</tr> 
			</c:forEach>
		</tbody>
	</table>

</body>
</html>