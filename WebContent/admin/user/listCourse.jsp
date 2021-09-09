<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>该用户所选课程</title>
	<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />
	<script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
	<script src="<%=basePath%>/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function changeTimes(id,cid,uid) 
		{
			var times = document.getElementById("times").value;
			var reg = new RegExp("^[0-9]*$");
			if(null != times && "" != times)
			{
			    if(!reg.test(times))
		    	{
			        alert("课时数必须为数字，请重新输入！");
			        document.getElementById("times").value = "";
			        document.getElementById("times").focus();
			        return false;
		    	}
			}
			$($.ajax({
				// 提交方式
				type:"POST",
				url:"course_changeTimes",
				data:
				{
					"id":id,
	                "cid":cid,
	                "uid":uid,
	                "times":times
	            },
				//服务器成功返回结果后，会把结果保存到data中
				success:function() 
				{
			        alert("更新成功");
				}
			}));
		}
		
		
	</script>
</head>
<body>
	<table class="table">
		<thead>
			<tr>
				<th>课程名称</th>
				<th>课程地点</th>
				<th>上课时间</th>
				<th>更新课时</th>
				<th></th>
			</tr>
		</thead>
		
		<%-- 
		     list[0]课程ID id
		     list[1]课程名称 name  
		     list[2]课程地点 place
		     list[4]上课时间 times
        --%>
		<c:forEach items="${clist}" var="list">
			<tr>
				<td>${list[1]}</td>
				<td>${list[2]}</td>
				<td>${list[4]}</td>
				
				<%--
				     times[0]主键ID id
				     times[1]课程ID cid
				     times[2]会员ID uid
				     times[3]课时数 times
				 --%>
				<c:forEach items="${times}" var="times">
					<c:if test="${times[1] == list[0] }">
						<td>
						    <input type="text" id="times" name="times" value="${times[3]}"/>
						</td>
						<td>
						    <input type="button" value="确认更新课时" onclick='changeTimes(${times[0]},${times[1]},${times[2]});'/>
						</td>
					</c:if>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	<input type="button" value="返回到上页" class="button" onclick="javascript:history.back(-1);" />
</body>
</html>