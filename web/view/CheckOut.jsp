<%@ page import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Check Out</title>
  </head>
  
  <body>
      <div class="container">
        <jsp:include page="/view/partial/Header.jsp" />
        <h1 align="center">Check Out</h1><hr><br>
        <h2 align="center">Enter User Information</h2><<br>
        <form action="/Fabflix/CheckoutControl" method="post">
            <a style="font-family:verdana;font-size:25px;color:#EE9611">First Name</a><br>
            <input type="text" name="firstName" value="" placeholder="first name"><br/>
            <a style="font-family:verdana;font-size:25px;color:#EE9611">Last Name</a><br>
            <input type="text" name="lastName" value="" placeholder="last name"><br/>
            <a style="font-family:verdana;font-size:25px;color:#EE9611">Credit Card ID</a><br>
            <input type="text" name="cc_id" value="" placeholder="Credit Card ID"><br/>
            <a style="font-family:verdana;font-size:25px;color:#EE9611">Expire Date</a><br>
            <input type="text" name="expiration" value="" placeholder="YYYY-MM-DD"><br/>
            <input type="submit" value="Submit">   <input type="reset" value="Reset"><br/>
        </form>
        <jsp:include page="/view/partial/Scripts.jsp" />
      </div>
  </body>
</html>
