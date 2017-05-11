<%--
  Created by IntelliJ IDEA.
  User: cjk98
  Date: 5/9/2017
  Time: 2:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if (session.getAttribute("Employee")==null){
        request.setAttribute("error", true);
        request.setAttribute("errInfo","Please Login!");
        request.getRequestDispatcher("/fabflix/_dashboard").forward(request, response);
        return;
    }
%>

<html>
    <head>
        <title>Dashboard</title>
    </head>
    <body>
        <jsp:include page="/view/partial/DashboardHeader.jsp" />
        <div class="container">
            <h1 align="center" class="my-title">Adding Movie Star</h1>

            <% if(request.getAttribute("error") != null) { %>
                <% if((Boolean) request.getAttribute("error")) { %>
                    <div class="alert alert-danger">
                        Not a valid star information.
                    </div>
                <% } else { %>
                    <div class="alert alert-success">
                        Success: A new star inserted
                    </div>
                <% } %>
            <% } %>

            <form action="/DashboardControl" method="post">
                <div class="form-group">
                    <label>Star First Name:</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" name="firstName" class="form-control" placeholder="...first name">
                    </div>
                </div>

                <div class="form-group">
                    <label>Star Last Name:</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-users"></i></span>
                        <input type="text" name="lastName" class="form-control" placeholder="...last name">
                    </div>
                </div>

                <div class="form-group">
                    <label>Date of Birth:</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-birthday-cake"></i></span>
                        <input type="text" name="dob" class="form-control" placeholder="...date of birthday(YYYY-MM-DD)">
                    </div>
                </div>

                <div class="form-group">
                    <label>Photo URL:</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-play"></i></span>
                        <input type="text" name="photo_URL" class="form-control" placeholder="...put photo url here">
                    </div>
                </div>

                <br />

                <button class="btn btn-default" type="submit"><i class="fa fa-search"></i> Submit</button>
                <button class="btn btn-default" type="reset"><i class="fa fa-refresh"></i> Reset</button>

            </form>
            <jsp:include page="/view/partial/Scripts.jsp" />
        </div>
    </body>
</html>
