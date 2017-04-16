<%@ page import="java.util.*,service.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Browse Movie</title>
  </head>
  
  <body>
	<div class="container">
		<jsp:include page="/view/partial/Header.jsp" />
		<h1 align="center">Browse Movie</h1>
		<span color=#8A916F><a href="/BrowseControl?genre=all">Browse Movie By Title</a></span><br/><hr/>
		<span color=#8A916F><b>Movie Genre</b></span>
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
							<td align="left"> <a href="/BrowseControl?genre=<%=genre%>"><%=genre%></a></td>
						<%
						}
					 %>
				</tr>
				<%
				}
			 %>
		</table>
	</div>
	<jsp:include page="/view/partial/Scripts.jsp" />
  </body>
</html>
