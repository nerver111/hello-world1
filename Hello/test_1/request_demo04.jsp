<%@ page language="java" import="java.util.*" contentType="text/html" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'request_demo04.jsp' starting page</title>
    
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
  request.setCharacterEncoding("utf-8"); 
   %>
   <center>
   <table border ="1">
   <tr>
   <td>参数名称</td>
   <td>参数内容</td>
   </tr>
   <% Enumeration enu=request.getParameterNames();//接收全部请求参数的名称
    while(enu.hasMoreElements())  //依次取出每一个参数名称
    {
       String paramName=(String)enu.nextElement();//取出内容%>
       <tr>
       <td><%=paramName %></td>
       <td>
       <%
       if(paramName.startsWith("**"))  //判断是否以“**”开头
       
       {
       String paramValue[] =request.getParameterValues(paramName);
       for(int x=0;x<paramValue.length;x++)//循环输出内容
       {
        %>
        <%=paramValue[x] %>
        <%}
        }
        else{
        String paramValue=request.getParameter(paramName);
         %>
         <%=paramValue %>
         <%} %>
         </td></tr>
         <%} %></table></center>
    This is my JSP page. <br>
  </body>
</html>
