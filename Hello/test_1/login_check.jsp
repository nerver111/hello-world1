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
  //�������ݿ���������
  public static final String dbdriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
  public static final String dburl="jdbc:sqlserver://localhost:1433;DatabaseName=mldn";
  public static final String dbuser="sa";   //���ݿ������û���
  public static final String dbpass="6w,10e.e96/753";%>  //���ݿ���������
  <%
  Connection conn=null;//�������ݿ����Ӷ���
  PreparedStatement pstmt=null; //�������ݿ����
  ResultSet rs=null;//�������ݿ�����
  boolean flag=false;//�����־λ
  String name=null;//�����û�����ʵ����
  %>
  <%//JDBC �������׳��쳣��ʹ��try...catch ����
  try
  {
  Class.forName(dbdriver);//������������
  conn=DriverManager.getConnection(dburl,dbuser,dbpass);//ȡ�����ݿ�����
  //��дҪʹ�õ�SQL��䣬��֤�û�ID�����룬�����ȷ����ȡ����ʵ����
   String sql="select name from user1 where userid=? and password=?";
   pstmt=conn.prepareStatement(sql);//ʵ�������ݿ��������
   pstmt.setString(1,request.getParameter("id"));
   //���ò�ѯ����Ҫ������
   pstmt.setString(2,request.getParameter("password"));//���ò�ѯ����Ҫ������
   rs=pstmt.executeQuery();//ִ�в�ѯ
   if(rs.next())//������Բ�ѯ�������ʾ�Ϸ��û�
   {
   name =rs.getString(1); //ȡ����ʵ����
   flag =true;//�޸ı�־λ�����δture,��ʾ��½�ɹ�
   }
   }
   catch(Exception e)
   {
   System.out.println(e);
   }
   finally
   {
   try{  //�رղ������׳��쳣
   rs.close();//�رղ�ѯ����
   pstmt.close();//�رղ�������
   conn.close();//�ر����ݿ�����
   }
   catch(Exception e)
   {
   }
   }
   %>
   <%
   if(flag)
   {//��½�ɹ�,��ת���ɹ�ҳ %>
   <jsp:forward page="login_success.jsp">
   <jsp:param name="uname" value="<%=name %>"/>
   </jsp:forward>  <!-- ִ����ת���� -->
   <%}else{   //��½ʧ�ܣ���ת��ʧ��ҳ %>
   <jsp:forward page="login_failure.html"/> <!-- ִ����ת���� -->
   <%} %>
    This is my JSP page. <br>
  </body>
</html>
