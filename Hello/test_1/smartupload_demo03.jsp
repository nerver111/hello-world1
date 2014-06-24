<%@ page language="java"  import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="demo.a.IPTimeStamp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'smartupload_demo03.jsp' starting page</title>
    
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
  <%request.setCharacterEncoding("utf-8"); %>
  <%
  SmartUpload smart=new SmartUpload();
  smart.initialize(pageContext);
  smart.upload();
  String name=smart.getRequest().getParameter("uname");
  IPTimeStamp its=new IPTimeStamp(request.getRemoteAddr());
  String ext=smart.getFiles().getFile(0).getFileExt();
  String fileName=its.getIPTimeRand()+"."+ext;
  smart.getFiles().getFile(0).saveAs(getServletContext().getRealPath("/")+"upload"
  +java.io.File.separator+fileName);%>
  <h2>姓名:<%=name %></h2>
  <imag src="./upload/<%=fileName %>"></imag>
    This is my JSP page. <br>
  </body>
</html>
