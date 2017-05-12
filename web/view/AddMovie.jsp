<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Add Movie</title>
</head>
<body>
<jsp:include page="/view/partial/DashboardHeader.jsp" />
<div class="container">
    <h1 align="center" class="my-title">Add Movie</h1>
    <% if(request.getAttribute("message") != null) { %>
        <br />
        <div class="alert alert-warning">
            <%= request.getAttribute("message").toString() %>
        </div>
    <% } %>
    <br />
    <form action="/AddMovieControl" method="post">

        <div class="row">
            <div class="col-md-6">

                <div class="form-group">
                    <label>Title:</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" name="movieTitle" class="form-control" placeholder="...title">
                    </div>
                </div>

                <div class="form-group">
                    <label>Year:</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-birthday-cake"></i></span>
                        <input type="text" name="movieYear" class="form-control" placeholder="...year">
                    </div>
                </div>

                <div class="form-group">
                    <label>Director:</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-male"></i></span>
                        <input type="text" name="movieDirector" class="form-control" placeholder="...director">
                    </div>
                </div>

                <div class="form-group">
                    <label>Banner URL:</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-picture-o"></i></span>
                        <input type="text" name="movieBannerUrl" class="form-control" placeholder="...banner url">
                    </div>
                </div>

                <div class="form-group">
                    <label>Trailer URL:</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-play"></i></span>
                        <input type="text" name="movieTrailerUrl" class="form-control" placeholder="...trailer url">
                    </div>
                </div>

            </div>
            <div class="col-md-6">

                <div class="form-group">
                    <label>Genre:</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-eye"></i></span>
                        <input type="text" name="genreName" class="form-control" placeholder="...genre">
                    </div>
                </div>

                <div class="form-group">
                    <label>Star First Name:</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" name="starFirstName" class="form-control" placeholder="...first name">
                    </div>
                </div>

                <div class="form-group">
                    <label>Star Last Name:</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-users"></i></span>
                        <input type="text" name="starLastName" class="form-control" placeholder="...last name">
                    </div>
                </div>

                <div class="form-group">
                    <label>Date of Birth:</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-birthday-cake"></i></span>
                        <input type="text" name="starDob" class="form-control" placeholder="...date of birthday(YYYY-MM-DD)">
                    </div>
                </div>

                <div class="form-group">
                    <label>Photo URL:</label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-picture-o"></i></span>
                        <input type="text" name="starPhotoUrl" class="form-control" placeholder="...put photo url here">
                    </div>
                </div>

            </div>
        </div>

        <br />

        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i> Submit</button>
        <button class="btn btn-default" type="reset"><i class="fa fa-refresh"></i> Reset</button>

    </form>
    <jsp:include page="/view/partial/Scripts.jsp" />
</div>
</body>
</html>
