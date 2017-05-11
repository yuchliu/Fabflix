package controller;

import doa.DBManager;
import doa.StarManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by cjk98 on 5/9/2017.
 *
 */
@WebServlet("/DashboardControl")
public class DashboardControl extends HttpServlet{
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String dob = request.getParameter("dob");
        String photo_URL = request.getParameter("photo_URL");

        if (firstName == null) firstName = "";
        if (lastName == null) lastName = "";
        //TODO: not sure why it is always not equal to null
        if (dob.equals("")) dob = "1700-01-01";
        if (photo_URL.equals("")) photo_URL = "http://static6.businessinsider.com/image/55918b77ecad04a3465a0a63/nbc-fires-donald-trump-after-he-calls-mexicans-rapists-and-drug-runners.jpg";

        StarManager.insertStar(firstName, lastName, dob, photo_URL, request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
