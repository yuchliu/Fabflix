<%@ page import="java.util.*,domain.*,controller.*" pageEncoding="ISO-8859-1"%>
<%

	if (session.getAttribute("User")==null){
		request.setAttribute("error", true);
		request.setAttribute("errInfo","Please Login!");
		request.getRequestDispatcher("/").forward(request, response);
		return;
	}

	Clauss clauss = (Clauss)request.getAttribute("clauss");
	int pageTotal = (int)request.getAttribute("pageTotal");
	int pageNum = (int)request.getAttribute("pageNum");
	int pageSize = (int)request.getAttribute("pageSize");
%>

<!DOCTYPE html>
<html>
<head>
	<title>Movie List</title>
</head>

<body>
<jsp:include page="/view/partial/Header.jsp" />
<div class="container">
	<div class="panel panel-primary">
		<jsp:include page="/view/partial/Scripts.jsp" />
		<div class="panel-heading">
			<div class="row">
				<div class="col-sm-12 col-md-6">
					<div id="parameters-form" class="form-inline" style="margin-left: 10px !important;">
						<div class="form-group">
							<button id="movie-id-sort" class="btn btn-default">
								Movie ID&nbsp;
								<i id="active-toggle-icon" class="glyphicon glyphicon-chevron-down"></i>
							</button>
						</div>
						<div class="form-group">
							<button id="movie-year-sort" class="btn btn-default">Year&nbsp;</button>
						</div>
						<div class="form-group">
							<button id="movie-title-sort" class="btn btn-default">Title&nbsp;</button>
						</div>
						<div class="input-group pull-right">
							<input id="page-size-field" type="number" min="1" class="form-control" value="<%= pageSize %>" style="max-width:75px;">
							<span class="input-group-btn">
								<button id="page-size-button" class="btn btn-secondary" type="button" style="color:black;background-color: white;border: 1px solid lightgray;">Apply</button>
							</span>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-md-6">
					<ul class="page-selector pagination pull-right" style="margin-right: 10px !important;"></ul>
				</div>
			</div>
		</div>
		<div class="panel-body">
			<div id="search-results">
				<jsp:include page="/view/partial/MovieList.jsp" />
			</div>
			<ul class="page-selector pagination pull-right" style="margin-right: 10px !important;"></ul>
		</div>
	</div>
</div>
</body>

<script>

    $(function() {

        var pageTotal = <%= pageTotal %>;
        var pageNum = <%= pageNum %>;
        var pageSize = <%= pageSize %>;
        var sortToggle = "asc", yearToggle, titleToggle;
        var params = {
            order: "<%= clauss.getOrder() %>",
			title: "<%= clauss.getTitle() %>",
			year: "<%= clauss.getYear() %>",
			director: "<%= clauss.getDirector() %>",
			firstName: "<%= clauss.getFirstName() %>",
			lastName: "<%= clauss.getLastName() %>",
			genre: "<%= clauss.getGenre() %>",
            startby: "<%= clauss.getStartBy() %>"
		};

        $(".page-selector").twbsPagination({
            visiblePages: 7,
            totalPages: pageTotal,
            onPageClick: function(ev, page) {
                refreshMovieList(page);
            }
        });

        function refreshMovieList(newPage) {

            pageNum = newPage;
			var data = $.extend({
                newPage: true,
                pageNum: newPage,
                pageSize: pageSize
            }, params);

            $.ajax({
                method: "GET",
                url: "/SearchControl",
                data: data,
                success: function(page) {
                    $("#search-results").html(page);
                    movieListCleanup();
				},
                error: function() {
                    $("#search-results").html("<span>Error loading data. Please refresh the page.</span>");
                }
            });

        }

        if (pageNum === 1) {
            $("#prev-button").hide();
            $("#next-button").show();
        } else if (pageNum === pageTotal) {
            $("#prev-button").show();
            $("#next-button").hide();
        } else {
            $("#prev-button").show();
            $("#next-button").show();
        }

        $(".backup-image").on("error", function() {
            $(this).attr("src", "http://simpleicon.com/wp-content/uploads/movie-1.png");
        });

		$("#movie-id-sort").on("click", function() {

		    sortToggle = (sortToggle == null || sortToggle == "desc") ? "asc" : "desc";
		    yearToggle = titleToggle = null;

		    $.extend(params, {
		        order: "movies.id",
                orderType: sortToggle
		    });

            $("#active-toggle-icon").removeClass()
                .addClass("glyphicon " + (sortToggle == "asc" ? "glyphicon-chevron-down" : "glyphicon-chevron-up"));

            $("#active-toggle-icon").detach().appendTo($("#movie-id-sort"));
            $(".page-selector").twbsPagination({ currentPage: 1 });
            refreshMovieList(1);

		});

        $("#movie-year-sort").on("click", function() {

            yearToggle = (yearToggle == null || yearToggle == "desc") ? "asc" : "desc";
            sortToggle = titleToggle = null;

            $.extend(params, {
                order: "movies.year",
                orderType: yearToggle
            });

            $("#active-toggle-icon").removeClass()
                .addClass("glyphicon " + (yearToggle == "asc" ? "glyphicon-chevron-down" : "glyphicon-chevron-up"));

            $("#active-toggle-icon").detach().appendTo($("#movie-year-sort"));
            $(".page-selector").twbsPagination({ currentPage: 1 });
            refreshMovieList(1);

        });

        $("#movie-title-sort").on("click", function() {

            titleToggle = (titleToggle == null || titleToggle == "desc") ? "asc" : "desc";
            yearToggle = sortToggle = null;

            $.extend(params, {
                order: "movies.title",
                orderType: titleToggle
            });

            $("#active-toggle-icon").removeClass()
                .addClass("glyphicon " + (titleToggle == "asc" ? "glyphicon-chevron-down" : "glyphicon-chevron-up"));

            $("#active-toggle-icon").detach().appendTo($("#movie-title-sort"));
            $(".page-selector").twbsPagination({ currentPage: 1 });
            refreshMovieList(1);

        });

        $("#page-size-button").on("click", function() {

            var size = $("#page-size-field").val();
            if(isNaN(size) || parseInt(size) < 1)
                size = 10;

            params.pageSize = size;
            window.location.href = "/SearchControl?" + $.param(params);

		});

    });

    function movieListCleanup() {

        $(".backup-image").on("error", function() {
            $(this).attr("src", "http://simpleicon.com/wp-content/uploads/movie-1.png");
        });


        $(".movie-list-item").popover({
			animation: false,
            html: 'true',
            trigger: 'manual',
            placement: "void",
            content: function(event, ui) {
                return $("#movie-" + $(this).data("id") + "-popup").html();
			}
        }).on("mouseenter", function () {
            var self = this;
            if (!$(self).is(":hover")) return;
            setTimeout(function() {
                $(self).popover("show");
                $(".popover").on("mouseleave", function () {
                    $(self).popover('hide');
                });
			});
        }).on("mouseleave", function () {
            var self = this;
            setTimeout(function () {
                if (!$(".popover:hover").length) {
                    $(self).popover("hide");
                }
            }, 250);
        });

	}

</script>

</html>
