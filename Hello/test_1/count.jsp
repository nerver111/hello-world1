<%@ page language="java" import="java.util.*" import="java.io.*" import="java.math.*" contentType="text/html" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'count.jsp' starting page</title>
    
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
  //定义成全局变量
  BigInteger count=null;
   %>
   <%!//以下方法为了省事，直接在方法中出路异常，而实际中应该 交给调用处处理
   public BigInteger load(File file){  //读取计数文件
   BigInteger count=null;  //接收读取的数据
   try
   {
   if(file.exists()){   //如果文件存在，则读取
   Scanner scan=null;   //定义Scanner对象
   scan =new Scanner(new FileInputStream(file));//从文件中读取
   if(scan.hasNext()){  //存在内容
   count=new BigInteger(scan.next());//将内容放到BigInteger类中
   }
   scan.close();   //关闭输入流
   }else{          //文件不存在则创建新的
   count =new BigInteger("0");//第一次访问
   save(file,count);
   }
   }catch(Exception e)
   {
   e.printStackTrace();
   }return count;  //返回读取后的数据
   }
   public void save(File file,BigInteger count){//保存计数文件
   try
   {
   PrintStream ps=null;//定义输出流对象
   ps=new PrintStream(new FileOutputStream(file));//打印流对象
   ps.println(count);//保存数据
   ps.close();//关闭输出流
   }catch(Exception e)
   {
   e.printStackTrace();
   }
   }
     %>
     <%
     String fileName=this.getServletContext().getRealPath("/")+"count.txt";//文件路径
     File file=new File(fileName);  //定义File类对象
     if(session.isNew()){   //如果是新的session表示允许进行增加的操作
     synchronized(this){    //必须进行同步操作
     count=load(file);
     count=count.add(new BigInteger("1"));//自增操作
     save(file,count);//保存修改后的数据
     }
     }
      %>
      <h2>您是第<%=count==null?0:count %>位访客！</h2>  <%--输出内容 --%>
    This is my JSP page. <br>
  </body>
</html>
