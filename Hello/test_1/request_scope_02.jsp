<%@ page language="java" import="java.util.*" contentType="text/html" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'request_scope_02.jsp' starting page</title>
    
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
  <%//从request属性范围中取出属性，并执行向下转型操作
  String username=(String)request.getAttribute("name");
  Date userbirthday=(Date)request.getAttribute("birthday");
   %>
   <h2>姓名：<%=username %></h2>  <!-- 输出取得的属性内容 -->
   <h2>生日:<%=userbirthday %></h2><!-- 输出取得的属性内容 -->
    This is my JSP page. <br>
  </body>
</html>
