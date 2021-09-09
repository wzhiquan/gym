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
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title>课程信息修改</title>
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
        
        $("#course_updateId").submit();
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
			<span class="label label-default">课程信息修改</span>
		</h1>
	</div>
	<br>
	<form id="course_updateId" class="bs-example bs-example-form" role="form"
		action="course_update" method="post">
		<div align="center">
			<input type="hidden" name="id" class="form-control"
				value="${course.id}" style="width: 100%">


			<div class="input-group" style="width: 30%">
				<span class="input-group-addon">课程名称</span>
				<input id="course_name" type="text" name="name" class="form-control" value="${course.name }" required="required" style="width: 100%">
			</div>
			<br>
			<div class="input-group" style="width: 30%">
				<span class="input-group-addon">上课地点</span>
				<input id="course_place" type="text" name="place" class="form-control" value="${course.place }" required="required" style="width: 100%">
			</div>
			<br>
            
            <div class="input-group" style="width: 30%">
				<span class="input-group-addon">课程课时</span> 
				<input id="course_keshi" type="text" required="required" name="keshi" class="form-control" value="${course.keshi }" style="width: 100%">
			</div>
			<br>
 
    		<div class="input-group" style="width: 30%">
				<span class="input-group-addon">课程费用</span> 
				<input id="course_cost" type="text" required="required"
					name="cost" class="form-control" value="${course.cost } "
					style="width: 100%">
			</div>
			<br>
			
            <c:if test = "${existTeacher.type == 1 }">
			<div class="form-group" style="margin-left: 100px;">
				<div class="col-sm-10">
					<select class="form-control" name="teacher.id" style="width: 45%">
						<c:forEach items="${tlist}" var="list">
								<option value="${list.id}"> ${list.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<br>
			</c:if>
			  <c:if test = "${existTeacher.type == 0 }">
			  <div class="input-group" style="width: 30%">
				<span class="input-group-addon">授课老师</span> <input type="text"
					 class="form-control" value="${existTeacher.name }" readonly="readonly"
					style="width: 100%">
					<input type="hidden"
					name="teacher.id" class="form-control" value="${existTeacher.id}" readonly="readonly"
					style="width: 100%">
			</div>
			<br>
			</c:if>

			<div class="form-group" style="margin-left: 100px;">
				<div class="col-sm-10">
					<select class="form-control" name="times" style="width: 45%">
						<option
							<c:if test = "${course.times == '上午'}">selected="selected"</c:if>
							value="上午">上午</option>
						<option
							<c:if test = "${course.times == '下午'}">selected="selected"</c:if>
							value="下午">下午</option>
						<option
							<c:if test = "${course.times == '晚上'}">selected="selected"</c:if>
							value="晚上">晚上</option>
					</select>
				</div>
			</div>
			<br>
            <div class="form-group" style="width: 50%">
				<textarea class="form-control" rows="3" cols="3" name="remark" >${course.remark}</textarea>
			</div>
             <tr>
                 <td colspan="3"><input type="button" value="提交" class="btn btn-default" onclick="checkVals();"/></td>
             </tr>			
		</div>

	</form>

</body>
</html>