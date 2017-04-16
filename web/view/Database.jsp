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
    <link rel="stylesheet" type="text/css" href="/sources/external/datatables/datatables.css"/>
</head>
<body style="background-color: white;">
    <div class="container" style="width:80%; margin: auto;">
        <jsp:include page="/view/partial/Header.jsp" />
        <table id="database-table" class="table table-striped table-bordered dt-responsive" style="display: none;">
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
