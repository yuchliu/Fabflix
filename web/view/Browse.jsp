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
  	<jsp:include page="/view/partial/Header.jsp" />
	<div class="container">
		<h1 align="center" class="my-title">Browse Movie</h1>
		<div class="col-lg-12">
			<div class="panel panel-primary">
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
						<div class="col-lg-3 col-sm-6 list-group">
							<a href="/BrowseControl?genre=<%=genre%>">
								<button type="button" class="list-group-item"><%=genre%></button>
							</a>
						</div>
						<% } %>
					</div>
					<% } %>
				</div>
			</div>
		</div>
		<h3 align="center" class="my-title">Search by Titles</h3>
		<div id="browse-title" class="col-lg-12">
			<div class="row">
				<div class="browse-label btn-group" role="group" aria-label="...">
					<% for (char i = '0'; i <= '9'; i++) { %>
						<a href="/SearchControl?startby=<%=i%>" type="button" class="btn btn-default"><%=i%></a>
					<% }%>
				</div>
			</div>
			<div class="row">
				<div class="browse-label btn-group" role="group" aria-label="...">
					<% for (char i = 'A'; i <= 'Z'; i++) { %>
						<a href="/SearchControl?startby=<%=i%>" type="button" class="btn btn-default"><%=i%></a>
					<% }%>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/view/partial/Scripts.jsp" />
  </body>
</html>
