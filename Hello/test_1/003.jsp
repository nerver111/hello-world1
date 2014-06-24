<%@ page language="java" import="java.util.Date" contentType="text/html"  pageEncoding="GBK"%>
<%@ page import="java.sql.*" %>
<html>
<head><title>www.mldnjava.cn，MLDN高端Java培训</title>
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
	public static final String URL = "003.jsp" ;
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
	int lineSize = 1 ;		// 每次显示的记录数
	int allRecorders = 0 ;	// 表示全部的记录数
	int pageSize = 2 ;		// 表示全部的页数（尾页）
	int lsData[] = {1,3,5,7,9,10,15,20,25,30,50,100} ;
%>
<%
	try{
		currentPage = Integer.parseInt(request.getParameter("cp")) ;
	} catch(Exception e) {}
	try{
		lineSize = Integer.parseInt(request.getParameter("ls")) ;
	} catch(Exception e) {}
%>
<%
	Class.forName(DBDRIVER) ;
	conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
	String sql = "SELECT COUNT(empno) FROM emp" ;//count计算有几组
	pstmt = conn.prepareStatement(sql) ;
	rs = pstmt.executeQuery() ;
	if(rs.next()){	// 取得全部的记录数
		allRecorders = rs.getInt(1) ;
	}
%>
<center> 
	<h1>雇员列表</h1>

<%
	pageSize = (allRecorders + lineSize -1) / lineSize ;
%>
<%
	sql = "SELECT empno,ename,job,hiredate,sal FROM emp ORDER BY empno" ;
	pstmt = conn.prepareStatement(sql) ;
	rs = pstmt.executeQuery() ;
%>
<form name="spform" action="003.jsp" method="post">
	<input type="button" value="首页" onclick="go(1)" <%=currentPage==1?"DISABLED":""%>>
	<input type="button" value="上一页" onclick="go(<%=currentPage-1%>)" <%=currentPage==1?"DISABLED":""%>>
	<input type="button" value="下一页" onclick="go(<%=currentPage+1%>)" <%=currentPage==pageSize?"DISABLED":""%>>
	<input type="button" value="尾页" onclick="go(<%=pageSize%>)" <%=currentPage==pageSize?"DISABLED":""%>>
	跳转到第<select name="selcp" onchange="go(this.value)">
		<%
			for(int x=1;x<=pageSize;x++){
		%>
				<option value="<%=x%>" <%=x==currentPage?"SELECTED":""%>><%=x%></option>
		<%
			}
		%>
	</select>页
	每页显示
		<select name="ls" onchange="go(1)">
		<%
			for(int x=0;x<lsData.length;x++){
		%>
			<option value="<%=lsData[x]%>" <%=lsData[x]==lineSize?"SELECTED":""%>><%=lsData[x]%></option>
		<%
			}
		%>
		</select>
	条
	<input type="hidden" name="cp" value="1">
	<script language="javascript">
	function go(num){
	document.getElementById("cp").value = num ;
	document.spform.submit() ;// 表单提交
	alert("ok");
	}
</script>
</form>
<TABLE BORDER="1" cellpadding="5" cellspacing="5" bgcolor="F2F2F2" width="100%">
	<TR onMouseOver="changeColor(this,'green')" onMouseOut="changeColor(this,'F2F2F2')">
		<td align="center" valign="middle"><span class="STYLE10">编号</span></td>
		<td align="center" valign="middle"><span class="STYLE10">姓名</span></td>
		<td align="center" valign="middle"><span class="STYLE10">职位</span></td>
		<td align="center" valign="middle"><span class="STYLE10">雇佣日期</span></td>
		<td align="center" valign="middle"><span class="STYLE10">工资</span></td>
	</TR>
<%
for(int x=0;x<(currentPage-1)*lineSize;x++){
	rs.next() ;   //rs.next();向后滚动
}
for(int x=0;x<lineSize;x++){
	if(rs.next()){
		int empno = rs.getInt(1) ;
		String ename = rs.getString(2) ;
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
}
%>
</table>
<%
	conn.close() ;
%>
</center>
</body>
</html>
