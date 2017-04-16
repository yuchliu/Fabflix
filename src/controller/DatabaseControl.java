package controller;

import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import doa.DBManager;

@WebServlet("/DatabaseControl")
public class DatabaseControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String dbName = request.getParameter("dbName");
        if(dbName == null || dbName.isEmpty()) {
            dbName = "customers";
        }

        String sql = "SELECT * FROM " + dbName + ";";
        ResultSet rs = DBManager.executeQuery(sql);

        request.setAttribute("resultSet", rs);
        request.getRequestDispatcher("/view/Database.jsp").forward(request, response);

    }
}