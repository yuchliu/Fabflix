<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String valid = request.getParameter("valid");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Check Out Confirmation</title>
    
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
    <% if ("true".equals(valid)) {%>
    	<h1 align="center">Check Out Successfully!</h1>
    	<p align="center"><img src="http://www.freeiconspng.com/uploads/success-icon-10.png"></p> <%}%>
    <% if ("false".equals(valid)) {%>
    	<h1 align="center">Sorry, information incorrect!</h1>
    	<p align="center"><img src="http://wfarm1.dataknet.com/static/resources/icons/set39/e7f0a9e6.png"></p> <%}%>
  </body>
</html>
