<%@ page language="java" import="java.util.*" contentType="text/html" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'request_demo06.jsp' starting page</title>
    
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
  <% String method =request.getMethod() ; //取得提交方式
  String ip=request.getRemoteAddr();//取得客户端的IP地址
  String path1 =request.getServletPath() ;//取得访问路径
  String contextPath=request.getContextPath();//取得上下文资源名称
  %>
  <h3>请求方式:<%=method %></h3>
  <h3>IP地址：<%=ip %></h3>
  <h3>访问路径:<%=path1 %></h3>
  <h3>上下文名称:<%=contextPath %></h3>
    This is my JSP page. <br>
  </body>
</html>
