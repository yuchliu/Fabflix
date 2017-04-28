<%@ page import="java.util.*,domain.Movie" pageEncoding="ISO-8859-1"%>
<%
    if (session.getAttribute("User")==null){
        request.setAttribute("error", true);
        request.setAttribute("errInfo","Please Login!");
        request.getRequestDispatcher("/").forward(request, response);
        return;
    }
    Movie movie = (Movie)request.getAttribute("movie");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Movie Information</title>
        <link rel="stylesheet" href="/sources/css/singlemovie.css">
    </head>

    <body>
        <div class="container">
            <jsp:include page="/view/partial/Header.jsp" />
            <div class="row">
                <div class="row-items col-sm-6">
                    <img id="mv-poster" alt="Banner Url Expired!" src="<%=movie.getBannerUrl()%>"/><br>
                </div>
                <div class="info-panel row-items col-sm-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title"><%=movie.getTitle()%></h3>
                        </div>
                        <div class="panel-body">
                            <div class="col-sm-12 col-xs-12" role="group" aria-label="...">
                                <ul class="list-group col-lg-12 col-sm-12">
                                    <li class="list-group-item">Genres : <%for(String genre:movie.getGenre())out.println("<a href=\"/BrowseControl?genre="+genre+"\"> "+genre+"\t</a>");%></li>
                                    <li class="list-group-item">Stars : <%for(String star:movie.getStars())out.println("<a href=\"/StarControl?star="+star+"\">"+star+"\t</a>");%></li>
                                    <li class="list-group-item">Director : <%=movie.getDirector()%></li>
                                    <li class="list-group-item">Movie ID : <%=movie.getId() %></li>
                                    <li class="list-group-item">
                                        <p>Trailer</p>
                                        <div class="embed-responsive embed-responsive-16by9">
                                            <iframe class="embed-responsive-item" src="<%= movie.getTrailerUrl().replace("watch?v=", "embed/") %>"></iframe>
                                        </div>
                                    </li>
                                    <button id = "add-cart" type="button" class="btn btn-default" onclick="window.location.href='/ShopControl?movie=<%=movie.getId()%>SPLITER<%=movie.getTitle()%>'">Add to Cart</button>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="/view/partial/Scripts.jsp" />
        </div>
    </body>
</html>
