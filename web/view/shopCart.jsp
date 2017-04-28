<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="domain.User" %>
<%@ page import="doa.DBManager" %>
<%@ page import="java.sql.ResultSet" %>
<%
    if (session.getAttribute("User")==null){
        request.setAttribute("error", true);
        request.setAttribute("errInfo","Please Login!");
        request.getRequestDispatcher("/").forward(request, response);
        return;
    }

    User user = (User) request.getSession().getAttribute("User");
    String sql = "SELECT * FROM carts INNER JOIN movies ON movie_id = movies.id WHERE customer_id = " + user.getId() + ";";
    ResultSet rs = DBManager.executeQuery(sql);

    ArrayList<ArrayList<String>> movies = new ArrayList<>();
    while(rs.next()) {
        ArrayList<String> movie = new ArrayList<String>();
        movie.add(rs.getString("title"));
        movie.add(rs.getString("movie_id"));
        movie.add(rs.getString("amount"));
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
      <div class="container">
        <jsp:include page="/view/partial/Header.jsp" />
        <h1 align="center">Shopping Cart</h1> <br/>
        <input type ="button" value="Clear Cart" onclick="window.location.href='/ShopControl?clear=true'"/>
        <input type ="button" value="Check Out" onclick="window.location.href='/view/CheckOut.jsp'"/>
        <hr/>
        <table align="center">
        <tr><td width=200>Title</td><td width=200>ID</td><td width=200>Number</td></tr>
        <% for (ArrayList<String> movie : movies) { %>
            <tr>
                <td><%= movie.get(0) %></td>
                <td><%= movie.get(1) %></td>
                <td><%= movie.get(2) %></td>
            </tr>
        <% } %>
        </table>
        <jsp:include page="/view/partial/Scripts.jsp" />
      </div>
  </body>
</html>