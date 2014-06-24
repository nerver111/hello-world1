<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="servlet.goods_cartservlet"%>
<%@ page import="javaBean.Goods"%>
<%@ page import="java.io.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.Vector"%>
<%@ include file="public.jsp" %>
<%
//接收goods_list.jsp页面中隐藏域传递过来的值
String id=request.getParameter("goods_id");
String name=getStr((String)request.getParameter("goods_name"));
String price=(String)request.getParameter("goods_price");
String discount=(String)request.getParameter("goods_discount");
//String范围最大  然后转置各种类型
//把字符串类型数据转换为整数
int goods_id=Integer.parseInt(id);
//把字符串类型数据转换为浮点型
float goods_price=Double.valueOf(price).floatValue();
float goods_discount=Double.valueOf(discount).floatValue();
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'set_number.jsp' starting page</title>
    
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
  <table  align=center border=1 cellspacing=0>
  <tr bgcolor="#cccccc"><td align=center>商品名称</td><td align=center>商品价格</td>
  <td align=center>商品折扣率</td><td align=center>订购数量</td><tr>
  <%    
            out.print("<tr><td align=center>"+name+"</td>");
            out.print("<td align=center>"+goods_price+"</td>");
            out.print("<td align=center>"+goods_discount+"</td>");
            /*设置商品的数量，并把数据传到Servlet中予以处理，jsp/goods_cart为
            Servlet的URI映射，用户通过这个映射来访问Servlet*/
   
   out.print("<td><form action='jsp/goods_cart' method='post'>");
  out.print("<input type=text name='number' size=25 ></td></tr>");
   out.print("<input type=hidden name='goods_id'  value="+goods_id+">");
   out.print("<input type=hidden name='goods_name' value="+name+">");
   out.print("<input type=hidden name='action' value='add'>");
    out.print("</td></tr>");
    out.print("</table>");
    out.print("<table align=center border=0>");
    out.print("<tr><td align=center><input type=submit name=sm value='提交数据'><td>");
    out.print("<td align=center><input type=reset name=rs value='重新填写'></td></tr>");
    out.print("</form>");
    out.print("</table>");
    out.print("<table align=center width=420>");
//链接到goods_list.jsp页面，继续购物
out.print("<tr><td align=center><a href='goods_list.jsp'>继续购物</a>");
//链接到goods_show.jsp页面，查看购物车信息
out.print("&nbsp &nbsp <a href='goods_show.jsp'>查看购物车</a></td></tr>");
out.print("</table>");
%>
  </body>
</html>
