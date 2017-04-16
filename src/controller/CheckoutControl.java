package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import doa.DBManager;

@WebServlet("/CheckoutControl")
public class CheckoutControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String cc_id = request.getParameter("cc_id");
		String expiration = request.getParameter("expiration");
		
		boolean valid = false;
		
		String sql = "SELECT first_name, last_name, expiration "
				   + "FROM creditcards WHERE id = \""+cc_id+"\"";
		
		ResultSet rs = DBManager.excecuteQuery(sql);
		
		try {
			if (rs.next()){
				if ( (rs.getString(1)+rs.getString(2)+rs.getString(3)).equals(firstName+lastName+expiration) ) valid = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBManager.close();
			response.sendRedirect("/view/Confirm.jsp?valid="+valid);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
