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
<title>管理员信息修改</title>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
</head>
<body>
     <div style="height: 50px"><h1 align="center" >管理员信息修改</h1></div>
     <br>
	<form class="bs-example bs-example-form" role="form" action="admin_update"
		method="post">
		<div align="center">
			<input type="hidden" name="id" class="form-control"
				value = "${exist.id }" style="width: 100%">
			<div class="input-group" style="width: 30%">
				<span class="input-group-addon">登录名称</span> <input type="text"
					name="username" class="form-control" value="${exist.username}"
					style="width: 100%">
			</div>
			<br>
			<div class="input-group" style="width: 30%">
				<span class="input-group-addon">登录密码</span> <input type="text"
					name="password" class="form-control" value="${exist.password}"
					style="width: 100%">
			</div>
			<br>
			<button type="submit" class="btn btn-default">提交</button>
		</div>
	</form>

</body>
</html>