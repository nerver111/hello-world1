<%@ page language="java" import="java.util.*"  contentType="text/html" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'input_bean_demo04.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <%request.setCharacterEncoding("utf-8"); %>
  <jsp:useBean id="simple" scope="page" class="demo.a.SimpleBean"></jsp:useBean>
  <jsp:setProperty name="simple" property="*"/>
  
  <body>
  <h3>姓名:<jsp:getProperty name="simple" property="name"/></h3>
  <h3>年龄:<jsp:getProperty name="simple" property="age"/></h3>
    This is my JSP page. <br>
  </body>
</html>
