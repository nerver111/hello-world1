<%@ page language="java" import="java.util.*" contentType="text/html" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'out_demo.jsp' starting page</title>
    
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
  int buffer=out.getBufferSize();
  int available=out.getRemaining();
  int use=buffer-available;
   %>
   <h3>缓冲区的大小：<%=buffer %></h3>
   <h3>可用的缓冲区大小：<%=available %></h3>
   <h3>使用中的缓冲区大小:<%=use %></h3>
    This is my JSP page. <br>
  </body>
</html>
