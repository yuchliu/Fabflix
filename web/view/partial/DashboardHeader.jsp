<%@ page import="domain.Employee" pageEncoding="ISO-8859-1"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    Employee employee = (Employee) request.getSession().getAttribute("Employee");
%>

<base href="<%=basePath%>">

<link rel="stylesheet" href="/sources/external/bootstrap/css/bootstrap.css">
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
        <a class="navbar-brand" href="/view/DashboardLogin.jsp">
            <i class="fa fa-video-camera" aria-hidden="true"></i><span style="padding-left: 15px;">FabFlix</span>
        </a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="/view/Search.jsp">Advanced Search</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a><%=employee.getFullName()%></a></li>
            <li style="margin-right: 15px;"><a href="/DashboardLogin?logout=true">Log Out</a></li>
        </ul>
    </div>
</nav>

