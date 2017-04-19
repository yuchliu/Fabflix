<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="<%=basePath%>">

<link rel="stylesheet" href="/sources/external/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/sources/external/fontawesome/css/font-awesome.css">
<link rel="stylesheet" href="/sources/css/site.css">

<nav class="navbar navbar-default">
    <a class="navbar-brand" href="/view/MainPage.jsp">
        <i class="fa fa-video-camera" aria-hidden="true"></i><span style="padding-left: 15px;">FabFlix</span>
    </a>
    <ul class="nav navbar-nav">
        <li><a href="/view/Browse.jsp">Browse</a></li>
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
</nav>