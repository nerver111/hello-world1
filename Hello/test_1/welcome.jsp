<%@ page language="java" import="java.util.*" contentType="text/html" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'welcome.jsp' starting page</title>
    
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
  if(session.getAttribute("userid")!=null)
  {
   %>
   <h3>欢迎<%=session.getAttribute("userid") %>光临本系统，<a href="logout.jsp">注销</a>！</h3>
   <%
   }else{//非法用户，没有登录过，则session 范围没有属性存在
    %>
    <h3>请先进行系统的<a href="login.jsp">登录</a>!</h3>
    <%} %>
    This is my JSP page. <br>
  </body>
</html>
