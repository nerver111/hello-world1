<%@ page language="java" import="java.util.*" contentType="text/html"pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'application_scope_01.jsp' starting page</title>
    
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
  <%//����application ���Է�Χ�������Ա����ڷ�������
   application.setAttribute("name","���˻�");
   application.setAttribute("birthday",new Date());
   %>
   <!-- ͨ����������ת�󣬵�ַ���ı䣬���ڿͻ�����ת -->
   <a href="application_scope_02.jsp">ͨ��������ȡ������</a>
   
    This is my JSP page. <br>
  </body>
</html>
