<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
    if (session.getAttribute("User")==null){
        request.setAttribute("error", true);
        request.setAttribute("errInfo","Please Login!");
        request.getRequestDispatcher("/").forward(request, response);
        return;
    }
    LinkedHashMap<String,Integer> shopCart = (LinkedHashMap<String,Integer>) session.getAttribute("shopCart");
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
        <% if(shopCart!=null){
            for (String key : shopCart.keySet()) {%>
            <tr><td width=200><%=key.split("SPLITER")[1]%></td>
            <td width=200><%=key.split("SPLITER")[0]%></td>
            <td width=200><%=shopCart.get(key)%></td></tr>
        <%}}%>
        </table>
        <jsp:include page="/view/partial/Scripts.jsp" />
      </div>
  </body>
</html>
