<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>教练列表</title>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
</head>
<body>
 	<h1>
		<span class="label label-default">教练列表 : 共${count }人</span>
		</h1>
	<table class="table">
		<thead>
			<tr>
				<th>姓名</th>
				<th>联系方式</th>
				<th>身份证号</th>
				<th>是否管理员</th>
				<th>信息操作</th>
				<th>提升权限</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var = "list">
				<tr>
					<td><a href="course_findByTid?tid=${list.id }">${list.name }</a></td>
					<td>${list.tel }</td>
					<td>${list.idcard }</td>
					<td><c:if test = "${list.type==1}">是</c:if> <c:if test = "${list.type==0}">否</c:if></td>
					<td>
						<a href="teacher_edit?id=${list.id}">修改</a>/
						<a href="teacher_delete?id=${list.id }">删除</a>
					</td>
					<td>
					<c:if test = "${list.type==0}">
					<a href="teacher_toAdmin?id=${list.id}">设置为管理员</a>
					</c:if>
					<c:if test = "${list.type==1}">
					<a href="teacher_toTeacher?id=${list.id}">置为普通教练</a>
					</c:if>
			           </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>