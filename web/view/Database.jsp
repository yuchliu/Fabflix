<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ResultSet resultSet = (ResultSet) request.getAttribute("resultSet");
    ResultSetMetaData metaData = resultSet.getMetaData();
    int numCol = metaData.getColumnCount();
%>
<html>
<head>
    <title>Databases</title>
    <link rel="stylesheet" type="text/css" href="/Fabflix/sources/external/datatables/datatables.css"/>
</head>
<body style="background-color: white;">
    <jsp:include page="/view/partial/Header.jsp" />
    <div class="container" style="width: 100%;">
        <div class="row">
            <div class="col-xs-2">
                <div class="list-group" style="padding-top: 10px;">
                    <a href="/Fabflix/DatabaseControl?dbName=creditcards" class="list-group-item">creditcards</a>
                    <a href="/Fabflix/DatabaseControl?dbName=customers" class="list-group-item">customers</a>
                    <a href="/Fabflix/DatabaseControl?dbName=genres" class="list-group-item">genres</a>
                    <a href="/Fabflix/DatabaseControl?dbName=genres_in_movies" class="list-group-item">genres_in_movies</a>
                    <a href="/Fabflix/DatabaseControl?dbName=sales" class="list-group-item">sales</a>
                    <a href="/Fabflix/DatabaseControl?dbName=stars" class="list-group-item">stars</a>
                    <a href="/Fabflix/DatabaseControl?dbName=stars_in_movies" class="list-group-item">stars_in_movies</a>
                </div>
            </div>
            <div class="col-xs-10">
                <div style="padding-right:50px;">
                    <table id="database-table" class="table table-striped table-bordered dt-responsive nowrap" style="display: none;">
                        <thead>
                            <tr>
                                <% for (int i = 1; i <= numCol; i++) { %>
                                    <th><% out.print(metaData.getColumnName(i)); %></th>
                                <% } %>
                            </tr>
                        </thead>
                        <tbody>
                            <% while (resultSet.next()) { %>
                                <tr>
                                    <% for (int i = 1; i <= numCol; i++) { %>
                                        <td><% out.print(resultSet.getString(i)); %></td>
                                    <% } %>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/view/partial/Scripts.jsp" />
    <script type="text/javascript" src="/Fabflix/sources/external/datatables/datatables.js"></script>
    <script>
        $(function() {
            $("#database-table").dataTable({
                pageLength: 15,
                initComplete: function(settings, json) {
                    $("#database-table_filter").addClass("pull-left;");
                    $("#database-table").show();
                }
            });
        })
    </script>
</body>
</html>
