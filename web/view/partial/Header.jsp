<%@ page import="java.util.*,service.*, domain.User" pageEncoding="ISO-8859-1"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    User user = (User) request.getSession().getAttribute("User");
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
                <a href="/view/Browse.jsp">
                    Browse <span class="caret"></span>
                </a>
                <%
                    LinkedList<String> genreSet = GenreService.getGenres();
                %>
                <ul id="browse-dropdown" class="dropdown-menu multi-column columns-3">
                    <%  for (int i = 0; i < genreSet.size(); i+=3) { %>

                            <%  ArrayList<String> chunk = new ArrayList<>();
                                for (int j = 0; j < 3 && i + j < genreSet.size(); j++) {
                                    chunk.add(genreSet.get(i + j));
                                }
                            %>

                            <div class="row">
                                <% for (String genre: chunk) { %>
                                    <div class="col-sm-4">
                                        <li><a href="/BrowseControl?genre=<%=genre%>"><%=genre%></a></li>
                                    </div>
                                <% } %>
                            </div>

                    <% } %>
                </ul>
            </li>
            <form class="navbar-form navbar-left" action="/SearchControl" method="post">
                <div class="form-group">
                    <input type="text" name="title" class="form-control" placeholder="...Titles">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <li><a href="/view/Search.jsp">Advanced Search</a></li>
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
                    <li><a href="/DatabaseControl?dbName=carts">carts</a></li>
                </ul>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/view/shopCart.jsp"><i class="fa fa-shopping-cart" aria-hidden="true" style="font-size:18px;padding-top:1px;"></i></a></li>
            <li><a><%=user.getFirstName()%> <%=user.getLastName()%></a></li>
            <li style="margin-right: 15px;"><a href="/LoginControl?logout=true">Log Out</a></li>
        </ul>
    </div>
</nav>

