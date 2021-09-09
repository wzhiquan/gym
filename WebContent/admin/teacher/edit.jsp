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
<title>教练信息修改</title>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />

<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>

<script type="text/javascript"> 
    // 校验表单数据
    function checkVals() 
    {
        if("" == document.getElementById("course_name").value)
        {
            document.getElementById("course_name").value = "";
            document.getElementById("course_name").focus();
            alert("教练姓名不能为空！");
            return false;

        }
        
        if("" == document.getElementById("course_tel").value)
        {
            document.getElementById("course_tel").value = "";
            document.getElementById("course_tel").focus();
            alert("联系方式不能为空！");
            return false;
        }
        
        if("" == document.getElementById("course_idcard").value)
        {
            document.getElementById("course_idcard").value = "";
            document.getElementById("course_idcard").focus();
            alert("身份证号不能为空！");
            return false;           
        }
        
        if(!checkTel())
        {
            return false;
        }        
        
        $("#teacher_updateId").submit();
    }
    
    // 校验电话格式
    function checkTel()
    {
        var reg = new RegExp("^[0-9]*$");
        var obj = document.getElementById("course_tel").value;
        if(null != obj && "" != obj)
        {
            if(!reg.test(obj))
            {
               alert("联系方式必须为全数字，请重新请输入!");
               document.getElementById("course_tel").value = "";
               document.getElementById("course_tel").focus();
               return false;
            }
        }
        return true;
    }   
</script>
</head>
<body>
     <div style="height: 50px"><h1 align="center" >教练信息修改</h1></div>
	<form id="teacher_updateId" class="bs-example bs-example-form" role="form" action="teacher_update" method="post">
		<div align="center">
			<input type="hidden" name="id" class="form-control"
				value = "${teacher.id }" style="width: 100%">
			<div class="input-group" style="width: 30%">
				<span class="input-group-addon">教练姓名</span> <input type="text"
					name="name" class="form-control" value="${teacher.name }"
					style="width: 100%" id="course_name">
			</div>
			<br>
			<div class="input-group" style="width: 30%">
				<span class="input-group-addon">联系方式</span> <input type="text"
					name="tel" class="form-control" value="${teacher.tel }"
					style="width: 100%" id="course_tel">
			</div>
			<br>
			<div class="input-group" style="width: 30%">
				<span class="input-group-addon">身份证号</span> <input type="text"
					name="idcard" class="form-control" value="${teacher.idcard }"
					style="width: 100%" id="course_idcard">
			</div>
			<br>
			<input type="button" value="提交" class="btn btn-default" onclick="checkVals();"/>
		</div>
	</form>

</body>
</html>