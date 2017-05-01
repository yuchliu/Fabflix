<%@ page import="java.util.*" pageEncoding="ISO-8859-1"%>
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
    <title>Check Out</title>
</head>

<body>
<jsp:include page="/view/partial/Header.jsp" />
<div class="container">
    <h1 align="center" class="my-title">Check Out</h1><hr><br>

    <% if(request.getAttribute("error") != null) { %>
        <% if((Boolean) request.getAttribute("error")) { %>
            <div class="alert alert-danger">
                Error running SQL query.
            </div>
        <% } else { %>
            <div class="alert alert-danger">
                Not a valid credit card.
            </div>
        <% } %>
    <% } %>

    <form action="/CheckoutControl" method="post">

        <div class="form-group">
            <label>First Name:</label>
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" name="firstName" class="form-control" placeholder="...first name">
            </div>
        </div>

        <div class="form-group">
            <label>Last Name:</label>
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-users"></i></span>
                <input type="text" name="lastName" class="form-control" placeholder="...last name">
            </div>
        </div>

        <div class="form-group">
            <label>Credit Card:</label>
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                <input type="text" name="cc_id" class="form-control" placeholder="...credit card">
            </div>
        </div>

        <div class="form-group">
            <label>Expiration Date:</label>
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-birthday-cake"></i></span>
                <input type="text" name="expiration" class="form-control" placeholder="...expiration date">
            </div>
        </div>

        <br/>
        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i> Submit</button>
        <button class="btn btn-default" type="reset"><i class="fa fa-refresh"></i> Reset</button>

    </form>
    <jsp:include page="/view/partial/Scripts.jsp" />
</div>
</body>
</html>
