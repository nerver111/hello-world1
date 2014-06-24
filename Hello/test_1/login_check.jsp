<%@ page language="java" import="java.util.*"contentType="text/html" pageEncoding="GBK"%>
<%@ page import ="java.sql.*" %>
<%@page import="javax.sound.midi.SysexMessage"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login_check.jsp' starting page</title>
    
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
  <%!
  //定义数据库驱动程序
  public static final String dbdriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
  public static final String dburl="jdbc:sqlserver://localhost:1433;DatabaseName=mldn";
  public static final String dbuser="sa";   //数据库连接用户名
  public static final String dbpass="6w,10e.e96/753";%>  //数据库连接密码
  <%
  Connection conn=null;//声明数据库连接对象
  PreparedStatement pstmt=null; //声明数据库操作
  ResultSet rs=null;//声明数据库结果集
  boolean flag=false;//定义标志位
  String name=null;//接收用户的真实姓名
  %>
  <%//JDBC 操作会抛出异常，使用try...catch 处理
  try
  {
  Class.forName(dbdriver);//加载驱动程序
  conn=DriverManager.getConnection(dburl,dbuser,dbpass);//取得数据库连接
  //编写要使用的SQL语句，验证用户ID和密码，如果正确，则取出真实姓名
   String sql="select name from user1 where userid=? and password=?";
   pstmt=conn.prepareStatement(sql);//实例化数据库操作对象
   pstmt.setString(1,request.getParameter("id"));
   //设置查询所需要的内容
   pstmt.setString(2,request.getParameter("password"));//设置查询所需要的内容
   rs=pstmt.executeQuery();//执行查询
   if(rs.next())//如果可以查询到，则表示合法用户
   {
   name =rs.getString(1); //取出真实姓名
   flag =true;//修改标志位，如果未ture,表示登陆成功
   }
   }
   catch(Exception e)
   {
   System.out.println(e);
   }
   finally
   {
   try{  //关闭操作会抛出异常
   rs.close();//关闭查询对象
   pstmt.close();//关闭操作对象
   conn.close();//关闭数据库连接
   }
   catch(Exception e)
   {
   }
   }
   %>
   <%
   if(flag)
   {//登陆成功,跳转到成功页 %>
   <jsp:forward page="login_success.jsp">
   <jsp:param name="uname" value="<%=name %>"/>
   </jsp:forward>  <!-- 执行跳转操作 -->
   <%}else{   //登陆失败，跳转到失败页 %>
   <jsp:forward page="login_failure.html"/> <!-- 执行跳转操作 -->
   <%} %>
    This is my JSP page. <br>
  </body>
</html>
