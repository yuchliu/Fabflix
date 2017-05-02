<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" %>
<%@ page import="domain.User" %>
<%@ page import="doa.DBManager" %>
<%@ page import="java.sql.ResultSet" %>
<%
    if (session.getAttribute("User") == null) {
        request.setAttribute("error", true);
        request.setAttribute("errInfo", "Please Login!");
        request.getRequestDispatcher("/").forward(request, response);
        return;
    }

    User user = (User) request.getSession().getAttribute("User");
    String sql = "SELECT * FROM carts INNER JOIN movies ON movie_id = movies.id WHERE customer_id = " + user.getId() + ";";
    ResultSet rs = DBManager.executeQuery(sql);

    ArrayList<ArrayList<String>> movies = new ArrayList<>();
    while (rs.next()) {
        ArrayList<String> movie = new ArrayList<String>();
        movie.add(rs.getString("title"));
        movie.add(rs.getString("movie_id"));
        movie.add(rs.getString("amount"));
        movie.add(rs.getString("cart_id"));
        movies.add(movie);
    }

    DBManager.close();

%>

<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
</head>

<body>
<jsp:include page="/view/partial/Header.jsp"/>
<div class="container">
    <h1 align="center" class="my-title">Shopping Cart</h1> <br/>
    <div class="pull-left" style="margin-bottom: 5px;">
        <input type="button" class="btn btn-default" value="Clear Cart" onclick="window.location.href='/ShopControl?clear=true'"/>
        <input type="button" class="btn btn-default" value="Check Out" onclick="window.location.href='/view/CheckOut.jsp'"
                <% if (movies.size() == 0) { %> disabled <% } %> />
    </div>
    <div class="pull-right">
        <input id="update-cart" type="button" class="btn btn-default" value="Update Cart">
    </div>
    <table id="sales-table" class="table table-striped table-bordered dt-responsive" style="background-color: white; width: 100%;">
        <thead>
            <tr>
                <th>Title</th>
                <th>ID</th>
                <th>Quantity</th>
                <th style="width:50px;"></th>
            </tr>
        </thead>
        <tbody>
        <% for (ArrayList<String> movie : movies) { %>
            <tr>
                <td><%= movie.get(0) %></td>
                <td><%= movie.get(1) %></td>
                <td class="quantity-field" data-id="<%= movie.get(3) %>" tabindex="1" contenteditable="true">
                    <%= movie.get(2) %>
                </td>
                <td class="text-center">
                    <button class="delete-button btn btn-default" data-id="<%= movie.get(3) %>">
                        <i class="fa fa-trash-o" aria-hidden="true" style="font-size:18px;"></i>
                    </button>
                </td>
            </tr>
        <% } %>
        <tbody>
    </table>
    <jsp:include page="/view/partial/Scripts.jsp"/>
</div>
</body>

<script>

    $(function() {

        $("#sales-table").dataTable({
            dom: "t",
            pageLength: "500"
        });

        $(".quantity-field").on('blur', function() {

            var $el = $(this);

            if(isNaN($el.text())) {
                alert("Please enter a number. Quantity was not updated.");
            } else {
                UpdateCart($el.data("id"), $el.text());
            }

        });

        $("tr").on("click", ".delete-button", function() {

            var $el = $(this);
            var $row = $($el.parent().parent());

            UpdateCart($el.data("id"), "0");

            $row.addClass("delete-target");
            $("#sales-table").DataTable().row(".delete-target").remove().draw();

        });

        function UpdateCart(id, amount) {
            $.post("/ShopControl", {update: "true", cart_id: id, amount: amount.trim()});
        }

    });

</script>

</html>