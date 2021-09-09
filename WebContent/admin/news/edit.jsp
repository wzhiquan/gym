<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>新闻管理</title>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
</head>
<body>

	<div style="height: 50px">
		<h1>
			<span class="label label-default">更改消息</span>
		</h1>
	</div>
	<br>
	<form class="bs-example bs-example-form" role="form" action="news_update"
		method="post">
		<div align="left">
			<br>
			<div class="input-group" style="width: 50%">
				<span class="input-group-addon">标题</span> <input type="text"
					name="news.title" class="form-control" placeholder="${news.title }"
					style="width: 100%">
			</div>
			<br>
			<div class="form-group" style="width: 50%">
				<textarea class="form-control" rows="3" name="news.content">${news.content}</textarea>
			</div>
			<input type="hidden" name="news.time" class="form-control"
				value = <%=new Date().toLocaleString() %>> 
			<button type="submit" class="btn btn-default">提交</button>
		</div>
	</form>
</body>
</html>