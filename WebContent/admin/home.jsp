<%@page import="javax.swing.text.TabableView"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	if(session.getAttribute("existTeacher") == null)
	{
		response.sendRedirect("../index.jsp");
	}
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />
		<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
		<script src="<%=basePath%>/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			//判断是否登录
		</script>
		<title>后台管理系统</title>
	</head>
	<body>
		<!-- 导航栏部分 -->
		<div class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<div class="navbar-brand">
						<small class="glyphicon glyphicon-fire"></small> 健身管理系统
					</div>
				</div>
				<ul class="nav navbar-nav nav-stacked navbar-right">
					<li>
					<a href="#" data-toggle="dropdown"> 
						<small>Welcome</small>
							${exist.username}<span class="caret"></span>
					</a>
						<ul class="nav nav-pills nav-stacked dropdown-menu">
							<li>
								<a href="<%=basePath%>teacher_logOut"> 
									<span class="glyphicon glyphicon-off"></span> 
									Logout
								</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	
		<!-- 页面部分 -->
		<div>
			<div class="col-sm-2">
				<div class="panel-group" id="box">
					<div class="panel panel-success">
						<div class="panel-heading">个人中心</div>
						<div class="panel-collapse collapse in" id="collapseA">
							<div class="panel-body">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="teacher_edit?id=${existTeacher.id}"
										target="content">修改信息</a></li>
								</ul>
							</div>
						</div>
					</div>
	
					<div class="panel panel-success">
						<div class="panel-heading">课程管理</div>
						<div class="panel-collapse collapse in" id="collapseB">
							<div class="panel-body">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="course_findAll" target="content">课程列表</a></li>
									<li><a href="course_toAdd" target="content">添加课程</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="panel panel-success">
						<div class="panel-heading">教练管理</div>
						<div class="panel-collapse collapse in" id="collapseB">
							<div class="panel-body">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="teacher_findAll" target="content">教练列表</a></li>
									<li><a href="../admin/teacher/add.jsp" target="content">添加教练</a></li>
								</ul>
							</div>
						</div>
					</div>
	
	
					<div class="panel panel-success">
						<div class="panel-heading">会员管理</div>
						<div class="panel-collapse collapse in" id="collapseA">
							<div class="panel-body">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="../user_findAll" target="content">会员列表</a></li>
								</ul>
							</div>
						</div>
					</div>
	
					<div class="panel panel-success">
						<div class="panel-heading">消息管理</div>
						<div class="panel-collapse collapse in" id="collapseB">
							<div class="panel-body">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="news_findAll" target="content">消息列表</a></li>
									<li><a href="../admin/news/add.jsp" target="content">添加消息</a></li>
								</ul>
							</div>
						</div>
					</div>
	                <!-- add by zhiquanWang 海滨学院_毕业设计 20170505 -->
	                <div class="panel panel-success">
	                    <div class="panel-heading">图表统计</div>
	                    <div class="panel-collapse collapse in" id="collapseB">
	                        <div class="panel-body">
	                            <ul class="nav nav-pills nav-stacked">
	                                <li><a href="../charts_buyCourse" target="content">报班统计</a></li>
	                                <li><a href="../user_findAllOfChart" target="content">健康状况</a></li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	
				</div>
	
			</div>
		</div>
	
		<div style="float: left; width: 80%;" id=" main">
			<h1>教练管理中心</h1>
			<iframe id="content" name="content" frameborder="0"
				src="<%=basePath%>/img/background.png"
				style="min-height: 1000px; min-width: 100%;width:100%;">
			</iframe>
		</div>
	
	</body>
</html>
