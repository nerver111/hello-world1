<%@ page language="java" import="java.util.*" contentType="text/html" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'request_demo03.jsp' starting page</title>
    
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
  <% 
  request.setCharacterEncoding("GBK");//设置统一编码
  String param1 =request.getParameter("name");//接收参数
  String param2 =request.getParameter("password");//接收参数
  %>
  <h3>姓名:<%=param1 %></h3>
  <h3>密码:<%=param2 %></h3>
    This is my JSP page. <br>
  </body>
</html>
