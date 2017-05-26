package controller.Android;

import doa.DBManager;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/fabflix/Wyd70lJX0W/A_LoginControl")

public class A_LoginControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String username = request.getParameter("username");
        String pwd = request.getParameter("password");

        String sql = "SELECT first_name, last_name, id, password " +
                "FROM customers WHERE email = \"" + username + "\"";

        ResultSet rs = DBManager.executeQuery(sql);
        JSONObject jsonObj = new JSONObject();
        try {
            if (!rs.next()) {
                jsonObj.put("VerifiedResult", "WrongUsername");
            }
            else {
                if (pwd.equals(rs.getString("password"))) {
                    jsonObj.put("VerifiedResult", "LoginVerified");
                } else {
                    jsonObj.put("VerifiedResult", "WrongPassword");
                }
            }

        } catch (SQLException e) {
            out.print("You should not be here!");
            System.err.println("Error");
            while(e != null) {
                System.out.println("Error: " + e.getMessage());
                e = e.getNextException();
            }
        } finally {
            out.print(jsonObj.toString());
            DBManager.close();
        }
    }

}