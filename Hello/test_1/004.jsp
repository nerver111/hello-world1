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
	int currentPage = 1 ;	// Ϊ��ǰ���ڵ�ҳ��Ĭ���ڵ�1ҳ
	int lineSize = 3 ;		// ÿ����ʾ�ļ�¼��
	int allRecorders = 0 ;	// ��ʾȫ���ļ�¼��
	String keyWord = request.getParameter("kw") ;	// ���ղ�ѯ�ؼ���
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
	if(rs.next()){	// ȡ��ȫ���ļ�¼��
		allRecorders = rs.getInt(1) ;
	}
%>
<center>
	<h1>��Ա�б�</h1>
	<jsp:include page="006.jsp">
	<jsp:param name="allRecorders" value="<%=allRecorders%>"/>
	<jsp:param name="url" value="<%=URL %>"/>
	</jsp:include>
	<TABLE BORDER="1" cellpadding="5" cellspacing="0" bgcolor="F2F2F2" width="100%">
	<TR onMouseOver="changeColor(this,'white')" onMouseOut="changeColor(this,'F2F2F2')">
	<td align="center" valign="middle"><span class="STYLE10">���</span></td>
		<td align="center" valign="middle"><span class="STYLE10">����</span></td>
		<td align="center" valign="middle"><span class="STYLE10">ְλ</span></td>
		<td align="center" valign="middle"><span class="STYLE10">��Ӷ����</span></td>
		<td align="center" valign="middle"><span class="STYLE10">����</span></td>
	</TR>