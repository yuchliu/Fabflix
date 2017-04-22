<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<String> columns = (ArrayList<String>)request.getAttribute("columns");
    ArrayList<ArrayList<String>> rows = (ArrayList<ArrayList<String>>)request.getAttribute("rows");
%>
<html>
<head>
    <title>Databases</title>
    <link rel="stylesheet" type="text/css" href="/sources/external/datatables/datatables.css"/>
</head>
<body style="background-color: white;">
    <div class="container" style="width:80%; margin: auto;">
        <jsp:include page="/view/partial/Header.jsp" />
        <table id="database-table" class="table table-striped table-bordered dt-responsive" style="display: none;">
            <thead>
                <tr>
                    <% for (String column: columns) { %>
                        <th><%= column %></th>
                    <% } %>
                </tr>
            </thead>
            <tbody>

                <% for (ArrayList<String> row: rows) { %>

                    <tr>
                        <% for (String cell: row) { %>
                            <td><%= cell %></td>
                        <% } %>
                    </tr>

                <% } %>
        </table>
    </div>

    <jsp:include page="/view/partial/Scripts.jsp" />
    <script type="text/javascript" src="/sources/external/datatables/datatables.js"></script>
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
