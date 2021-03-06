<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>健身管理系统 - 修改信息</title>
<link href="style/style.css" rel="stylesheet" media="screen"
	type="text/css" />
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

			<c:if test="${existUser != null }">
					欢迎您：${existUser.username } 【<a href="user_logOut">注销</a>】
			</c:if>
		</div>
	</div>
	<div class="clear"></div>

	<!-- main start -->
	<div class="main">
		<form action="user_update" method="post">
			<input type="hidden" name="user.id" id="id" value="${existUser.id }" />
			<div class="register_main">
				<table>
					<tr>
						<td width="60">用户名：</td>
						<td width="180"><input type="text" name="user.username"
							id="username" value="${existUser.username }" /></td>
						<td width="210" align="left"></td>
					</tr>
					<tr>
						<td class="info" colspan="3">请输入您的昵称</td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input type="text" name="user.password" id="password"
							value="${existUser.password}" /></td>
						<td align="left"></td>
					</tr>
					<tr>
						<td class="info" colspan="3">
							密码设置请勿过于简单，至少6位；建议使用数字、字母混合排列，区分大小写。</td>
					</tr>

					<tr>
						<td>真实姓名</td>
						<td><input type="text" name="user.name" id="name"
							value="${existUser.name}" /></td>
						<td align="left"></td>
					</tr>
					<tr>
						<td class="info" colspan="3">请填写您的真实姓名</td>
					</tr>


					<tr>
						<td>联系方式</td>
						<td><input type="text" name="user.tel" id="tel"
							value="${existUser.tel}" /></td>
						<td align="left"></td>
					</tr>
					<tr>
						<td class="info" colspan="3">请认真填写您的联系方式</td>
					</tr>
					<tr>
					<tr>
						<td>身份证号码</td>
						<td><input type="text" name="user.idcard" id="idcard"
							value="${existUser.idcard}" /></td>
						<td align="left"></td>
					</tr>
					<tr>
						<td class="info" colspan="3">请输入您的身份证号码</td>
					</tr>
					<td colspan="3">
						<!-- 此处显示提示信息 -->
					</td>
					</tr>

					<tr>
						<td colspan="3"><input type="submit" value="提交"
							class="button" /></td>
					</tr>
				</table>
			</div>

		</form>
		<div id="blurbs" class="blurbs_top_height clearfix">
			<div class="service">
				<h3 class="title">如何突破三角肌增长平台和避免过度训练</h3>

				<!-- end .thumb -->
				三角肌在很大程度上可以说是一个小肌群，主要由红肌纤维构成。这就意味着，它在整体尺寸方面的增长是有限的。在塑造圆滚的、隆起的三角肌时，半程的和静力性动作会让它得到最有效的刺激。重点应该是集中练习侧头和雕塑细部线条。
				</a>
			</div>
			<!-- end .service -->
			<div class="service">
				<h3 class="title">三角肌前束锻炼方法</h3>

				<!-- end .thumb -->

				练习肩部的动作中，坐姿哑铃推肩是一个比较常规的动作。这个动作对肩部所产生的作用也是很广泛的。比如，训练初期，轻重量的哑铃推肩，可以帮助我们很好的找到肩部三角肌的感觉。中期的中等重量练习，可以大大提高三角肌中束的围度。后期的提高阶段，可以进行大重量的坐姿哑铃推肩。肩部力量和围度可以飞速增长。
				</a>
			</div>
			<!-- end .service -->
			<div class="service last">
				<h3 class="title">腹肌怎么练最有效</h3>

				<!-- end .thumb -->
				腹部肌群由腹直肌，腹内外斜肌以及深层的腹横肌组成，腹部肌肉的主要功能是躯干屈曲(弯曲)。由于在人体运动中的不同作用。在锻炼中通常分为上腹部和下腹部。要想拥有坚实的腹部肌肉，运动和饮食是达到目的的关键，“运动是基础轮廓，饮食就是精雕细啄”。如果不注意自己的饮食，再大强度的锻炼，也会离目标越来越远。饮食要少油腻油炸食物，多蔬菜水果，多蛋白质，少米饭馒头等碳水化合物
			</div>
			<!-- end .service -->
		</div>
	</div>
	<!-- main end -->

	<!-- footer  -->
	<div class="footer" style="margin: 300px 200px 0px 200px;"
		align="center">
		<p>Copyright&nbsp;&copy;&nbsp;2017&nbsp;健身管理系统&nbsp;&nbsp;版权所有</p>
		<ul>
			<li style="float: left;"><a href="http://www.itrust.org.cn"
				target="_blank"> <img width="110" height="50" alt="中国互联网协会"
					src="<%=basePath%>/footer/d.png"></a></li>
			<li style="float: left"><a
				href="http://www.hd315.gov.cn/beian/view.asp?bianhao=0102000102300001"
				target="_blank"> <img width="109" height="50" alt="经营性网站备案信息"
					src="<%=basePath%>/footer/f.png"></a></li>
			<li style="float: left"><a href="http://www.12377.cn/"
				target="_blank"> <img src="<%=basePath%>/footer/g.png"
					height="50" alt="中国互联网举报中心"></a></li>
			<li style="float: left"><a
				href="http://www.bj.cyberpolice.cn/index.htm" target="_blank"> <img
					src="<%=basePath%>/footer/h.png" width="105" height="50"
					alt="网络110报警服务"></a></li>
			<li style="float: left"><a
				href="https://ss.knet.cn/verifyseal.dll?sn=2010091500100002145&ct=df&a=1&pa=0.14296675658609825"
				target="_blank"> <img src="<%=basePath%>/footer/i.png"
					width="123" height="50" alt="可信网站"></a></li>
			<li style="float: left"><a href="http://www.creditchina.gov.cn/"
				target="_blank"> <img src="<%=basePath%>/footer/j.png"
					width="107" height="50" alt="信用中国">
			</a></li>
		</ul>
	</div>
</body>
</html>