<%@ page language="java" import="java.util.Date"contentType ="text/html" pageEncoding="GBK"%>
<%@page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'emp_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <style type="text/css">
.STYLE6 {font-size: 12px}
.STYLE10 {font-size: 14px; font-weight: bold; }
  </style>
  </head>
  <script language="javascript">
  function changeColor(obj,color)
  {
  obj.bgColor=color;
  }
  </script>
  <body>
  <%! 
     public static final String DBDRIVER="com.microsoft.sqlserver.jdbc.SQLServerDriver";
      public static final String DBURL="jdbc:sqlserver://localhost:1433;DatabaseName=ppf.1";
      public static final String DBUSER ="sa";
      public static final String DBPASSWORD="6w,10e.e96/753"; %>
   <%
   Connection conn=null;
   PreparedStatement pstmt=null;
   ResultSet rs=null;
    %>
    <%
    Class.forName(DBDRIVER) ;
	conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
	String sql = "SELECT empno,ename,job,hiredate,sal FROM emp ORDER BY empno" ;
	pstmt = conn.prepareStatement(sql) ;
	rs = pstmt.executeQuery() ;
     %>
     <center>
     <h1>雇员列表</h1>
     <table border="1" cellpadding="5" cellspacing="0" bgcolor="F2F2F2" width="100%">
     <tr onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
     <td align="center"  valign="middle"><span class="STYLE10">编号</span></td>
     <td align="center" valign="middle"><span class="STYLE10">姓名</span></td>
     <td align="center" valign="middle"><span class="STYLE10">职位</span></td>
     <td align="center" valign="middle"><span class="STYLE10">雇佣日期</span></td>
     <td align="center" valign="middle"><span class="STYLE10">工资</span></td>
     </TR>
     <%
     while(rs.next())
     {
     int empno=rs.getInt(1);
     String ename=rs.getString(2);
     String job = rs.getString(3) ;
     Date hiredate = rs.getDate(4) ;
     double sal = rs.getDouble(5) ;
      %>
      <TR onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
      <td align="center" valign="middle"><span class="STYLE6"><%=empno%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><%=ename%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><%=job%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><%=hiredate%></span></td>
		<td align="center" valign="middle"><span class="STYLE6"><%=sal%></span></td>
	</TR>
	<%
	}
	 %>
     </table>
     <%
     conn.close();
      %>
     </center>
   
    <br>This is my JSP page. <br>
  </body>
</html>
