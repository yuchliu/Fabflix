<%--
  Created by IntelliJ IDEA.
  User: Lyc
  Date: 2017/4/15
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="doa.DBManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="domain.Movie" %>

<%
    if (session.getAttribute("User")==null){
        request.setAttribute("error", true);
        request.setAttribute("errInfo","Please Login!");
        request.getRequestDispatcher("/").forward(request, response);
        return;
    }

    String sql = "SELECT * FROM carts INNER JOIN movies ON movie_id = movies.id;";
    ResultSet rs = DBManager.executeQuery(sql);

    ArrayList<Movie> popMovies = new ArrayList<>();
    int count = 0;
    while(rs.next()) {
        count++;
        Movie movie = new Movie();
        movie.setTitle(rs.getString("title"));
        movie.setId(Integer.valueOf(rs.getString("movie_id")));
        movie.setBannerUrl(rs.getString("banner_url"));
        popMovies.add(movie);
        if (count == 6)
            break;
    }
    DBManager.close();
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
                        <img class="img-responsive" src="/img/F-white.png" alt="">
                        <div class="intro-text">
                            <h1 class="name">Welcome!
                            </h1>
                            <hr class="star-light">
                            <%--<span class="skills"><%=email%></span>--%>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="col-sm-8">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Popular Movies</h3>
                </div>
                <div class="panel-body">
                    <% for (Movie movie: popMovies) { %>
                        <div class="col-xs-6 col-md-4">
                            <a href="/MovieControl?id=<%=movie.getId()%>" id = "poster" class="thumbnail">
                                <img src="<%=movie.getBannerUrl()%>" alt="<%=movie.getTitle()%>">
                                <div><%=movie.getTitle()%></div>
                            </a>
                        </div>
                    <% }%>
                </div>
            </div>
        </div>

        <div class="col-sm-4">
            <div class="list-group">
                <span id="list-title" class="list-group-item active">People also like:</span>
                <a href="/view/Search.jsp" class="list-group-item">Search Movies</a>
                <a href="/view/Browse.jsp" class="list-group-item">Browse Movies</a>
            </div>
        </div>
        <jsp:include page="/view/partial/Scripts.jsp" />
    </div>
</body>
</html>
