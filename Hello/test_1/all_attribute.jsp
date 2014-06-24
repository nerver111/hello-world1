<%@ page language="java" import="java.util.*" contentType="text/html"  pageEncoding="GBK"%>
<%@ page import="java.util.*" %> <%--Scanner 在java.util 包中定义 --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>我是110</title>
    <base href="<%=basePath%>">
    
    <title>My JSP 'all_attribute.jsp' starting page</title>
    
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
  <%//得到全部的属性名称
  Enumeration enu=this.getServletContext().getAttributeNames();
  while(enu.hasMoreElements())  //循环输出
  {
  String name=(String)enu.nextElement();  //得到属性名称
   %>
      <h4><%=name %> --> <%= this.getServletContext().getAttribute(name) %></h4>
      <%
      }
       %>
    This is my JSP page. <br>
  </body>
</html>
