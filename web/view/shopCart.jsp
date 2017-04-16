<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
LinkedHashMap<String,Integer> shopCart = (LinkedHashMap<String,Integer>) session.getAttribute("shopCart");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Shopping Cart</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="background-color:PowderBlue;">
    <h1 align="center">Shopping Cart</h1> <br/>
    <input type ="button" value="Clear Cart" onclick="window.location.href='/ShopControl?clear=true'"/>
    <input type ="button" value="Check Out" onclick="window.location.href='/view/CheckOut.jsp'"/>
    <input type ="button" value="Log Out" onclick="window.location.href='/LoginControl?logout=true'"/>
    <hr/>
    <table align="center">
    <tr><td width=200>Title</td><td width=200>ID</td><td width=200>Number</td></tr>
    <% if(shopCart!=null){
    	for (String key : shopCart.keySet()) {%>
    	<tr><td width=200><%=key.split("SPLITER")[1]%></td>
    	<td width=200><%=key.split("SPLITER")[0]%></td>
    	<td width=200><%=shopCart.get(key)%></td></tr>
    <%}}%>
    </table>     
  </body>
</html>
