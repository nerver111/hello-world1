<%@ page language="java" import="java.util.*"contentType="text/html" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'session_scope_01.jsp' starting page</title>
    
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
  <%//设置session 属性范围，此属性在一个浏览器中始终有效
  session.setAttribute("name","李兴华");
  session.setAttribute("birthday",new Date());
   %>
   <!-- 通过超链接跳转后，地址狼改变，属于客户端跳转 -->
   <a href="session_scope_02.jsp">通过超链接取得属性</a>
    This is my JSP page. <br>
  </body>
</html>
