<%@ page import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Check Out</title>
    
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
    <h1 align="center">Check Out</h1><hr><br>
    <h2 align="center">Enter User Information</h2><input type ="button" value="Log Out" onclick="window.location.href='/Fabflix/LoginControl?logout=true'"/><br>
    <form action="/Fabflix/CheckoutControl" method="post">
    	<a style="font-family:verdana;font-size:25px;color:#EE9611">First Name</a><br>
    	<input type="text" name="firstName" value="" placeholder="first name"><br/>
    	<a style="font-family:verdana;font-size:25px;color:#EE9611">Last Name</a><br>
    	<input type="text" name="lastName" value="" placeholder="last name"><br/>
    	<a style="font-family:verdana;font-size:25px;color:#EE9611">Credit Card ID</a><br>
    	<input type="text" name="cc_id" value="" placeholder="Credit Card ID"><br/>
    	<a style="font-family:verdana;font-size:25px;color:#EE9611">Expire Date</a><br>
    	<input type="text" name="expiration" value="" placeholder="YYYY-MM-DD"><br/>
    	<input type="submit" value="Submit">   <input type="reset" value="Reset"><br/>
    </form>    
  </body>
</html>
