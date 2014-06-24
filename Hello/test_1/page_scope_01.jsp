<%@ page language="java" import="java.util.*" contentType="text/html"pageEncoding="GBK"%>
<%@ page import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'page_scope_01.jsp' starting page</title>
    
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
  <%//设置page属性范围，此属性只在当前的JSP页面中起作用
  pageContext.setAttribute("name","李兴华"); 
  pageContext.setAttribute("birthday",new Date());
  %>
  <%//从page 属性范围中取出属性,并执行向下转型操作
  String username=(String)pageContext.getAttribute("name");
  Date userbirthday=(Date)pageContext.getAttribute("birthday");
   %>
   <h2>姓名：<%=username %></h2>
   <h2>生日:<%=userbirthday %></h2>
    This is my JSP page. <br>
  </body>
</html>
