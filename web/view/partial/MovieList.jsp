
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
    <%  for (int i = 0; i < result.size(); i+=4) { %>

        <%  ArrayList<Movie> chunk = new ArrayList<>();
            for (int j = 0; j < 4 && i + j < result.size(); j++) {
                chunk.add(result.get(i + j));
            }
        %>

        <div class="row">
            <% for (Movie movie: chunk) { %>
            <div class="movie-list-item col-sm-12 col-md-3" data-id="<%=movie.getId()%>">
                <div class="movie-list-item-wrapper">
                    <img class="backup-image" src="<%=movie.getBannerUrl()%>" style="display:block;margin:auto;height: 250px;max-width:200px;" />
                    <br/>
                    <p style="display:block;margin:auto;text-align: center;"><a href="/MovieControl?id=<%=movie.getId()%>"><%=movie.getTitle()%></a></p>
                    <span id="movie-<%=movie.getId()%>-popup" style="display: none;">
                    <p>Year: <%=" "+movie.getYear()%> </p>
                    <p>Genres: <%for(String genre:movie.getGenre())out.println("<a href=\"/BrowseControl?genre="+genre+"\">"+genre+"\t</a>");%></p>
                    <p>Stars: <%for(String star:movie.getStars())out.println("<a href=\"/StarControl?star="+star+"\">"+star+"\t</a>");%></p>
                    <p>Director: <%=movie.getDirector()%></p>
                    <p>Movie ID: <%=movie.getId()%></p>
                    <p>Trailer URL: <a href="<%=movie.getTrailerUrl()%>">Trailer</a></p>
                    <input class="btn btn-default"
                           type="button"
                           value="Add to Cart"
                           method="post"
                           onclick="window.location.href='/ShopControl?movie=<%=movie.getId()%>'"/>
                </span>
                </div>
            </div>
            <% } %>
        </div>

    <% } %>
</div>

<script>
    $(function() {



    });
</script>