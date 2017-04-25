<%@ page import="java.util.*,service.*" pageEncoding="ISO-8859-1"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="<%=basePath%>">

<link rel="stylesheet" href="/sources/external/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/sources/external/fontawesome/css/font-awesome.css">
<link rel="stylesheet" href="/sources/css/site.css">
<link rel="stylesheet" href="/sources/css/header.css">

<nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/view/MainPage.jsp">
            <i class="fa fa-video-camera" aria-hidden="true"></i><span style="padding-left: 15px;">FabFlix</span>
        </a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li class="dropdown">
                <a href="/view/Browse.jsp" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                    Browse <span class="caret"></span></a>
                <%
                    LinkedList<String> genreSet = GenreService.getGenres();
                %>
                <ul class="dropdown-menu multi-column columns-3">
                    <div class="col-sm-4">
                        <ul class="multi-column-dropdown">
                            <% for (int i = 0; i < genreSet.size(); i+=3) {
                                String genre = genreSet.get(i);
                            %>
                            <li><a href="/BrowseControl?genre=<%=genre%>"><%=genre%></a></li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                    <div class="col-sm-4">
                        <ul class="multi-column-dropdown">
                            <% for (int i = 1; i < genreSet.size(); i+=3) {
                                String genre = genreSet.get(i);
                            %>
                            <li><a href="/BrowseControl?genre=<%=genre%>"><%=genre%></a></li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                    <div class="col-sm-4">
                        <ul class="multi-column-dropdown">
                            <% for (int i = 2; i < genreSet.size(); i+=3) {
                                String genre = genreSet.get(i);
                            %>
                            <li><a href="/BrowseControl?genre=<%=genre%>"><%=genre%></a></li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                </ul>
            </li>
            <li><a href="/view/Search.jsp">Search</a>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                    Databases <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="/DatabaseControl?dbName=creditcards">creditcards</a></li>
                    <li><a href="/DatabaseControl?dbName=customers">customers</a></li>
                    <li><a href="/DatabaseControl?dbName=genres">genres</a></li>
                    <li><a href="/DatabaseControl?dbName=genres_in_movies">genres_in_movies</a></li>
                    <li><a href="DatabaseControl?dbName=sales">sales</a></li>
                    <li><a href="/DatabaseControl?dbName=stars">stars</a></li>
                    <li><a href="/DatabaseControl?dbName=stars_in_movies">stars_in_movies</a></li>
                </ul>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li style="margin-right: 15px;"><a href="/LoginControl?logout=true">Log Out</a></li>
        </ul>
    </div>
</nav>

