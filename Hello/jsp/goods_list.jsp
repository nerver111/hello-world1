<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="javaBean.*"%>
<%@ page import="java.util.Vector"%>
<%@ include file="public.jsp" %>
<jsp:useBean id="goods" scope="page" class="javaBean.Goods"/>
<jsp:useBean id="db_conn"  class="javaBean.DB_Conn"  scope="session"/>
<jsp:useBean id="db_goods"  class="javaBean.DB_goods" scope="session"/>
<jsp:useBean id="db_type" class="javaBean.DB_type" scope="session"/>

 <%!int i=0,size=0;%>
    
    <h3><center>欢迎光临兵马俑网上商城</center></h3>
    <table bgcolor="#ffccff" align=center border=1 cellspacing=0 width=90%>
    <tr bgcolor="#cccccc"><td colspan=10 align=center>兵马俑网上商城商品一览</td></tr>
    <tr bgcolor="#cc99cc">
    <td align=center>商品名称</td><td align=center>商品类别</td><td align=center>商品价格</td>
    <td align=center>商品折扣率</td><td align=center>折扣价格</td>
    <td align=center>商品描述</td><td align=center>生产制造商</td>
    <td align=center>是否推荐商品</td><td align=center>商品图片</td><td align=center>我要购买</td>
    </tr>
    <%
         //vector中存储购物网站中所有商品的信息，即存储购物车信息
         Vector vector=new Vector();
         vector=db_goods.list_goods();
         size=vector.size();//返回Vector的长度
    %>
    
  
    <%
        //从Vector容器中取出商品信息并输出到浏览器中
         for(i=0;i<vector.size();i++)
         {
           goods=(Goods)vector.elementAt(i);
    %>
    <tr>
    <td align=center><font size=2>
    	<%out.print(goods.getGoods_name());%></font></td>
    <td align=center><font size=2>
    	<%out.print(db_type.getTypename(goods.getTypeid()));%></font></td>
    <td align=center><font size=2>
    	<%out.print(goods.getGoods_price());%></font></td>
    <td align=center><font size=2>
    	<%out.print(goods.getGoods_discount());%></font></td>
    <td align=center><font size=2>
    	<%out.print(goods.getGoods_price()*goods.getGoods_discount()/10);%></font></td>
    <td align=left><font size=2>
    	<%out.print(goods.getGoods_desc());%></font></td>
    <td align=center><font size=2>
    	<%out.print(goods.getSupplier());%></font></td>
    <td align=center><font size=2>
    	<%out.print(int2Str(goods.getIspreferred()));%></font></td>
    
    <td align=center>
    	<img src=<%out.print(goods.getGoods_pic());%>   width=20 height=20></td>
    
    <%//当单击购买按钮时，隐藏域中信息将被发送至set_number.jsp页面中%>
    <td><form action="set_number.jsp"  method="post">
    <input type="hidden" name=goods_id 
    	value=<%=goods.getGoods_id()%>>
    <input type="hidden" name=goods_name 
    	value=<%=goods.getGoods_name()%>>
    <input type="hidden" name=goods_price 
    	value=<%=goods.getGoods_price()%>>
    <input type="hidden" name=goods_discount 
    	value=<%=goods.getGoods_discount()%>>
    <input type="submit" name="buy"  value="购买">
    </form></td></tr>
    
    <%}%>
    </table>
 
   