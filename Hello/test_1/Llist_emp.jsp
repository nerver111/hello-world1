<%@ page language="java" import="java.util.*"contentType ="text/html" pageEncoding="GBK"%>
<%@page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Llist_emp.jsp' starting page</title>
    
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
  <%! public static final String dbdriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
      public static final String dburl="jdbc:sqlserver://localhost:1433;DatabaseName=ppf.1";
      public static final String dbuser="sa";
      public static final String dbpass="6w,10e.e96/753"; %>
      <%
      Connection conn=null;
      PreparedStatement pstmt=null;
      ResultSet rs=null;
       %>
       <%
       try
       {
       Class.forName(dbdriver);
       conn=DriverManager.getConnection(dburl,dbuser,dbpass);
       String sql="select empno,ename,job,sal,hiredate from emp";
       pstmt =conn.prepareStatement(sql);
       rs =pstmt.executeQuery();
        %>
        <center>
        <table border="1" width="80%">
        <tr>
        <td>雇员编号</td>
        <td>雇员姓名</td>
        <td>雇员工作</td>
        <td>雇员工资</td>
        <td>雇员日期</td>
        </tr>
        <%
        while(rs.next())
        {
        String empno=rs.getString(1);
        String ename=rs.getString(2);
        String job=rs.getString(3);
        String sal=rs.getString(4);
        java.util.Date date=rs.getDate(5); %>
        <tr>
        <td><%=empno %></td>
        <td><%=ename %></td>
        <td><%=job %></td>
        <td><%=sal %></td>
        <td><%=date %></td>
        </tr>
        <%
        } %>
        </table>
        </center>
        <%
        }catch(Exception e )
        {
        System.out.println(e);
        }
        finally
        {
        rs.close();
        pstmt.close();
        conn.close();
        }%>
  </body>
</html>
