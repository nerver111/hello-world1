<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="servlet.goods_cartservlet"%>
<%@ page import="java.util.Vector"%>
<%@ page import="javaBean.Goods"%>
<%@ include file="public.jsp" %>
<jsp:useBean id="goods" class="javaBean.Goods" scope="session"/>
<% 			
                response.setContentType("text/html; charset=utf-8");
                //从vector对象中（购物车）取出商品并显示
				Vector vector=(Vector)session.getAttribute("vector");
				if(vector==null||vector.size()==0)
				{
				     out.print("<br><br>");
				     out.print("<center>");
				     out.print("<font size=4>购物车中没有商品可以显示！</font>");
				     out.print("<p>");
				     out.print("<a href='goods_list.jsp'>继续购物</a>");
				     out.print("</center>");
				     }
				     else
				{
				%>
		
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goods_show.jsp' starting page</title>
    
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
  		<center><font size=4>您的购物车中有以下商品:</font></center>
				<p>
				     <hr>
				     <p>
				     <table  width=85% height=10% align=center border=1 cellspacing=0>
				     <tr bgcolor='#cccccc'><td align=center>商品名称</td>
				     <td align=center>商品数量</td><td align=center>商品价格</td>
				     <td align=center>折扣率</td><td align=center>折扣价格</td>
				     <td align=center>商品描述</td>
				     <td align=center>是否推荐商品</td><td align=center>商品图片</td>
				     <td align=center>删除商品</td><td align=center>修改数量</td></tr>
				     <%
				     for(int i=0;i<vector.size();i++)
				     {
					    goods=(Goods)vector.elementAt(i);
				      %>
				      <tr><td align=center><font size=2><%out.print(goods.getGoods_name());%></font></td>
				      <td align=center><font size=2><%=goods.getGoods_number()%></font></td>
				       <td align=center><font size=2><%=goods.getGoods_price()%></font></td>
				        <td align=center><font size=2><%=goods.getGoods_discount()%></font></td>
				        <td align=center><font size=2><%out.print(goods.getGoods_price()*goods.getGoods_discount()/10);%></font></td>
				        <td align=center><font size=2><%out.print(goods.getGoods_desc());%></font></td>
				        <td align=center><font size=2><%=int2Str(goods.getIspreferred())%></font></td>
				        <td align=center><img src=<%out.print(goods.getGoods_pic());%>width=45 height=45></td>
				        <td><form name=Delete action="jsp/goods_cart"  method=post>
				        <input type=hidden name=action value=delete>
				        <input type=hidden name=delindex value=<%=i%>>
				        <input type=submit name=submit value=删除></form></td>
				        <td><form name=Modify action=jsp/goods_cart method=post>
				        <input type=text name=number size=2>
				        <input type=hidden name=modindex value=<%=i%>>
				        <input type=hidden name=action value=mod>
				        <input type=submit name=submit value=修改></form></td></tr>
                        <%
                        }
                         %>
                         <p><tr><td align=center colspan=5>
                         <form name=Remo action=jsp/goods_cart method=post>
                         <input type=hidden name=action value=remo>
                         <input type=submit name=submit value=清空购物车></form></td>
                         <td align=center colspan=4>
                         <form name=Check action=jsp/goods_cart method=post>
                         <input type=hidden name=action value=checkout>
                         <input type=hidden name=total value=0.0>
                         <input type=submit name=submit value=前台结帐></form></td>
                         <table align=center>
                         <tr><td align=center><a href='jsp/goods_list.jsp'>继续购物</a></td></tr>
                         </table>
<%				  
			}		    
%>
				        
				      

  </body>
</html>
