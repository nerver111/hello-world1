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
  <%//��request���Է�Χ��ȡ�����ԣ���ִ������ת�Ͳ���
  String username=(String)request.getAttribute("name");
  Date userbirthday=(Date)request.getAttribute("birthday");
   %>
   <h2>������<%=username %></h2>  <!-- ���ȡ�õ��������� -->
   <h2>����:<%=userbirthday %></h2><!-- ���ȡ�õ��������� -->
    This is my JSP page. <br>
  </body>
</html>
