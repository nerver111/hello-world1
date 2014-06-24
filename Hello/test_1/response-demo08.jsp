<%@ page language="java" import="java.util.*" contentType="text/html" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'response-demo08.jsp' starting page</title>
    
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
  Cookie c1=new Cookie("lxh","LiXingHua");//定义新的Cookie对象
  Cookie c2=new Cookie("hello","hello world");//定义新的Cookie对象
  c1.setMaxAge(60);//Cookie保存60秒
  c2.setMaxAge(60);//Cookie保存60秒
  response.addCookie(c1);//向客户端增加Cookie
  response.addCookie(c2); //向客户端增加Cookie
  %>
    This is my JSP page. <br>
  </body>
</html>
