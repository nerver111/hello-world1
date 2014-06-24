<%@ page language="java" import="java.util.*" contentType="text/html" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
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
  <form action ="login.jsp" method="post">
  用户名：<input type="text" name="uname"/>
  密&nbsp;&nbsp;码：<input type="password" name="upass"/>
  <input type="submit" value="登录"/>
  <input type="reset" value="重置"/>
  </form>
  <% //用户名:ppf密码是：123
  String name=request.getParameter("uname");//取得name的信息
  String password=request.getParameter("upass");//取得password的信息
  if(!(name==null||"".equals(name)||password==null||"".equals(password))){ //进行用户名和密码的验证
  if("ppf".equals(name)&&"123".equals(password)){
  response.setHeader("refresh","2;URL=welcome.jsp");//定时跳转
  session.setAttribute("userid",name);//将登录的用户名保存在session 中
  %>
  <h3>用户登录成功，两秒后跳转到欢迎页！</h3>
  <h3>如果没有跳转，请按<a href="welcome.jsp">这里</a></h3>
  <%
  }else{ //登录失败给出错误信息%>           
  <h3>错误的用户名或密码!</h3>
  <%
  }
  } %>
    This is my JSP page. <br>
  </body>
</html>
