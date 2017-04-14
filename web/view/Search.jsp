<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Search Movie</title>
    
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
    <h1 align="center"> <font size=10>Search Movie</font> </h1><br/>
    <input type ="button" value="Log Out" onclick="window.location.href='/Fabflix/LoginControl?logout=true'"/>
    <hr/>
    <form action="/Fabflix/SearchControl" method="post">
        	<a style="font-family:verdana;font-size:30px;color:#EE9611">Title</a><br>
    	<input type="text" name="title" value=""><br/>
    	<a style="font-family:verdana;font-size:30px;color:#EE9611">Year</a><br>
    	<input type="text" name="year" value=""><br/>
    	<a style="font-family:verdana;font-size:30px;color:#EE9611">Director</a><br>
    	<input type="text" name="director" value=""><br/>
    	<a style="font-family:verdana;font-size:30px;color:#EE9611">Star</a><br/>
    	<input type="text" name="firstName" placeholder="first name" value=""><br/>
    	<input type="text" name="lastName" placeholder="last name" value=""><br/><br><br>
    	<input type="submit" value="Search">   <input type="reset" value="Reset"><br/>
    	<input type="hidden" name="page" value = "1"><br/>
    	<input type="hidden" name="pageSize" value = "5"><br/>
    	<input type="hidden" name="refresh" value = "yes"><br/>
    </form>
  </body>
</html>
