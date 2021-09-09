<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>健身管理系统 - 新闻详情页面</title>
<link href="style/style.css" rel="stylesheet" media="screen"
	type="text/css" />
</head>
<body>
		<div style="padding-left: 20px;border:1px;word-wrap: break-word;">
			<div class="place">
				<strong>当前位置:</strong> 主页 &gt; 文章查看
			</div>
			<div class="viewbox" style="min-height: 720px;">
				<div class="title">
					<h2>${news.title }</h2>
				</div>
				<div class="info">
					<small>时间:</small>${news.time }
				</div>
				<div class="content">${news.content }</div>
			</div>
		</div>
</body>
</html>