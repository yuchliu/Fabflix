<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<%
	if (session.getAttribute("User")==null){
		request.setAttribute("error", true);
		request.setAttribute("errInfo","Please Login!");
		request.getRequestDispatcher("/").forward(request, response);
		return;
	}
%>
<html>
  <head>
    <title>Search Movie</title>
  </head>
  
  <body>
	  <div class="container">
		<jsp:include page="/view/partial/Header.jsp" />
		<h1 align="center"> <font size=10>Search Movie</font> </h1><br/>
		<hr/>
		<form action="/SearchControl" method="post">
				<a style="font-family:verdana;font-size:30px;color:#EE9611">Title</a><br>
			<input type="text" name="title" value=""><br/>
			<a style="font-family:verdana;font-size:30px;color:#EE9611">Year</a><br>
			<input type="text" name="year" value=""><br/>
			<a style="font-family:verdana;font-size:30px;color:#EE9611">Director</a><br>
			<input type="text" name="director" value=""><br/>
			<a style="font-family:verdana;font-size:30px;color:#EE9611">Star</a><br/>
			<input type="text" name="firstName" placeholder="first name" value=""><br/>
			<input type="text" name="lastName" placeholder="last name" value=""><br/><br><br>
			<input type="submit" value="Search">   <input type="reset" value="Reset"><br/>
		</form>
		<jsp:include page="/view/partial/Scripts.jsp" />
	  </div>
  </body>
</html>
