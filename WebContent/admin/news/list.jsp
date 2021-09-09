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
<title>消息列表</title>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#hide").click(function() {
			$("p").hide();
		});
		$("#show").click(function() {
			$("p").show();
		});
	});
</script>
</head>
<body>
   <h1>
		<span class="label label-default">消息列表 : 共${count }条</span>
	</h1>
	<table class="table">
		<thead>
			<tr>
				<th>标题</th>
				<th>内容</th>
				<th>发布时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.title }<div class="form-group" style="width: 50%">
							
						</div></td>
					<td><textarea class="form-control" rows="3" readonly="readonly">${list.content }</textarea></td>
					<td>${list.time }</td>
					<td><a href="news_edit?id=${list.id}">修改</a>/
					    <a href="news_delete?id=${list.id}">删除</a>
				    </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>