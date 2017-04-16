<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String valid = request.getParameter("valid");
%>

<!DOCTYPE html>
<html>
  <head>
    <title>Check Out Confirmation</title>
  </head>
  
  <body>
      <div class="container">
        <jsp:include page="/view/partial/Header.jsp" />
        <% if ("true".equals(valid)) {%>
            <h1 align="center">Check Out Successfully!</h1>
            <p align="center"><img src="http://www.freeiconspng.com/uploads/success-icon-10.png"></p> <%}%>
        <% if ("false".equals(valid)) {%>
            <h1 align="center">Sorry, information incorrect!</h1>
            <p align="center"><img src="http://wfarm1.dataknet.com/static/resources/icons/set39/e7f0a9e6.png"></p> <%}%>
        <jsp:include page="/view/partial/Scripts.jsp" />
      </div>
  </body>
</html>
