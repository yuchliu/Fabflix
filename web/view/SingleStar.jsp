<%@ page language="java" import="java.util.*,domain.*" pageEncoding="ISO-8859-1"%>
<%
	if (session.getAttribute("User")==null){
		request.setAttribute("error", true);
		request.setAttribute("errInfo","Please Login!");
		request.getRequestDispatcher("/").forward(request, response);
		return;
	}
	Star star = (Star)request.getAttribute("star");
	LinkedList<Movie> result = (LinkedList<Movie>) request.getAttribute("result");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Star Information</title>
        <link rel="stylesheet" href="/sources/css/singlestar.css">
    </head>
  
    <body>
        <div class="container">
            <jsp:include page="/view/partial/Header.jsp" />
            <div class="row">
                <div class="row-items col-sm-6">
                    <img id="photo" alt="Photo Url Expired!" src="<%=star.getPhotoUrl()%>"/><br>
                </div>


                <div class="info-panel row-items col-sm-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title"><%=star.getName()%></h3>
                        </div>
                        <div class="panel-body">
                            <div class="col-sm-12 col-xs-12" role="group" aria-label="...">
                                <ul class="list-group col-lg-6 col-sm-12">
                                    <li class="list-group-item">Birthday :<%=star.getDob()%></li>
                                    <li class="list-group-item">Star ID :<%=star.getId()%></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="prod-panel col-lg-12">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title">Production</h3>
                        </div>
                        <div class="panel-body">
                            <%
                                int colCount = 0;
                                for(Movie movie:result){
                                    if (colCount == 0) {
                            %>
                                        <div class="row">
                            <%
                                    }
                            %>
                                            <div class="col-xs-6 col-md-2">
                                                <a href="/MovieControl?id=<%=movie.getId()%>" id = "poster" class="thumbnail">
                                                    <img src="<%=movie.getBannerUrl()%>" alt="<%=movie.getTitle()%>">
                                                    <div><%=movie.getTitle()%></div>
                                                </a>
                                            </div>

                            <%
                                    if (colCount == 5) {
                            %>
                                        </div>
                            <%
                                    }
                                    colCount = (colCount + 1) % 6;
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="/view/partial/Scripts.jsp" />
        </div>
    </body>
</html>
