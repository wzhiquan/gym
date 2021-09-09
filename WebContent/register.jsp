<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>健身管理系统 - 注册页面</title>
	<link href="style/style.css" rel="stylesheet" media="screen" type="text/css" />
	<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
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
				<form action="news_likeFind" method="post" style="left: 80%">
					<input type="hidden" name="newstype_id" value="0" /> <input
						name="q" type="text" class="search-keyword" id="search-keyword"
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
		<!-- header end -->
	
		<!-- menu start -->
		<div style="float: left; padding-left: 105px">
			<img alt="" src="<%=basePath%>/images/asdf.jpg">
		</div>
	
		<div class="main">
			<form action="user_add" method="post" id="userId">
			  <div align="center"><h3> <font color="red">会员信息注册</font></h3></div>
				<div class="register_main">
					<table>
						<tr>
	                        <td>联系电话</td>
	                        <td><input type="text" name="user.tel" id="tel" value="" required="required" /></td>
	                        <td align="left"></td>
	                    </tr>
	                    
	                    <tr>
	                        <td class="info" colspan="3">请认真填写您的联系电话</td>
	                    </tr>
						
						<tr>
							<td>密码：</td>
							<td><input type="password" name="user.password" id="password" required="required" /></td>
							<td align="left"></td>
						</tr>
						
						<tr>
							<td class="info" colspan="3">密码设置请勿过于简单，至少6位；建议使用数字、字母混合排列，区分大小写。</td>
						</tr>
						
	                    <tr>
	                        <td width="60">昵称：</td>
	                        <td width="180"><input type="text" name="user.username" id="username" required="required"/></td>
	                        <td width="210" align="left"></td>
	                    </tr>
	                    
	                    <tr>
	                        <td class="info" colspan="3">请输入您的昵称</td>
	                    </tr>
	                    
						<tr>
							<td>真实姓名</td>
							<td><input type="text" name="user.name" id="name"  required="required" /></td>
							<td align="left"></td>
						</tr>
						
						<tr>
							<td class="info" colspan="3">请填写您的真实姓名</td>
						</tr>
						
						<tr>
							<td>身份证号码</td>
							<td><input type="text" name="user.idcard" id="idcard" value="" required="required" /></td>
							<td align="left"></td>
						</tr>
						
						<tr>
							<td class="info" colspan="3">请输入您的身份证号码</td>
						</tr>
	
						<tr>
							<td colspan="3"><input type="button" value="提交" class="button" onclick="checkVals();"/></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
		<div id="blurbs" class="blurbs_top_height clearfix"
			style="padding-left: 200px">
			<div class="service">
				<h3 class="title">如何突破三角肌增长平台和避免过度训练</h3>
	
				<!-- end .thumb -->
				三角肌在很大程度上可以说是一个小肌群，主要由红肌纤维构成。这就意味着，它在整体尺寸方面的增长是有限的。在塑造圆滚的、隆起的三角肌时，半程的和静力性动作会让它得到最有效的刺激。重点应该是集中练习侧头和雕塑细部线条。
			</div>
			<div class="service">
				<h3 class="title">三角肌前束锻炼方法</h3>
				练习肩部的动作中，坐姿哑铃推肩是一个比较常规的动作。这个动作对肩部所产生的作用也是很广泛的。比如，训练初期，轻重量的哑铃推肩，可以帮助我们很好的找到肩部三角肌的感觉。中期的中等重量练习，可以大大提高三角肌中束的围度。后期的提高阶段，可以进行大重量的坐姿哑铃推肩。肩部力量和围度可以飞速增长。
			</div>
			<!-- end .service -->
			<div class="service last">
				<h3 class="title">腹肌怎么练最有效</h3>
				腹部肌群由腹直肌，腹内外斜肌以及深层的腹横肌组成，腹部肌肉的主要功能是躯干屈曲(弯曲)。由于在人体运动中的不同作用。在锻炼中通常分为上腹部和下腹部。要想拥有坚实的腹部肌肉，运动和饮食是达到目的的关键，“运动是基础轮廓，饮食就是精雕细啄”。如果不注意自己的饮食，再大强度的锻炼，也会离目标越来越远。饮食要少油腻油炸食物，多蔬菜水果，多蛋白质，少米饭馒头等碳水化合物
			</div>
			<!-- end .service -->
		</div>
		<!-- main end -->
		<div class="footer">
			<p>Copyright&nbsp;&copy;&nbsp;2017&nbsp;健身管理系统&nbsp;&nbsp;版权所有</p>
		</div>
	</body>
	<script type="text/javascript">
	   // 校验表单数据
	   function checkVals()
	   {
		   if("" == document.getElementById("tel").value)
		   {
			   alert("联系电话不能为空！");
			   document.getElementById("tel").value = "";
			   document.getElementById("tel").focus();
			   return false;
		   }
           if("" == document.getElementById("password").value)
           {
               alert("密码不能为空！");
               document.getElementById("password").value = "";
               document.getElementById("password").focus();
               return false;
           }
           if("" == document.getElementById("username").value)
           {
               alert("昵称不能为空！");
               document.getElementById("username").value = "";
               document.getElementById("username").focus();
               return false;
           }
           if("" == document.getElementById("name").value)
           {
               alert("真实姓名不能为空！");
               document.getElementById("name").value = "";
               document.getElementById("name").focus();
               return false;
           }
           if("" == document.getElementById("idcard").value)
           {
               alert("身份证号不能为空！");
               document.getElementById("idcard").value = "";
               document.getElementById("idcard").focus();
               return false;
           }
           if(!checkTel())
           {
               return false;
           }
           $("#userId").submit();
	   }
	   
		// 校验电话格式
		function checkTel()
		{
		    var reg = new RegExp("^[0-9]*$");
		    var obj = document.getElementById("tel").value;
		    if(null != obj && "" != obj)
		    {
		        if(!reg.test(obj))
		        {
		           alert("联系电话必须为全数字，请重新请输入!");
		           document.getElementById("tel").value = "";
		           document.getElementById("tel").focus();
		           return false;
		        }
		    }
		    return true;
		}	   
	</script>
</html>