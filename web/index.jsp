<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Fabflix</title>
    <link rel="stylesheet" href="/Fabflix/sources/external/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/Fabflix/sources/external/fontawesome/css/font-awesome.css">
    <link rel="stylesheet" href="/Fabflix/sources/css/index.css">
  </head>

  <body>

    <div class="container">
      <div class="jumbotron"></div>
    </div>
    <%if ((request.getAttribute("error")!=null && (boolean) request.getAttribute("error"))){%>
      <div class="container col-xs-1 col-centered" style="width:425px;text-align: center;">
        <span class="error text-danger"><strong>Error:</strong> Invalid Email or Wrong Password</span>
      </div>
      <br />
    <%}%>
    <div class="login-form container col-xs-1 col-centered container-bordered" style="width:425px;">
      <div class="form-group">
        <h1 class="login-header">Fabflix Login</h1>
      </div>
      <br />
      <form action='/Fabflix/LoginControl' method='post'>
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
        <br />
        <div class="form-group">
          <button class="btn btn-primary btn-lg btn-block login-button" type='submit'>Submit</button>
        </div>
      </form>
    </div>

    <script src="/Fabflix/sources/external/jquery/jquery-3.2.1.js"></script>
    <script src="/Fabflix/sources/external/bootstrap/js/bootstrap.js"></script>

  </body>
</html>

