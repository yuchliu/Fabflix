<%@ page import="java.util.*,service.*" pageEncoding="ISO-8859-1"%>
<%
	if (session.getAttribute("User")==null){
		request.setAttribute("error", true);
		request.setAttribute("errInfo","Please Login!");
		request.getRequestDispatcher("/").forward(request, response);
		return;
	}
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Browse Movie</title>
	  <link rel="stylesheet" href="/sources/css/browse.css">
  </head>
  
  <body>
	<div class="container">
		<jsp:include page="/view/partial/Header.jsp" />
		<h1 align="center">Browse Movie</h1>
		<span color=#8A916F><a href="/BrowseControl?genre=all">Browse Movie By Title</a></span><br/><hr/>
		<div class="col-lg-12">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Movie Genres</h3>
				</div>
				<div class="panel-body">
					<%LinkedList<String> genreSet = GenreService.getGenres();%>
					<%  for (int i = 0; i < genreSet.size(); i+=4) { %>

					<%  ArrayList<String> chunk = new ArrayList<>();
						for (int j = 0; j < 4 && i + j < genreSet.size(); j++) {
							chunk.add(genreSet.get(i + j));
						}
					%>

					<div class="row">
						<% for (String genre: chunk) { %>
						<div class="col-sm-3 list-group">
							<button type="button" class="list-group-item"><a href="/BrowseControl?genre=<%=genre%>"><%=genre%></a></button>
						</div>
						<% } %>
					</div>

					<% } %>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/view/partial/Scripts.jsp" />
  </body>
</html>
