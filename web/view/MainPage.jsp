<%--
  Created by IntelliJ IDEA.
  User: Lyc
  Date: 2017/4/15
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="domain.User"%>
<%! private boolean firstVisit = true;

    private boolean TestAndSet (boolean c)
    {
    boolean temp = c;
    c = false;
    return temp;
    }
%>

<% User user = (User) request.getSession().getAttribute("User");
    String email = user.getEmail();%>
<html>
<head>
    <title>MainPage</title>
</head>
<body>
    <div class="container">
        <jsp:include page="/view/partial/Header.jsp" />
        <h1 align="CENTER">Welcome <% if (TestAndSet(firstVisit) )
                                         { %>, new user
            <% }else {%>back <%}%> !</h1>
        <h2 align="RIGHT"> <%out.println(email);%></h2>
        <form>
            <a href="/view/Search.jsp"> Search Movie </a><br/>
            <a href="/view/Browse.jsp"> Browse Movie </a><br/>
            <a href="/WEB-INF/Test.html"> Test </a><br/>
        </form>
        <jsp:include page="/view/partial/Scripts.jsp" />
    </div>
</body>
</html>
