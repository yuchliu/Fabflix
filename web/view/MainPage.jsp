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
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Comparator" %>

<%
    if (session.getAttribute("User")==null){
        request.setAttribute("error", true);
        request.setAttribute("errInfo","Please Login!");
        request.getRequestDispatcher("/").forward(request, response);
        return;
    }

    String sql = "SELECT * FROM sales INNER JOIN movies ON movie_id = movies.id;";
    ResultSet rs = DBManager.executeQuery(sql);

    final class ByValue implements Comparator<Map.Entry<String, Integer>> {
        @Override
        public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
            return (o2.getValue()).compareTo(o1.getValue());
        }
    }

//    ArrayList<Movie> popMovies = new ArrayList<>();
    HashMap<String, Integer> saleMovies = new HashMap<>();
    while(rs.next()) {
        String movieTitle = rs.getString("title");
        saleMovies.put(movieTitle, saleMovies.getOrDefault(movieTitle, 0) + 1);
    }
    DBManager.close();
    ArrayList<Map.Entry<String, Integer>> sortList = new ArrayList<>(saleMovies.entrySet());
    sortList.sort(new ByValue());
    ArrayList<Movie> popMovies = new ArrayList<>();
    int count = 0;
    for (Map.Entry<String, Integer> e: sortList){
        count++;
        String movieTitle = e.getKey();
        System.out.println("movie title = " + movieTitle);
        sql = "SELECT id, banner_url FROM movies WHERE title = \"" + movieTitle + "\";";
        rs = DBManager.executeQuery(sql);
        while (rs.next()) {
            Movie movie = new Movie();
            movie.setTitle(movieTitle);
            movie.setId(rs.getInt("id"));
            movie.setBannerUrl(rs.getString("banner_url"));
            popMovies.add(movie);
        }
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
                    <%
                        int colCount = 0;
                        for(Movie movie: popMovies){
                            if (colCount == 0) {
                    %>
                    <div class="row">
                        <%
                            }
                        %>
                        <div class="col-xs-6 col-md-4">
                            <a href="/MovieControl?id=<%=movie.getId()%>" id = "poster" class="thumbnail">
                                <img src="<%=movie.getBannerUrl()%>" alt="<%=movie.getTitle()%>">
                                <div><%=movie.getTitle()%></div>
                            </a>
                        </div>
                        <%
                            if (colCount == 2) {
                        %>
                    </div>
                    <%
                            }
                            colCount = (colCount + 1) % 3;
                        }
                    %>
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
