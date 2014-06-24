<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<jsp:useBean id="orders" class="javaBean.Orders" scope="session"/>
<jsp:useBean id="db_orders" class="javaBean.DB_orders" scope="session"/>
<%@ include file="public.jsp" %>
<%
//获得传递过来的订单数据信息
String orderid=request.getParameter("orderid");
String date=(new java.util.Date()).toLocaleString();
//从session中获得用户id信息,用户名称信息
String userid=(String)request.getSession().getAttribute("userid");
String username=(String)request.getSession().getAttribute("username");
if ((userid==null)||(username==null))
    {
    out.println("非法用户！");
    return;
    }
    int id=Integer.parseInt(userid);
    String man=request.getParameter("contact");
    String addr=request.getParameter("address");
    String code=request.getParameter("postcode");
    String phone=request.getParameter("phone");
    String total=request.getParameter("sum");
    float sum=Float.parseFloat(total);
    String status=request.getParameter("status");
    orders.setAddress(addr);
    orders.setContactman(man);
    orders.setNote(phone);
    orders.setOrderdate(date);
    orders.setOrderid(orderid);
    orders.setOrdersum(sum);
    orders.setPostcode(code);
    orders.setStatus(status);
    orders.setUserid(id);
    orders.setUsername(username);
    //把用户的订单信息存入订单表中
    db_orders.store_orders(orders);
    %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'confirm.jsp' starting page</title>
    
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
  out.print("<h2><center>非常感谢您光临兵马俑网上商城！<h2><br><h4>为保证您所订购商品能够正确送达，"+"请确保以下信息的正确性，一旦点击提交，所有信息将无法修改</center></h4>");
  out.print("<table align=center bgcolor='#aaccff' width='80%'>");
  out.print("<tr><td align=center><h3>您的货物将按照下列信息发送--></h3></td></tr>");
  out.print("<tr><td align=left>"+"收货人  ："+getStr(man)+"</td></tr>");
  out.print("<tr><td align=left>"+"收货地址："+getStr(addr)+"</td></tr>");
  out.print("<tr><td align=left>"+"邮政编码："+getStr(code)+"</td></tr>");
  out.print("<tr><td align=left>"+"联系电话："+getStr(phone)+"</td></tr>");
  out.print("<tr><td align=right><a href=goods_list.jsp>返回购物主页</a></td></tr>");
  out.print("</table><table align=center>");
  out.print("<tr><td align=center><form action='jsp/goods_cart' method='post'>");
  out.print("<input type=hidden name=action value=confirm>"+"<input type=hidden name=man value="+getStr(man)+">");
  out.print("<input type=hidden name=addr value="+getStr(addr)+">"+"<input type=hidden name=code value="+getStr(code)+">");
  out.print("<input type=hidden name=orderid value="+orderid+">"+"<input type=hidden name=total value="+total+">");
  out.print("<input type=hidden name=phone value="+getStr(phone)+">"+"<input type=submit name=submit value=确认提交>");
out.print("</form></td></tr></table>");
%>
  </body>
</html>
