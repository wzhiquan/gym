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
<title>健身管理系统 - 栏目新闻列表</title>
<link href="style/style.css" rel="stylesheet" media="screen"
	type="text/css" />
<script src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript">
	function to(id) {
		$('#main').load("news_findById?", {
			id : id
		});
	}
</script>
<!-- 页面加载异步访问新闻表 -->
<script type="text/javascript">
	$($.ajax({
		//提交方式
		type : "POST",
		//访问servleturl
		url : "news_toindex",
		//服务器成功返回结果后，会把结果保存到data中
		success : function(result) {
			var jsonList = eval("(" + result + ")");
			for (var i = 0; i < jsonList.length; i++) {
				$("#news").append(
						" <li><a href='javascript:void(0)' onclick='to("
								+ jsonList[i]['id'] + ")'>"
								+ jsonList[i]['title'] + "</a></li>");
			}
		}
	}));
	
</script>
</head>

<body>
	<div class="header">
		<!-- 图片 -->
		<div style="float: left; padding-left: 25px">
			<h1>
				<a href="index.jsp"><img src="images/logo11.png" width="260"
					height="56" alt="健身管理系统" /> </a>
			</h1>
		</div>
		<!-- 搜索 -->
		<div style="float: left; margin: 25px 150px 0 10px;">
			<form action="news_findByWord" method="post">
				<input name="words" type="text" class="search-keyword" id="search"
					palceholder="这里搜索" /> <input type="submit" class="search-submit"
					value="搜索" />
			</form>
		</div>
		<!-- 用户 -->
		<div style="padding-top: 25px;">
			
			<c:if test="${existUser == null }">
				<span>【<a href="register.jsp">注册</a>】【<a href="login.jsp">登录</a>】
				</span>
			</c:if>
			<c:if test="${existUser != null }">
					欢迎您：${existUser.username } <a href="user_logOut">注销</a>
			</c:if>
		</div>
	</div>
	<div class="clear"></div>
	<!-- menu end -->

	<!-- main start -->
	<div class="main">
		<!-- left start -->
		<div class="left" id="main" style="min-height: 720px;">
			<div class="place">
				<strong>当前位置:</strong> 主页 &gt; 文章列表
			</div>
			<!-- place end -->
			<ul class="newslist">
				<c:if test="${list == null }">
			 未有相关信息！！！
			</c:if>
				<c:forEach items="${list }" var="list">
					<li><a
						href="javascript:void(0)" onclick  = "to(${list.id })"
						class="title">${list.title }</a> <small>日期：</small>${list.time }
						<br></li>
				</c:forEach>
			</ul>
			<!-- newslist end -->


		</div>
		<!-- left end -->

	</div>
	<!-- main end -->

	</div>
	<!-- main end -->
	<div class="footer">
		<p>Copyright&nbsp;&copy;&nbsp;2017&nbsp;健身管理系统&nbsp;&nbsp;版权所有</p>
	</div>
</body>
</html>