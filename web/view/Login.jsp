<%@ page import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Fabflix Login</title>
    
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
    <h1 align="CENTER">Fabflix Login</h1><br>
    <form action='/Fabflix/LoginControl' method = 'post'>
    UserEmail:<input type='text' name='email'/><br/>
    Password:<input type='password' name='password'/><br/>
    <input type='submit' value='Login'/><br/>
    <input type='reset' value='Reset'/><br/>
    <%if (request.getAttribute("error")!=null && (boolean) request.getAttribute("error")){%>
    	<font color=red>Invalid Email or Wrong Password</font><br/><%}%>
	</form>  
  </body>
</html>
