<%@ page language="java" import="java.util.*" contentType="text/html"  pageEncoding="GBK"%>
<%@ page import="demo.a.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'use_javabean_demo01.jsp' starting page</title>
    
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
  SimpleBean simple =new SimpleBean();
  simple.setName("李兴华");
  simple.setAge(30);
   %>
   <h3>姓名：<%=simple.getName() %></h3>
   <h3>年龄:<%=simple.getAge() %></h3>
    This is my JSP page. <br>
  </body>
</html>
