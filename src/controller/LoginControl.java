package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import doa.DBManager;
import domain.User;

@WebServlet("/LoginControl")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
		System.out.println("gRecaptchaResponse=" + gRecaptchaResponse);
		// Verify reCAPTCHA.
		boolean valid = VerifyUtils.verify(gRecaptchaResponse);
		if (request.getParameter("logout")!=null && "true".equals(request.getParameter("logout")))
		{
			request.getSession().removeAttribute("User");
			System.out.print("Enter Logout!!!!");
			response.sendRedirect("/");
		}
		else if (!valid) {
			request.setAttribute("error", true);
			request.setAttribute("errInfo","Please solve the reCAPTCHA!");
			request.getRequestDispatcher("/").forward(request, response);
		}
		else {
			String email = request.getParameter("email");
			String pwd = request.getParameter("password");

			String sql = "SELECT first_name, last_name, id, password "+
						 "FROM customers WHERE email = \""+email+"\"";

			ResultSet rs = DBManager.executeQuery(sql);

			try {
				if ( rs.next() && pwd.equals(rs.getString("password")))
				{
					request.setAttribute("username", email);
					User user = new User();
					user.setFirstName(rs.getString(1));
					user.setLastName(rs.getString(2));
					user.setId(rs.getString(3));
					request.getSession().setAttribute("User", user);
					request.getSession().setAttribute("shopCart", new LinkedHashMap<String,Integer>());
					request.getRequestDispatcher("/view/MainPage.jsp").forward(request, response);
				}
				else
				{
					request.setAttribute("error", true);
					request.setAttribute("errInfo","Invalid username or password!");
					request.getRequestDispatcher("/").forward(request, response);
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
