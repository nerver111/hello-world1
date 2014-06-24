<%@ page pageEncoding="gb2312" %>
<%@ page contentType="text/html; charset=gb2312" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <% request.setCharacterEncoding("gb2312"); %>
  <%@ page language="java" %>
  </head>
  
  <body>
  <table align=center border=0 width=80% cellspacing=2 cellpadding=0 height
  =400>
  <tr align=center>
  <td width=100% colspan=4 height=15 bgcolor="#2299ff">&nbsp;
  <font color="#ffffff">新用户注册</font>
  </td>
  </tr>
  <form name="register" method="post“ action="jsp1/RegServlet">
  <tr>
  <td align=rihgt width=40%>登录名称：
  </td>
  <td colspan=2 width=70%>
  <input type="text" name="username" value=""/>
  <font size=2 color=red>*</font>
  </td>
  </tr>
  <tr>
  <td align=right>登录密码：</td>
  <td colspan=2>
  <input type="password" name="pwd" value=""/>
  <font size=2 color=red>*</font>
  </td>
  </tr>
  <tr>
  <td align=right>密码确认：</td>
  <td colspan=2>
  <input type="password" name="confpwd" value=""/>
  <font size=2 color=red>*</font>
  </td>
  </tr>
  <tr>
  <td align=right>电子邮件：</td>
  <td colspan=2>
  <input type="text" name="email" value=""/>
  <font size=2 color=red>*</font>
  </td>
  </tr>
  <tr>
  <td align=right>验证码：</td>
  <td colspan=2>
  <input type="text" name="random" value=""/>
  <image align=middle src="Random.jsp">
  <font size=2 color=red>*</font>
  </td>
  </tr>
  <tr>
  <td align=right>真实姓名：</td>
  <td colspan=2><input type="text" name="realname" value=""/></td>
  </tr>
  <tr>
  <td align=right>性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
  <td colspan=2><input type="radio" name="gender" value="1" checked/>男
  <input type="radio" name="gender" value="0"/>女
  </td>
  </tr>
  <tr>
  <td align=right>密码提示问题：</td>
  <td colspan="2"><input type="text" name="question" value=""/>
  </td>
  </tr>
  <tr>
  <td align=right>密码提示答案：</td>
  <td colspan=2><input type="text" name="answer" value=""/>
  </td>
  </tr>
  </image></td></tr>
  </form>
  </table>
    This is my JSP page. <br>
  </body>
</html>
