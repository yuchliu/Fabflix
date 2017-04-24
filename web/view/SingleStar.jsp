<%@ page language="java" import="java.util.*,domain.*" pageEncoding="ISO-8859-1"%>
<%
	if (session.getAttribute("User")==null){
		request.setAttribute("error", true);
		request.setAttribute("errInfo","Please Login!");
		request.getRequestDispatcher("/").forward(request, response);
		return;
	}
	Star star = (Star)request.getAttribute("star");
	LinkedList<Movie> result = (LinkedList<Movie>) request.getAttribute("result");
%>

<!DOCTYPE html>
<html>
  <head>
    <title>SingleStar</title>
  </head>
  
  <body>
	  <div class="container">
		<jsp:include page="/view/partial/Header.jsp" />
		<h1><%=star.getName()%></h1><br>
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
							<td align="left"> <a href="/MovieControl?id=<%=movie.getId()%>"><%=movieName%></a></td>
						<%
						}
					 %>
				</tr>
				<%
				}
			 %>
		</table>
		<jsp:include page="/view/partial/Scripts.jsp" />
	  </div>
  </body>
</html>
