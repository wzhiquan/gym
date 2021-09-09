<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>教练登录</title>
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<style type="text/css">
body
{
	background: url(../img/login_bg_0.jpg) #f8f6e9;
}

.mycenter
{
	margin-top: 100px;
	margin-left: auto;
	margin-right: auto;
	height: 350px;
	width: 500px;
	padding: 5%;
	padding-left: 5%;
	padding-right: 5%;
}

.mycenter mysign
{
	width: 440px;
}

.mycenter input,checkbox,button
{
	margin-top: 2%;
	margin-left: 10%;
	margin-right: 10%;
}

.mycheckbox
{
	margin-top: 10px;
	margin-left: 40px;
	margin-bottom: 10px;
	height: 10px;
}
</style>

</head>
<script type="text/javascript">
function checkTel()
{
    var reg = new RegExp("^[0-9]*$");
    var obj = document.getElementById("telephone").value;
    if(null != obj && ""!= obj)
    {
        if(!reg.test(obj))
        {
           alert("电话号码必须为全数字，请重新请输入!");
           document.getElementById("telephone").value = "";
           document.getElementById("telephone").focus();
         return false;
        }
    }
    return true;
}

function submit1()
{
	if("" == document.getElementById("telephone").value)
    {
        alert("电话号码不能为空！");
        return false;
    }
	
	if("" == document.getElementById("password").value)
    {
        alert("密码不能为空！");
        return false;
    }
	
    if(!checkTel())
    {
        return false;
    }
    $("#login").submit();
}

</script>
<body>

	<form id = "login" action="teacher_login" method="post">
		<div class="mycenter">
			<div class="mysign">
				<div class="col-lg-11 text-center text-info">
				<h2><font color="red">${msg}</font></h2>
					<h2>欢迎教练登录 </h2>
				</div>
				<div class="col-lg-10">
					<input type="text" class="form-control" name="tel" id="telephone"
						placeholder="请输入电话号码" required autofocus />
				</div>
				<div class="col-lg-10"></div>
				<div class="col-lg-10">
					<input type="password" class="form-control" name="password" id="password"
						placeholder="请输入密码" required autofocus />
				</div>
				<div class="col-lg-10"></div>
				<div class="col-lg-10"></div>
				<div class="col-lg-10" align="center">
				<input type="button"  class="btn btn-success col-lg-12" onclick="submit1()" value ="登录"/>
				</div>
			</div>
		</div>
	</form>
</body>
</html>