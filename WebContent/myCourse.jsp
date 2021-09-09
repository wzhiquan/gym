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
<meta charset="utf-8">
<title>该用户所选课程</title>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
 function findCourselogs(cid){
	 $("#log").load("course_findCourselogs",{
		 cid:cid
	 });
 }
</script>
</head>
<body>
	<%-- <h2>用户${user.name}的课程：</h2> --%>
	<table class="table">
		<thead>
			<tr>
				<th>课程名称</th>
				<th>课程地点</th>
				<th>上课时间</th>
				<th>课程时间</th>
				<th>剩余课时</th>
			</tr>
		</thead>
		<c:forEach items="${clist}" var="list">

			<tr>
				<td><a href = "javascript:void(0)" onclick = "findCourselogs(${list[0]})" >${list[1]}</a></td>
				<td>${list[2]}</td>
				<td>${list[4]}</td>
				<td>${list[5]}(小时)</td>
				<c:forEach items="${times}" var="times">
					<c:if test="${times[1] == list[0]}">
						<td>${times[3]}</td>
					</c:if>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	<div id = "log" ></div>
</body>
</html>