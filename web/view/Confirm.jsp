<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.print.DocFlavor" %>
<%
    if (session.getAttribute("User")==null){
        request.setAttribute("error", true);
        request.setAttribute("errInfo","Please Login!");
        request.getRequestDispatcher("/").forward(request, response);
        return;
    }

    ArrayList<String[]> sales = (ArrayList<String[]>) request.getAttribute("sales");

%>

<!DOCTYPE html>
<html>
<head>
    <title>Check Out Confirmation</title>
</head>

<body>
<jsp:include page="/view/partial/Header.jsp" />
<div class="container">
    <h1 align="center" class="my-title">Transaction Info</h1> <br/>
    <div class="alert alert-success">
        Transaction processed successfully.
    </div>
    <table id="sales-table" class="table table-striped table-bordered dt-responsive" style="background-color: white; width: 100%;">
        <thead>
        <tr>
            <th>Title</th>
            <th>ID</th>
            <th>Quantity</th>
        </tr>
        </thead>
        <tbody>
        <% for (String[] sale : sales) { %>
            <tr>
                <td><%= sale[0] %></td>
                <td><%= sale[1] %></td>
                <td><%= sale[2] %></td>
            </tr>
        <% } %>
        <tbody>
    </table>
    <jsp:include page="/view/partial/Scripts.jsp" />
</div>
</body>

<script>
    $(function() {

        $("#sales-table").dataTable({
            dom: "t",
            pageLength: "500"
        });

    }
</script>

</html>
