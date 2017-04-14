<%@ page import="java.util.*,com.lyc.domain.Movie" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Movie movie = (Movie)request.getAttribute("movie");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Movie Information</title>
    
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
    <h1 align="center"><%=movie.getTitle()%></h1><br>
    <table>
    <tr><a href="/Fabflix/MovieControl?id=<%=movie.getId()%>"><%=movie.getTitle()%></a><%=" "+movie.getYear()%><br/>
    	Genres : <%for(String genre:movie.getGenre())out.println("<a href=\"/Fabflix/BrowseControl?genre="+genre+"\">"+genre+"\t</a>");%><br/>
    	Stars : <%for(String star:movie.getStars())out.println("<a href=\"/Fabflix/StarControl?star="+star+"\">"+star+"\t</a>");%><br/>
    	Director :<%=movie.getDirector()%><br/>
    	<img height=200 src=<%=movie.getBannerUrl()%> alt="Banner Url Expired!"><br/>
    	Movie ID :<%=movie.getId() %><br>
    	Trailer URL:<%=movie.getTrailerUrl()%><br>
    	<input type ="button" value="Add to Cart" onclick="window.location.href='/Fabflix/ShopControl?movie=<%=movie.getId()%>SPLITER<%=movie.getTitle()%>'"/>
    	</tr><hr/><br/>
    </table>
    <input type ="button" value="Log Out" onclick="window.location.href='/Fabflix/LoginControl?logout=true'"/>
  </body>
</html>
