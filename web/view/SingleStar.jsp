<%@ page language="java" import="java.util.*,domain.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Star star = (Star)request.getAttribute("star");
LinkedList<Movie> result = (LinkedList<Movie>) request.getAttribute("result");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>SingleStar</title>
    
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
    <h1><%=star.getName()%></h1><br>
    <input type ="button" value="Log Out" onclick="window.location.href='/Fabflix/LoginControl?logout=true'"/>
    Birthday :<%=star.getDob()%><br>
    Star ID :<%=star.getId()%>><br>
    <img alt="Url Expired!" src="<%=star.getPhotoUrl()%>"/><br>
    <p>Production:</p><br>
    <table>
    	<% int row = (result.size()-1) /5 +1;
    		Iterator<Movie> iter = result.iterator();
    	%>
    	<%
    		for (int i=0; i!=row; ++i){
    		%><tr>
    			<%
    				for (int j=0; j!=5; ++j){
    					String movieName = null;
    					Movie movie = null;
    					if (iter.hasNext()) {
    						movie = iter.next();
    						movieName = movie.getTitle();
    						}
    					else break;
    				%>	
    					<td align="left"> <a href="/Fabflix/MovieControl?id=<%=movie.getId()%>"><%=movieName%></a></td>
    				<%
    				}
    			 %>
    		</tr>
    		<%
    		}
    	 %>
    </table>
  </body>
</html>
