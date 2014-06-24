<%@ page language="java" import="java.util.*" import ="java.io.*" contentType="text/html" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'input_content.jsp' starting page</title>
    
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
  request.setCharacterEncoding("utf-8");//解决中文乱码
  String name=request.getParameter("filename");//接收保存的文件名称
  String content=request.getParameter("filecontent");//接收保存的文件内容
  String fileName=this.getServletContext().getRealPath("/")
  +"note"+File.separator+name; //拼凑文件名称
  File file=new File(fileName);//实例化File类对象
  if(!file.getParentFile().exists()){//判断父文件夹是否存在
  file.getParentFile().mkdir();//创建文件夹
  }
  PrintStream ps=null;//定义打印流对象
  ps=new PrintStream(new FileOutputStream(file));//准备向文件中保存
  ps.println(content);//输出内容
  ps.close(); //关闭输出流
  %>
  <% //读取出来
  Scanner scan=new Scanner(new FileInputStream(file));//使用Scanner读取文件
  scan.useDelimiter("\n");//设置读取分隔符
  StringBuffer buf=new StringBuffer();   //要将所有内容都读取进来
  while(scan.hasNext()){ //取出所有数据
  buf.append(scan.next()).append("<br>");
  }     //读取内容
  scan.close();   //关闭输入流
   %>
   <%=buf %>   <%--输出内容 --%>
    This is my JSP page. <br>
  </body>
</html>
