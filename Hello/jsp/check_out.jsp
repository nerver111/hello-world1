<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.Vector"%>
<%@ page import="javaBean.Goods"%>
<%@ page import="javaBean.Orders_detail"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.*"%>
<jsp:useBean id="goods" class="javaBean.Goods" scope="session"/>
<jsp:useBean id="db_orders" class="javaBean.DB_orders" scope="session"/> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'check_out.jsp' starting page</title>
    
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
<center><h3>您的订单信息</h3></center>
<table align=center border=1 cellspacing=0><tr><td align=center>订单号</td>
<td align=center>订单行号</td><td align=center>商品编号</td>
<td align=center>商品名称</td>
<td align=center>折扣价格</td><td align=center>商品数量</td>
<td align=center>小计</td></tr>
<%!double total=0,sum=0;%>
<%!

//订单的编号规律为yyyymmddxxxx，例如200606060006。yyyymmdd为年月日，0001为当日的流水号
//comb_str函数把yyyy-mm-dd这种格式表示日期中的’-’过滤掉，以产生订单的前8位。
public String comb_str(String str)
{
    int i=0;
    String new_str="";
    String str_1="";
        while( str.charAt(i)!='-')
        {
          new_str+=str.charAt(i);
          i++;
        }
        i++;
         while( str.charAt(i)!='-')
        {
          str_1+=str.charAt(i);
          i++;
        }
        i++;
        if(str_1.length()==1)
        {
          new_str=new_str+'0'+str_1;
        }
        else
        {
        new_str=new_str+str_1;
        }
        str_1="";
        while( str.charAt(i)!=' ')
        {
          str_1+=str.charAt(i);
          i++;
        }
       
        if(str_1.length()==1)
        {
          new_str=new_str+'0'+str_1;
        }
        else
        {
        new_str=new_str+str_1;
        }
        
        return new_str;
        
}
        %>
<%
Vector vector=(Vector)session.getAttribute("vector");
Vector orderGoods=new Vector();
int i,num;
String order_id="",orderid="";
//获取当前日期的字符串形式，并把其中的’-’符号过滤掉
order_id=comb_str((new java.util.Date()).toLocaleString());
orderid=db_orders.get_orderid(order_id);
total=0;sum=0;
for(i=0;i<vector.size();i++)
{   
goods=(Goods)vector.elementAt(i);
  Orders_detail orders_detail=new Orders_detail();
    num=i+1;
    out.print("<tr><td align=center>"+orderid+"</td>");
    out.print("<td align=center>"+(i+1)+"</td>");
    out.print("<td align=center>"+goods.getGoods_id()+"</td>");
    out.print("<td align=center>"+goods.getGoods_name()+"</td>");
    out.print("<td align=center>"+goods.getGoods_price()*goods.getGoods_discount()/10+"</td>");
    out.print("<td align=center>"+goods.getGoods_number()+"</td>");
    out.print("<td align=center>"+goods.getGoods_amount()+"</td></tr>");
    total=total+goods.getGoods_amount();
    orders_detail.setGoods_id(goods.getGoods_id());
    orders_detail.setGoods_price(goods.getGoods_price());
    orders_detail.setOrderid(orderid);
    orders_detail.setQty(goods.getGoods_number());
    orders_detail.setRnum(num);
    orders_detail.setGoods_name(goods.getGoods_name());
    orderGoods.addElement(orders_detail);
    }
    session.setAttribute("orderGoods",orderGoods);
    out.print("<tr><td align=center colspan=6>总计："+total+"</td></tr>");
    sum=total;
    out.print("</table>");
    out.print("<p>");
    out.print("<center>");
    out.print("<a href='jsp/goods_list.jsp'>继续购物</a>&nbsp");
    out.print("<a href='jsp/goods_show.jsp'>查看购物车</a>");
out.print("</center>");
%>
<hr>
<%
//在第15章假定用户登录时userid为1，username为tsinghua888
session.setAttribute("userid","1");
session.setAttribute("username","tsinghua888");
out.print("<br><br>");
out.print("<center>***为保证您及时收到所购商品，请务必填写以下信息***</center>");
out.print("<br><br>");
out.print("<table align=center border=1 cellspacing=0>");
out.print("<form name=form1 action='jsp/confirm.jsp' method='post'>");
out.print("<tr bgcolor='#cccccc'><td>收货人  ：</td>");
out.print("<td><input type=text name=contact size=60 maxlength=30></td></tr>");
out.print("<tr bgcolor='#ccffcc'><td>收货地址：</td>");
out.print("<td><input type=text name=address size=60 maxlength=100></td></tr>");
out.print("<tr bgcolor='#cccccc'><td>邮政编码：</td>");
out.print("<td><input type=text name=postcode size=60 maxlength=6></td></tr>");
out.print("<tr><td bgcolor='#ccffcc'>联系电话：</td>");
out.print("<td><input type=text name=phone size=60 maxlength=11></td></tr>");
out.print("<input type=hidden name=sum value="+sum+">");
//订单状态设为unover，表示用户还可以取消订单或修改订单信息
out.print("<input type=hidden name=status value=unover>");
out.print("<input type=hidden name=orderid value="+orderid+">");
out.print("<tr><td colspan=2 align=center><input type=submit name=submit value=确认>");
out.print("</td></tr>");
out.print("</form></table>");
%>
</body>
</html>
