<%
	if (session.getAttribute("User")==null){
		request.setAttribute("error", true);
		request.setAttribute("errInfo","Please Login!");
		request.getRequestDispatcher("/").forward(request, response);
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
	<title>Search Movie</title>
</head>

<body>
<div class="container">
	<jsp:include page="/view/partial/Header.jsp" />
	<h1 align="center">Movie Search</h1>
	<form action="/SearchControl" method="post">

		<div class="form-group">
			<label>First Name:</label>
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-user"></i></span>
				<input type="text" name="firstName" class="form-control" placeholder="...first name">
			</div>
		</div>

		<div class="form-group">
			<label>Last Name:</label>
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-users"></i></span>
				<input type="text" name="lastName" class="form-control" placeholder="...last name">
			</div>
		</div>

		<div class="form-group">
			<label>Title:</label>
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-play"></i></span>
				<input type="text" name="title" class="form-control" placeholder="...title">
			</div>
		</div>

		<div class="form-group">
			<label>Year:</label>
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
				<input type="text" name="year" class="form-control" placeholder="...year">
			</div>
		</div>

		<div class="form-group">
			<label>Director:</label>
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-video-camera"></i></span>
				<input type="text" name="director" class="form-control" placeholder="...director">
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
