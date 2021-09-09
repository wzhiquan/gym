<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>添加教练</title>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
<script type="text/javascript"> 
    // 校验表单数据
    function checkVals() 
    {
        if("" == document.getElementById("teacher_name").value)
        {
            document.getElementById("teacher_name").value ="";
            document.getElementById("teacher_name").focus();
            alert("姓名不能为空！");
            return false;
        }
        
        if("" == document.getElementById("teacher_tel").value)
        {
            document.getElementById("teacher_tel").value = "";
            document.getElementById("teacher_tel").focus();
            alert("联系方式不能为空！");
            return false;
        }
        
        if("" == document.getElementById("teacher_idcard").value)
        {
            document.getElementById("teacher_idcard").value = "";
            document.getElementById("teacher_idcard").focus();
            alert("身份证号不能为空！");
            return false;           
        }        
        if(!checkTel())
        {
            return false;
        }        
        $("#teacher_addId").submit();
    }
    
    // 校验电话格式
    function checkTel()
    {
        var reg = new RegExp("^[0-9]*$");
        var obj = document.getElementById("teacher_tel").value;
        if(null != obj && "" != obj)
        {
            if(!reg.test(obj))
            {
               alert("联系方式为全数字，请重新请输入!");
               document.getElementById("teacher_tel").value = "";
               document.getElementById("teacher_tel").focus();
               return false;
            }
        }
        return true;
    }   
</script>
</head>
<body>
	<div style="height: 50px" align="center">
		<h1>
			<span class="label label-default">添加教练</span>
		</h1>
	</div>
	<br>
	<form id="teacher_addId" class="bs-example bs-example-form" role="form" action="teacher_add" method="post">
		<div align="center">
			<div class="input-group" style="width: 30%">
				<span class="input-group-addon">姓名</span> <input type="text" name ="name"
					class="form-control" placeholder="汤姆" style="width: 100%" id="teacher_name">
			</div>
			<br>
			<div class="input-group" style="width: 30%">
				<span class="input-group-addon">联系方式</span> <input type="text"
					name="tel" class="form-control" placeholder="911"
					style="width: 100%" id="teacher_tel">
			</div>
			<br>
			<div class="input-group" style="width: 30%">
				<span class="input-group-addon">身份证号</span> <input type="text"
					name="idcard" class="form-control" placeholder="2115461****4468"
					style="width: 100%" id="teacher_idcard">
			</div>
			<br>
             <tr>
                 <td colspan="3"><input type="button" value="提交" class="btn btn-default" onclick="checkVals();"/></td>
             </tr>			
		</div>
	</form>
</body>
</html>