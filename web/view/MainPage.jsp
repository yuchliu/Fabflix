<%--
  Created by IntelliJ IDEA.
  User: Lyc
  Date: 2017/4/15
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="domain.User"%>

<%
    if (session.getAttribute("User")==null){
        request.setAttribute("error", true);
        request.setAttribute("errInfo","Please Login!");
        request.getRequestDispatcher("/").forward(request, response);
        return;
    }
    else
        System.out.println("User: "+session.getAttribute("User"));
    User user = (User) request.getSession().getAttribute("User");
    String email = user.getEmail();
%>

<html>
<head>
    <title>MainPage</title>
    <link rel="stylesheet" href="/sources/css/site.css" type="text/css">
    <link rel="stylesheet" href="/sources/css/mainpage.css" type="text/css">
</head>


<body>
    <div class="container">
        <jsp:include page="/view/partial/Header.jsp" />
        <header>
            <div class="container" id="banner" tabindex="-1">
                <div class="row">
                    <div class="col-lg-12">
                        <%--<img class="img-responsive" src="img/profile.png" alt="">--%>
                        <div class="intro-text">
                            <h1 class="name">Welcome!
                            </h1>
                            <hr class="star-light">
                            <span class="skills"><%=email%></span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <ul class="nav nav-pills nav-stacked">
                        <li role="presentation"><a href="/view/Search.jsp">Search Movie</a></li>
                        <li role="presentation"><a href="/view/Browse.jsp">Browse Movie</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <jsp:include page="/view/partial/Scripts.jsp" />
    </div>
</body>
</html>
