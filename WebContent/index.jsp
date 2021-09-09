<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>健身管理系统- 首页</title>
		<link href="style/style.css" rel="stylesheet" media="screen" type="text/css" />
		
		<style type="text/css">
		#banner {
			position: relative;
			width: 478px;
			height: 286px;
			border: 0px solid #666;
			overflow: hidden;
		}
		
		#banner_list img {
			border: 0px;
		}
		
		#banner_bg {
			position: absolute;
			bottom: 0;
			background-color: #000;
			height: 30px;
			filter: Alpha(Opacity = 30);
			opacity: 0.3;
			z-index: 1000;
			cursor: pointer;
			width: 478px;
		}
		
		#banner_info {
			position: absolute;
			bottom: 0;
			left: 5px;
			height: 22px;
			color: #fff;
			z-index: 1001;
			cursor: pointer
		}
		
		#banner_text {
			position: absolute;
			width: 120px;
			z-index: 1002;
			right: 3px;
			bottom: 3px;
		}
		
		#banner ul {
			position: absolute;
			list-style-type: none;
			filter: Alpha(Opacity = 80);
			opacity: 0.8;
			z-index: 1002;
			margin: 0;
			padding: 0;
			bottom: 3px;
			right: 5px;
		}
		
		#banner ul li {
			padding: 0px 8px;
			float: left;
			display: block;
			color: #FFF;
			background: #6f4f67;
			cursor: pointer;
			border: 0px solid #333;
		}
		
		#banner ul li.on {
			background-color: #000;
		}
		
		#banner_list a {
			position: absolute;
		}
		</style>
		
		<script src="<%=basePath%>/js/jquery.min.js"></script>
		<script src="<%=basePath%>/js/json2.js"></script>
		
		<script type="text/javascript">
		<!-- 查询新闻内容并显示到指定div -->
			function to(id) {
				$('#banner').load("news_findById", {
					id : id
				});
			}
		//查询我的课程 
			function findMyCourse(id){
				$("#course").load("user_findMycourse", {
					id : id
				});
			}
		
		</script>
		<!-- 实现图片轮播 -->
		<script type="text/javascript">
			var t = n = 0, count;
		
			$(document)
					.ready(
							function() {
		
								count = $("#banner_list a").length;
		
								$("#banner_list a:not(:first-child)").hide();
		
								$("#banner_info").html(
										$("#banner_list a:first-child").find("img")
												.attr('alt'));
		
								$("#banner_info").click(
										function() {
											window.open($("#banner_list a:first-child")
													.attr('href'), "_blank")
										});
		
								$("#banner li")
										.click(
												function() {
		
													var i = $(this).text() - 1;//获取Li元素内的值，即1，2，3，4
		
													n = i;
		
													if (i >= count)
														return;
		
													$("#banner_info").html(
															$("#banner_list a").eq(i)
																	.find("img").attr(
																			'alt'));
		
													$("#banner_info")
															.unbind()
															.click(
																	function() {
																		window
																				.open(
																						$(
																								"#banner_list a")
																								.eq(
																										i)
																								.attr(
																										'href'),
																						"_blank")
																	})
		
													$("#banner_list a").filter(
															":visible").fadeOut(500)
															.parent().children().eq(i)
															.fadeIn(1000);
		
													document.getElementById("banner").style.background = "";
		
													$(this).toggleClass("on");
		
													$(this).siblings().removeAttr(
															"class");
		
												});
		
								t = setInterval("showAuto()", 4000);
		
								$("#banner").hover(function() {
									clearInterval(t)
								}, function() {
									t = setInterval("showAuto()", 4000);
								});
							})
		
			function showAuto()
			{
				n = n >= (count - 1) ? 0 : ++n;
		
				$("#banner li").eq(n).trigger('click');
		
			}
		</script>
		<!-- 页面加载异步访问新闻表 -->
		<script type="text/javascript">
			$($.ajax({
				//提交方式
				type : "POST",
				//访问servleturl
				url : "news_toIndex",
				//服务器成功返回结果后，会把结果保存到data中
				success : function(result) {
					var jsonList = eval("(" + result + ")");
					$("#info").html("");//清空info内容
					for (var i = 0; i < jsonList.length; i++) {
						$("#news").append(
								" <li><a href='javascript:void(0)' onclick='to("
										+ jsonList[i]['id'] + ")'>"
										+ jsonList[i]['title'] + "</a></li>");
					}
				}
			}));
			
			$(document).ready(function(){
				$("#course").load("course_courseList");
				}); 
		</script>
		
		<script>
			jQuery(document).ready(function($) {
				$('.theme-login').click(function() {
					$('.theme-popover-mask').fadeIn(100);
					$('.theme-popover').slideDown(200);
				})
				$('.theme-poptit .close').click(function() {
					$('.theme-popover-mask').fadeOut(100);
					$('.theme-popover').slideUp(200);
				})
		
			})
		</script>
	</head>
	<body>
		<!-- header start -->
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
					<br>
					<span>【<a href="edit.jsp">信息修改</a>】【<a
						href="javascript:void(0)" onclick="findMyCourse(${existUser.id})">我的课程</a>】
					</span>
				</c:if>
			</div>
		</div>
		<div class="clear"></div>
	
		<div id="banner" style="float: left; margin: 25px 100px 0px 200px;">
			<!--标题背景-->
			<div id="banner_info"></div>
			<!--标题-->
			<ul>
				<li class="on">1</li>
				<li>2</li>
				<li>3</li>
				<li>4</li>
			</ul>
			<div id="banner_list">
				<a href="#" target="_blank"><img src="imgs/5.jpg" alt="运动改变你" /></a> 
				<a href="#" target="_blank"><img src="imgs/teacher01ps.png" alt="健身美丽你" /></a> 
				<a href="#" target="_blank"><img src="imgs/3.jpg" alt="保持好身材" /></a> 
				<a href="#" target="_blank"><img src="imgs/2.jpg" alt="你就是最美的" /></a>
				<a href="#" target="_blank"><img src="imgs/teacher03ps.png" alt="你就是最美的" /></a>
				<a href="#" target="_blank"><img src="imgs/3.jpg" alt="你就是最美的" /></a>
				<a href="#" target="_blank"><img src="imgs/teacher02ps.png" alt="你就是最美的" /></a>
			</div>
	
		</div>
		<div style="width: 50px; float: left;"></div>
	
		<div style="margin: 25px 50px 0px 200px; padding-right: 10%">
			<dl class="tbox">
				<dt>
					<strong>热点新闻</strong>
				</dt>
				<dd>
					<ul class="ico1" id="news">
					</ul>
				</dd>
			</dl>
		</div>
		
	   <div id = "course" style="margin: 25px 100px 0px 200px;">
	            
	   </div>
		<!-- footer  -->
		<div class="footer" style="margin: 10px 200px 10px 200px;" align="center">
			<p>Copyright&nbsp;&copy;&nbsp;2017&nbsp;基于SSH的健身管理系统的设计与实现&nbsp;&nbsp;</p>
	        <p><a href = "teacher/login.jsp">点击进入系统后台（教练入口）</a></p>
			<ul>
				<li style="margin-left: 40px;float: left">
				     <a href="http://www.itrust.org.cn" target="_blank"> 
				         <img width="110" height="50" alt="中国互联网协会" src="<%=basePath%>/footer/d.png">
			         </a>
				</li>
                <li style="margin-left: 50px;float:left;">
                     <a href="http://www.12377.cn/" target="_blank"> 
                         <img src="<%=basePath%>/footer/g.png" height="50" alt="中国互联网举报中心">
                     </a>
                </li>				
				<li style="margin-left: 50px;float:left;">
				     <a href="http://www.anquan.org/authenticate/cert/?site=pmp.aura-el.com&at=realname" target="_blank"> 
				         <img width="109" height="50" alt="经营性网站备案信息" src="<%=basePath%>/footer/foot-logo_03.png">
			         </a>
				</li>
				<li style="margin-left: 50px;float:left;">
				     <a href="http://www.bj.cyberpolice.cn/index.htm" target="_blank"> 
					    <img src="<%=basePath%>/footer/foot-logo_05.png" width="105" height="50" alt="网络110报警服务">
			         </a>
				</li>
				<li style="margin-left: 50px;float:left;">
				     <a href="https://ss.knet.cn/verifyseal.dll?sn=2010091500100002145&ct=df&a=1&pa=0.14296675658609825" target="_blank"> 
				         <img src="<%=basePath%>/footer/foot-logo_07.png" width="123" height="50" alt="可信网站">
		             </a>
				</li>
				<li style="margin-left: 50px;float:left;">
					<a href="https://www.baidu.com" target="_blank"> 
						<img src="<%=basePath%>/footer/foot-logo_09.png" width="107" height="50" alt="信用中国">
					</a>
				</li>			
			</ul>
		</div>
	
	</body>
</html>