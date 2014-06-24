<%@ page language="java" import="java.util.*" contentType="text/html"  pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login_success.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <center>
  <h1> µÇÂ½²Ù×÷</h1>
  <hr/>
  <h2>µÇÂ½³É¹¦</h2>
  <h2>»¶Ó­<font color="red"><%=request.getParameter("uname") %></font>¹âÁÙ£¡</h2></center>
    This is my JSP page. <br>
  </body>
</html>
