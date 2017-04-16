<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="<%=basePath%>">

<link rel="stylesheet" href="/Fabflix/sources/external/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/Fabflix/sources/external/fontawesome/css/font-awesome.css">
<link rel="stylesheet" href="/Fabflix/sources/css/site.css">

<nav class="navbar navbar-default">
    <a class="navbar-brand" href="/Fabflix/BrowseControl">
        <i class="fa fa-video-camera" aria-hidden="true"></i><span style="padding-left: 15px;">FabFlix</span>
    </a>
    <ul class="nav navbar-nav">
        <li><a href="/Fabflix/view/Browse.jsp">Browse</a></li>
        <li><a href="/Fabflix/view/Search.jsp">Search</a>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                Databases <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><a href="/Fabflix/DatabaseControl?dbName=creditcards">creditcards</a></li>
                <li><a href="/Fabflix/DatabaseControl?dbName=customers">customers</a></li>
                <li><a href="/Fabflix/DatabaseControl?dbName=genres">genres</a></li>
                <li><a href="/Fabflix/DatabaseControl?dbName=genres_in_movies">genres_in_movies</a></li>
                <li><a href="/Fabflix/DatabaseControl?dbName=sales">sales</a></li>
                <li><a href="/Fabflix/DatabaseControl?dbName=stars">stars</a></li>
                <li><a href="/Fabflix/DatabaseControl?dbName=stars_in_movies">stars_in_movies</a></li>
            </ul>
        </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
        <li style="margin-right: 15px;"><a href="/Fabflix/LoginControl?logout=true">Log Out</a></li>
    </ul>
</nav>