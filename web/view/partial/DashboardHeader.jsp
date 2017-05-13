<%@ page import="domain.Employee" pageEncoding="ISO-8859-1"%>

<%
    if (session.getAttribute("Employee")==null){
        request.setAttribute("error", true);
        request.setAttribute("errInfo","Please Login!");
        request.getRequestDispatcher("/fabflix/_dashboard").forward(request, response);
        return;
    }
%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    Employee employee = (Employee) request.getSession().getAttribute("Employee");
%>

<base href="<%=basePath%>">

<!-- Bootstrap Latest compiled and minified CSS -->
<link rel="stylesheet" href="/sources/external/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/sources/external/bootstrap/css/bootstrap-theme.css">
<link rel="stylesheet" href="/sources/external/fontawesome/css/font-awesome.css">
<link rel="stylesheet" href="/sources/css/site.css">
<link rel="stylesheet" href="/sources/css/header.css">

<nav class="navbar navbar-inverse">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/view/Dashboard.jsp">
            <i class="fa fa-video-camera" aria-hidden="true"></i><span style="padding-left: 15px;">FabFlix</span>
        </a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="/view/AddStar.jsp">Add Star</a></li>
        </ul>
        <ul class="nav navbar-nav">
            <li><a href="/view/AddMovie.jsp">Add Movie</a></li>
        </ul>
        <ul class="nav navbar-nav">
            <li><a href="/view/Dashboard.jsp">MetaData</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                    Databases <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="/DatabaseControl?dbName=creditcards">creditcards</a></li>
                    <li><a href="/DatabaseControl?dbName=customers">customers</a></li>
                    <li><a href="/DatabaseControl?dbName=genres">genres</a></li>
                    <li><a href="/DatabaseControl?dbName=genres_in_movies">genres_in_movies</a></li>
                    <li><a href="/DatabaseControl?dbName=sales">sales</a></li>
                    <li><a href="/DatabaseControl?dbName=stars">stars</a></li>
                    <li><a href="/DatabaseControl?dbName=stars_in_movies">stars_in_movies</a></li>
                    <li><a href="/DatabaseControl?dbName=carts">carts</a></li>
                    <li><a href="/DatabaseControl?dbName=employees">employees</a></li>
                </ul>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a><%=employee.getFullName()%></a></li>
            <li style="margin-right: 15px;"><a href="/DashboardLogin?logout=true">Log Out</a></li>
        </ul>
    </div>
</nav>

