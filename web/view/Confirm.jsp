<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
    if (session.getAttribute("User")==null){
        request.setAttribute("error", true);
        request.setAttribute("errInfo","Please Login!");
        request.getRequestDispatcher("/").forward(request, response);
        return;
    }

    String trans = request.getParameter("trans");

%>

<!DOCTYPE html>
<html>
  <head>
    <title>Check Out Confirmation</title>
  </head>
  
  <body>
    <jsp:include page="/view/partial/Header.jsp" />
    <div class="container">
        <h1 align="center" class="my-title"><%out.println(trans);%> transactions made Successfully!</h1>
        <p align="center"><img src="/img/success-icon-10.png"></p>
    <jsp:include page="/view/partial/Scripts.jsp" />
    </div>
  </body>
</html>
