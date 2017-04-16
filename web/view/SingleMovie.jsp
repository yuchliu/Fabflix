<%@ page import="java.util.*,domain.Movie" pageEncoding="ISO-8859-1"%>
<%
Movie movie = (Movie)request.getAttribute("movie");
%>

<!DOCTYPE html>
<html>
  <head>
    <title>Movie Information</title>
  </head>
  
  <body>
      <div class="container">
        <jsp:include page="/view/partial/Header.jsp" />
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
        <jsp:include page="/view/partial/Scripts.jsp" />
      </div>
  </body>
</html>
