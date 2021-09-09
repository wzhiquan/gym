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
<title>课程下用户</title>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function changeTimes(id,uid,cid) {
		 var num =  $('#id').val;
		 var n = num-2;
		$.ajax({
			//提交方式
			type : "get",
			//访问servleturl
			url : "course_changeTimesByTeacher",
			data : {  
                "cid": cid,
                 "uid":uid,
            },
			//服务器成功返回结果后，会把结果保存到data中
			success : function() {
				 alert("更新成功");
			
			}
		});
	}
</script>
</head>
<body>

	<table class="table">
		<thead>
			<tr>
				<th>用户昵称</th>
				<th>真实姓名</th>
				<th>联系方式</th>
				<th>剩余课时</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${course.user}" var="list">
				<tr>
					<!-- -->
					<td>${list.username}</td>
					<td>${list.name}</td>
					<td>${list.tel }</td>
					<td><c:forEach items="${times}" var="t">
							<c:if test="${list.id == t[2]}">
								<input type="button" value="更新课时"
									onclick="changeTimes(${t[0]},${t[2]},${t[1]})">
								<input type="text" id="${t[0]}" name = "keshi"
									value="${t[3]}" disabled="true">
							</c:if>
						</c:forEach></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
   
</body>
</html>