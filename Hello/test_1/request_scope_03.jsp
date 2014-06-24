<%@ page language="java" import="java.util.*"contentType="text/html" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'request_scope_03.jsp' starting page</title>
    
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
  <%//设置request属性范围，此属性只在服务器跳转中起作用
  request.setAttribute("name","李兴华");
  request.setAttribute("birthday",new Date());
   %>
   <!-- 通过 超链接跳转后，地址栏改变，属于客户端跳转 -->
   <a href="request_scope_02.jsp">通过超链接取得属性</a>
    This is my JSP page. <br>
  </body>
</html>
