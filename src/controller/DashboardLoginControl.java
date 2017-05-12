package controller;

import doa.DBManager;
import domain.Employee;

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
@WebServlet("/DashboardLogin")
public class DashboardLoginControl extends HttpServlet {
    //TODO: should we use 1L for all classes?
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
        System.out.println("gRecaptchaResponse=" + gRecaptchaResponse);
        if (request.getParameter("logout")!=null && "true".equals(request.getParameter("logout")))
        {
            request.getSession().removeAttribute("Employee");
            request.getSession().removeAttribute("reCAPTCHA");
            System.out.print("Enter Logout!!!!");
            response.sendRedirect("/fabflix/_dashboard");
        }
        else {
            if (request.getSession().getAttribute("reCAPTCHA") == null) {
                // Verify reCAPTCHA.
                boolean valid = VerifyUtils.verify(gRecaptchaResponse);
                if (!valid) {
                    request.setAttribute("error", true);
                    request.setAttribute("errInfo","Please solve the reCAPTCHA!");
                    request.getRequestDispatcher("/").forward(request, response);
                    return;
                }
                else
                    request.getSession().setAttribute("reCAPTCHA", true);
            }
            String email = request.getParameter("email");
            String pwd = request.getParameter("password");

            String sql = "SELECT fullname, email, password "+
                    "FROM employees WHERE email = \""+ email +"\"";

            ResultSet rs = DBManager.executeQuery(sql);

            try {
                if ( rs.next() && pwd.equals(rs.getString("password")))
                {
                    request.setAttribute("username", email);
                    Employee employee = new Employee();
                    employee.setFullName(rs.getString("fullname"));
                    employee.setEmail(rs.getString("email"));
                    request.getSession().setAttribute("Employee", employee);
                    request.getRequestDispatcher("/view/Dashboard.jsp").forward(request, response);
                }
                else
                {
                    request.setAttribute("error", true);
                    request.setAttribute("errInfo","Invalid username or password!");
                    request.getRequestDispatcher("/fabflix/_dashboard").forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                DBManager.close();
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
