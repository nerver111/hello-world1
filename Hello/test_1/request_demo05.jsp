<%@ page language="java" import="java.util.*" contentType="text/html" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'request_demo05.jsp' starting page</title>
    
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
  <% Enumeration enu =request.getHeaderNames();//取出全部头信息
  while(enu.hasMoreElements()){//依次取出头信息
  String headerName=(String)enu.nextElement();
  String headerValue=request.getHeader(headerName);//取出头信息内容
   %>
   <h5><%=headerName %> -->   <%=headerValue %></h5>
 
 <%} %>   This is my JSP page. <br>
  </body>
</html>
