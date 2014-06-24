<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP '004.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
<!--
.STYLE6 {font-size: 12px}
.STYLE10 {font-size: 14px; font-weight: bold; }
-->
</style>
  </head>
  	<script language="javascript">
		function changeColor(obj,color){
			obj.bgColor = color ;
		}
	</script>
  
  <body>
  <%!
	public static final String URL = "004.jsp" ;
%>
<%!
	public static final String DBDRIVER="com.microsoft.sqlserver.jdbc.SQLServerDriver";
   public static final String DBURL="jdbc:sqlserver://localhost:1433;DatabaseName=ppf.1";
      public static final String DBUSER ="sa";
      public static final String DBPASSWORD="6w,10e.e96/753";
%>
<%
	Connection conn = null ;
	PreparedStatement pstmt = null ;
	ResultSet rs = null ;
%>
<%
	int currentPage = 1 ;	// 为当前所在的页，默认在第1页
	int lineSize = 3 ;		// 每次显示的记录数
	int allRecorders = 0 ;	// 表示全部的记录数
	String keyWord = request.getParameter("kw") ;	// 接收查询关键字
%>
<%
	try{
		currentPage = Integer.parseInt(request.getParameter("cp")) ;
	} catch(Exception e) {}
	try{
		lineSize = Integer.parseInt(request.getParameter("ls")) ;
	} catch(Exception e) {}
	if(keyWord == null){
	keyWord ="";
	}
%>
<%
	Class.forName(DBDRIVER) ;
	conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
    String sql="select count(empno) from emp where empno like ? or ename like ? or job like ? or sal like ?";
    pstmt =conn.prepareStatement(sql);
    pstmt.setString(1,"%"+keyWord+"%");
    pstmt.setString(2,"%"+keyWord+"%") ;
	pstmt.setString(3,"%"+keyWord+"%") ;
	pstmt.setString(4,"%"+keyWord+"%") ;
	pstmt.setString(5,"%"+keyWord+"%") ;
    rs = pstmt.executeQuery() ;
	if(rs.next()){	// 取得全部的记录数
		allRecorders = rs.getInt(1) ;
	}
%>
<center>
	<h1>雇员列表</h1>
	<jsp:include page="006.jsp">
	<jsp:param name="allRecorders" value="<%=allRecorders%>"/>
	<jsp:param name="url" value="<%=URL %>"/>
	</jsp:include>
	<TABLE BORDER="1" cellpadding="5" cellspacing="0" bgcolor="F2F2F2" width="100%">
	<TR onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
	<td align="center" valign="middle"><span class="STYLE10">编号</span></td>
		<td align="center" valign="middle"><span class="STYLE10">姓名</span></td>
		<td align="center" valign="middle"><span class="STYLE10">职位</span></td>
		<td align="center" valign="middle"><span class="STYLE10">雇佣日期</span></td>
		<td align="center" valign="middle"><span class="STYLE10">工资</span></td>
	</TR>