<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  boolean error = (request.getAttribute("error")!=null && (boolean) request.getAttribute("error"));
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Fabflix</title>
    <link rel="stylesheet" href="/sources/external/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/sources/external/fontawesome/css/font-awesome.css">
    <link rel="stylesheet" href="/sources/css/site.css">
    <link rel="stylesheet" href="/sources/css/index.css">
    <%-- Google reCaptcha Script --%>
    <script src='https://www.google.com/recaptcha/api.js'></script>
  </head>

  <body>

    <div class="container">
      <div class="jumbotron"></div>
    </div>
    <% if ("true".equalsIgnoreCase(request.getParameter("logout"))) { %>
      <div class="col-xs-1 col-centered" style="width:425px;text-align: center;">
        <span class="error text-success">You have logged out successfully</span>
      </div>
      <br />
    <% } else if (error) {%>
      <div class="col-xs-1 col-centered" style="width:425px;text-align: center;">
        <span class="error text-danger"><strong>Error:</strong> <%out.println(request.getAttribute("errInfo"));%></span>
      </div>
      <br />
    <% } %>
    <div class="login-form container col-xs-1 col-centered container-bordered" style="width:425px;">
      <div class="form-group">
        <h1 class="login-header my-title">Fabflix Login</h1>
      </div>
      <br />
      <form action='/LoginControl' method='post'>
        <div class="form-group">
          <label for="email-field">Email Address:</label>
          <div class="input-group">
            <span class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i></span>
            <input name='email' id="email-field" type="email" class="form-control" />
          </div>
        </div>
        <div class="form-group">
          <label for="password-field">Password:</label>
          <div class="input-group">
            <span class="input-group-addon"><i class="fa fa-id-badge" aria-hidden="true"></i></span>
            <input name='password' id="password-field" type="password" class="form-control" />
          </div>
        </div>
        <div align="center" class="g-recaptcha" data-sitekey="6Le_PCAUAAAAAL4Sy2Hzq1r0XV_Uk68FhW46Abk1"></div>
        <br />
        <div class="form-group">
          <button class="btn btn-primary btn-lg btn-block login-button" type='submit'>Submit</button>
        </div>
      </form>
    </div>

    <script src="/sources/external/jquery/jquery-3.2.1.js"></script>
    <script src="/sources/external/bootstrap/js/bootstrap.js"></script>

  </body>
</html>

