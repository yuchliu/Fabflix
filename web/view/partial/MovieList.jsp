
<%@ page import="java.util.*,domain.*,controller.*" pageEncoding="ISO-8859-1"%>
<%
    LinkedList<Movie> result = (LinkedList<Movie>) request.getAttribute("result");
    int pageNum = (int)request.getAttribute("pageNum");
    int pageSize = (int)request.getAttribute("pageSize");
    Clauss clauss = (Clauss)request.getAttribute("clauss");
    session.setAttribute("clauss", clauss);
%>

<% if (result.size() == 0) out.println("<font size=100 align=\"center\">No Result!</font>"); %>
<div id="movie-list">
    <% int i = 0; %>
    <% for(Movie movie:result){ %>
        <% if (i == 0) { %>
            <div class="row">
        <% } %>
        <div class="movie-list-item col-sm-12 col-md-6">
            <div class="movie-list-item-wrapper row">
                <div class="col-xs-4">
                    <img class="backup-image pull-right" src="<%=movie.getBannerUrl()%>" style="height: 200px;max-width:150px;" />
                </div>
                <div class="col-xs-8">
                    <p><a href="/MovieControl?id=<%=movie.getId()%>"><%=movie.getTitle()%></a></p>
                    <p>Year: <%=" "+movie.getYear()%> </p>
                    <p>Genres: <%for(String genre:movie.getGenre())out.println("<a href=\"/BrowseControl?genre="+genre+"\">"+genre+"\t</a>");%></p>
                    <p>Stars: <%for(String star:movie.getStars())out.println("<a href=\"/StarControl?star="+star+"\">"+star+"\t</a>");%></p>
                    <p>Director: <%=movie.getDirector()%></p>
                    <p>Movie ID: <%=movie.getId() %></p>
                    <input class="btn btn-default"
                           type="button"
                           value="Add to Cart"
                           method="post"
                           onclick="window.location.href='/ShopControl?movie=<%=movie.getId()%>'"/>
                </div>
            </div>
        </div>
        <% if (i == 1) { %>
            </div>
        <% } %>
        <% i = (i + 1) % 2; %>
    <% } %>
    <% if (i == 1) { %>
        </div>
    <% } %>
</div>

<script>
    $(function() {
        $(".backup-image").on("error", function() {
            $(this).attr("src", "http://simpleicon.com/wp-content/uploads/movie-1.png");
        });
    });
</script>