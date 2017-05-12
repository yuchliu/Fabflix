<%--
  Created by IntelliJ IDEA.
  User: cjk98
  Date: 5/9/2017
  Time: 2:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="domain.MetaData" %>
<%@ page import="java.util.Map" %>
<%@ page import="doa.DBManager" %>

<html>
    <head>
        <title>Dashboard</title>
    </head>
    <body>
        <jsp:include page="/view/partial/DashboardHeader.jsp" />
        <div class="container">
            <h1 align="center" class="my-title">MetaData</h1>
            <% MetaData metaData = DBManager.getMetaData();%>
            <div class="panel panel-primary">
                <div class="panel-heading">MetaData for moviedb database</div>
                <table class="table">
                    <tr>
                        <th>Table Name</th>
                        <th>Column</th>
                    </tr>
                <% for (Map.Entry<String, MetaData.Table> tableEntry: metaData.tableMap.entrySet()) { %>
                    <tr>
                        <th><% out.println(tableEntry.getValue().tableName); %></th>
                    <% for (Map.Entry<String, MetaData.Column> colEntry : tableEntry.getValue().colMap.entrySet()) { %>
                        <% String outString = colEntry.getValue().colName + ": " + colEntry.getValue().colType; %>
                        <td><% out.print(outString); %></td>
                    <% } %>
                    </tr>
                <% } %>
                </table>
            </div>

            <jsp:include page="/view/partial/Scripts.jsp" />
        </div>
    </body>
</html>
