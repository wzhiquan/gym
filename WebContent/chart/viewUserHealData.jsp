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
    <title>录入会员健康数据</title>
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css" />
    <script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
    <script src="<%=basePath%>/js/bootstrap.min.js"></script>
</head>
<body>
    <div style="height: 50px" align="center">
        <h1>
            <span class="label label-default">录入会员健康数据</span>
        </h1>
    </div>
    <br>
    <form id="form1" class="bs-example bs-example-form" role="form" method="post">
        <div align="center">
            <div class="input-group" style="width: 30%">
                <span class="input-group-addon">姓名</span> 
                <input type="text" name = "username" value="${health.username}" readonly="true" class="form-control" style="width: 100%">
            </div>
            <br>
            
            <div class="input-group" style="width: 30%">
                <span class="input-group-addon">体重</span> 
                <input type="text" name="weight" class="form-control" value="${health.weight}" readonly="true" style="width: 100%">
            </div>
            <br>
            
            <div class="input-group" style="width: 30%">
                <span class="input-group-addon">脂肪量</span> 
                <input type="text" name="fat" class="form-control" value="${health.fat}" readonly="true" style="width: 100%">
            </div>
            <br>
            
            <div class="input-group" style="width: 30%">
                <span class="input-group-addon">肌肉量</span> 
                <input type="text" name="muscle" class="form-control" value="${health.muscle}" readonly="true" style="width: 100%">
            </div>
            <br>
            
            
            <div class="input-group" style="width: 30%">
                <span class="input-group-addon">水体量</span> 
                <input type="text" name="water" class="form-control" value="${health.water}" readonly="true" style="width: 100%">
            </div>
            <br>
            
            
            <div class="input-group" style="width: 30%">
                <span class="input-group-addon">备注</span> 
                <input type="text" name="remark" class="form-control" value="${health.remark}" readonly="true" style="width: 100%">
            </div>
            <br>
            
            <div class="input-group" style="width: 30%">
                <span class="input-group-addon">创建日期</span> 
                <input type="text" name="createtime" class="form-control" value="${health.createtime}" readonly="true" style="width: 100%">
            </div>
            <br>                                                
            <a href="user_findAllOfChart">返回列表</a>
        </div>
    </form>
</body>
</html>