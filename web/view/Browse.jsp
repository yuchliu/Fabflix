<%@ page import="java.util.*,com.lyc.service.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Browse Movie</title>
    
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
  	<h1 align="center">Browse Movie</h1>
  	<input type ="button" value="Log Out" onclick="window.location.href='/Fabflix/LoginControl?logout=true'"/>
    <font color=#8A916F><a href="/Fabflix/BrowseControl?genre=all">Browse Movie By Title</a></font><br/><hr/>
    <font color=#8A916F><b>Movie Genre</b></font>
    <% LinkedList<String> genreSet = GenreService.getGenres(); %>
    <table>
    	<% int row = (genreSet.size()-1) /5 +1;
    		Iterator<String> iter = genreSet.iterator();
    	%>
    	<%
    		for (int i=0; i!=row; ++i){
    		%><tr>
    			<%
    				for (int j=0; j!=5; ++j){
    					String genre = null;
    					if (iter.hasNext()) genre = iter.next();
    					else break;
    				%>	
    					<td align="left"> <a href="/Fabflix/BrowseControl?genre=<%=genre%>"><%=genre%></a></td>
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
