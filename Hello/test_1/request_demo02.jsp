<%@ page language="java" import="java.util.*" contentType="text/html" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'request_demo02.jsp' starting page</title>
    
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
  request.setCharacterEncoding("utf-8");//设置统一编码
  String id=request.getParameter("id");//接收隐藏域提交的参数
  String name=request.getParameter("uname");//接收文本框提交的参数
  String inst[]=request.getParameterValues("inst");//接收复选框提交的参数
   %>
   <h3>编码:<%=id %></h3>
   <h3>姓名：<%=name %></h3>
   <%if(inst!=null)   //判断是否有内容
   {
    %>
    <h3>兴趣:
    <%
    for(int x=0;x<inst.length;x++)//循环输出全部的内容
    { %>
    <%=inst[x] %>  <!-- 适应表达式输出数组中的元素 -->
    <%} %>
    </h3>
    <%} %>
    
    &quot;=This is my JSP page. <br>
  </body>
</html>
