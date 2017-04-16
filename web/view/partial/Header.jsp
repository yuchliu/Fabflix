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
        <i class="fa fa-video-camera" aria-hidden="true"></i>
    </a>
    <ul class="nav navbar-nav">
        <li style="margin-right: 15px;border-right:1px solid #e7e7e7;"><a href="/Fabflix/LoginControl?logout=true">Log Out</a></li>
        <li><a href="/Fabflix/view/Browse.jsp">Browse</a></li>
        <li><a href="/Fabflix/view/Search.jsp">Search</a></li>
        <li><a href="/Fabflix/DatabaseControl">Databases</a></li>
    </ul>
</nav>