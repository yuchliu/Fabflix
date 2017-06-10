package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
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
        DBManager db = new DBManager();
        ResultSet rs = db.executeQuery(sql);

        try {

            ResultSetMetaData metaData = rs.getMetaData();
            int numCol = metaData.getColumnCount();
            ArrayList<String> columns = new ArrayList<>();
            for(int i = 1; i <= numCol; i++) {
                columns.add(rs.getMetaData().getColumnName(i));
            }
            request.setAttribute("columns", columns);

            ArrayList<ArrayList<String>> rows = new ArrayList<>();
            while(rs.next()) {
                ArrayList<String> r = new ArrayList<>();
                for(int i = 1; i <= numCol; i++) {
                    r.add(rs.getString(i));
                }
                rows.add(r);
            }
            request.setAttribute("rows", rows);

            rs.close();
            request.getRequestDispatcher("/view/Database.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new ServletException(e.getMessage());
        } finally {
            db.close();
        }

    }
}