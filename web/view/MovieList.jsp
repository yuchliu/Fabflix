<%@ page import="java.util.*,domain.*,controller.*" pageEncoding="ISO-8859-1"%>
<%
LinkedList<Movie> result = (LinkedList<Movie>) request.getAttribute("result");
int p = Integer.parseInt(request.getParameter("page"));
int pageNum = (int)request.getAttribute("pageNum");
int pageSize = (int)request.getAttribute("pageSize");
Clauss clauss = (Clauss)request.getAttribute("clauss");
session.setAttribute("clauss", clauss);
%>

<!DOCTYPE html>
<html>
  <head>
    <title>Movie List</title>
  </head>
  
  <body>
	  <div class="container">
		<jsp:include page="/view/partial/Header.jsp" />
		<h1 align="center">Movie List</h1> <br/>
		<form action="/SearchControl?reorder=yes" method="post">
			<table><tr><td width=100>Order By</td>
			<td width=100><select name="order">
				<option value="movies.id">Movie ID</option>
				<option value="movies.year">Year</option>
				<option value="movies.title">Title</option>
			</select></td>
			<td width=100><select name="orderType">
				<option value=" asc">Ascending</option>
				<option value=" desc">Descending</option>
			</select></td>
			<td width=150><input type='submit' value='Go'/></td>
			</tr>
			</table>
		</form>
		<hr/>
		<% if (result.size() == 0) out.println("<font size=100 align=\"center\">No Result!</font>"); %>
		<table>
			<% for(Movie movie:result){
					%><tr>
					<a href="/MovieControl?id=<%=movie.getId()%>"><%=movie.getTitle()%></a><%=" "+movie.getYear()%><br/>
					Genres : <%for(String genre:movie.getGenre())out.println("<a href=\"/BrowseControl?genre="+genre+"\">"+genre+"\t</a>");%><br/>
					Stars : <%for(String star:movie.getStars())out.println("<a href=\"/StarControl?star="+star+"\">"+star+"\t</a>");%><br/>
					Director :<%=movie.getDirector()%><br/>
					<img height=200 src=<%=movie.getBannerUrl()%> alt=http://simpleicon.com/wp-content/uploads/movie-1.png><br/>
					Movie ID :<%=movie.getId() %>
					<input type ="button" value="Add to Cart" onclick="window.location.href='/ShopControl?movie=<%=movie.getId()%>SPLITER<%=movie.getTitle()%>'"/>
					</tr><hr/><br/>
			<% } %>
		</table>
		<table align="center">
			<tr>
			<td><% if(p!=1){ %>
			<a href="/SearchControl?pageSize=<%=pageSize%>&page=<%=p-1%>">Prev</a></td> <%}%>
			<% for( int i=1; i!=pageNum+1; ++i )
				out.println("<td>"+(i==p?i:
				"<a href=/SearchControl?pageSize="+pageSize+"&page="+i+">"+i+"</a>")
				+"</td>");
			%>
			<% if(p!=pageNum){ %>
			<td><a href="/SearchControl?pageSize=<%=pageSize%>&page=<%=p+1%>">Next</a></td> <%}%>
			</tr>
		</table>
		<jsp:include page="/view/partial/Scripts.jsp" />
	  </div>
  </body>
 </html>
