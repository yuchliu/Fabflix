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
		<div id="browse-title" class="col-lg-12">
			<%--<span color=#8A916F><a href="/BrowseControl?genre=all">Browse Movie By Title</a></span><br/>--%>
			<h2>Browse Movie By Title</h2>
				<a href="/SearchControl?startby=A">A</a>
			<div class="browse-label btn-group" role="group" aria-label="...">
				<% for (char i = '0'; i <= '9'; i++) { %>
					<a href="/SearchControl?startby=<%=i%>"><button type="button" class="btn btn-default"><%=i%></button></a>
				<% }%>
			</div>
			<div class="browse-label btn-group" role="group" aria-label="...">
				<% for (char i = 'A'; i <= 'Z'; i++) { %>
					<a href="/SearchControl?startby=<%=i%>"><button type="button" class="btn btn-default"><%=i%></button></a>
				<% }%>
			</div>
		</div>

	</div>
	<jsp:include page="/view/partial/Scripts.jsp" />
  </body>
</html>
