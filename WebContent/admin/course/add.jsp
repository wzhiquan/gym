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
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<title>添加课程</title>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />

<link type="text/css" href="css/jquery-ui-1.8.17.custom.css"
	rel="stylesheet" />
<link type="text/css"
	href="admin/course/css/jquery-ui-timepicker-addon.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-ui-1.8.17.custom.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="js/jquery-ui-timepicker-zh-CN.js"></script>

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
            alert("课程名称不能为空！");
            return false;

        }
        
        if("" == document.getElementById("course_place").value)
        {
            document.getElementById("course_place").value = "";
            document.getElementById("course_place").focus();
            alert("上课地点不能为空！");
            return false;
        }
        
        if("" == document.getElementById("course_keshi").value)
        {
            document.getElementById("course_keshi").value = "";
            document.getElementById("course_keshi").focus();
            alert("课程课时不能为空！");
            return false;           
        }
        
        if("" == document.getElementById("course_cost").value)
        {
            document.getElementById("course_cost").value = "";
            document.getElementById("course_cost").focus();
            alert("课程费用不能为空！");
            return false;           
        }        
        
        if(!checkTel())
        {
            return false;
        }        
        
        $("#course_addId").submit();
    }
    
    // 校验电话格式
    function checkTel()
    {
        var reg = new RegExp("^[0-9]*$");
        var obj = document.getElementById("course_keshi").value;
        var obj2 = document.getElementById("course_cost").value;
        if(null != obj && "" != obj)
        {
            if(!reg.test(obj))
            {
               alert("课程课时必须为全数字，请重新请输入!");
               document.getElementById("course_cost").value = "";
               document.getElementById("course_cost").focus();
               return false;
            }
        }
        if(null != obj2 && "" != obj2)
        {
            if(!reg.test(obj2))
            {
               alert("课程费用必须为全数字，请重新请输入!");
               document.getElementById("course_keshi").value = "";
               document.getElementById("course_keshi").focus();
               return false;
            }
        }        
        return true;
    }   
</script>
</head>
<body>
	<div style="height: 50px">
		<h1>
			<span class="label label-default">课程添加</span>
		</h1>
	</div>
	<br>
	<form class="bs-example bs-example-form" role="form"
		action="course_add" method="post" id="course_addId">
		<div>
			<div class="input-group" style="width: 30%">
				<span class="input-group-addon">课名</span> <input type="text"
					name="name" class="form-control" placeholder="瑜伽" required="required"
					style="width: 100%" id="course_name">
			</div>
			<br>
			<div class="input-group" style="width: 30%">
				<span class="input-group-addon">地点</span> <input type="text"
					name="place" class="form-control" placeholder="911" required="required"
					style="width: 100%" id="course_place">
			</div>
			<br>

			<div class="input-group" style="width: 30%">
				<span class="input-group-addon">课时</span> <input type="text"
					name="keshi" class="form-control" placeholder="24" required="required"
					style="width: 100%" id="course_keshi">
			</div>
			<br>
			<div class="input-group" style="width: 30%">
				<span class="input-group-addon">金额</span> <input type="text"
					name="cost" class="form-control" placeholder="1000" required="required"
					style="width: 100%" id="course_cost">
			</div>
			<br>
			<div class="form-group" >
				<div class="col-sm-10" style="width: 33%">
					<select class="form-control" name="times">
						<option value="上午">上午</option>
						<option value="下午">下午</option>
						<option value="晚上">晚上</option>
					</select>
				</div>
			</div>
			<br>
			<br>
			<div class="input-group" style="width: 30%">
				<span class="input-group-addon">教练</span> <select
					class="form-control" name="teacher.id" required="required">
					<c:forEach items="${list}" var="list">
						<option   value="${list.id}">${list.name}</option>
					</c:forEach>
				</select>
			</div>
			<br>
			<div class="form-group" style="width: 50%">
				<textarea class="form-control" rows="3" name = "remark" placehoder = "课程描述"></textarea>
			</div>
	             <tr>
	                 <td colspan="3"><input type="button" value="提交" class="btn btn-default" onclick="checkVals();"/></td>
	             </tr>  
       		</div>
	</form>
</body>
</html>