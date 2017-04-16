<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Search Movie</title>
  </head>
  
  <body>
  	<jsp:include page="/view/partial/Header.jsp" />
    <h1 align="center"> <font size=10>Search Movie</font> </h1><br/>
    <hr/>
    <form action="/Fabflix/SearchControl" method="post">
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
    	<input type="hidden" name="page" value = "1"><br/>
    	<input type="hidden" name="pageSize" value = "5"><br/>
    	<input type="hidden" name="refresh" value = "yes"><br/>
    </form>
	<jsp:include page="/view/partial/Scripts.jsp" />
  </body>
</html>
