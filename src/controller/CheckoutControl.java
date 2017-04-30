package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import doa.DBManager;
import domain.User;

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
		ResultSet rs = DBManager.executeQuery(sql);
		try {
			if (rs.next()){
				if ( (rs.getString(1)+rs.getString(2)+rs.getString(3)).equals(firstName+lastName+expiration) ) valid = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (!valid){
			request.setAttribute("error",valid);
			request.getRequestDispatcher("/view/CheckOut.jsp").forward(request,response);
		}

		else {

			//get UTC time
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate localDate = LocalDate.now();
			String sale_date = dtf.format(localDate);

			try {

				User user = (User) request.getSession().getAttribute("User");
				String sqlGetItems = "SELECT * FROM carts WHERE customer_id = " + user.getId() + ";";
				String sqlClearItems = "DELETE FROM carts WHERE customer_id = " + user.getId() + ";";
				ResultSet cartItems = DBManager.executeQuery(sqlGetItems);

				String sqlUpdate = "INSERT INTO sales (customer_id, movie_id, sale_date) VALUES ";
				ArrayList<String> params = new ArrayList<>();

				while(cartItems.next()) {

					for(int i = 0; i < cartItems.getInt("amount"); i++) {

						sqlUpdate += "(?, ?, ?)";
						if(i != cartItems.getInt("amount") - 1) {
							sqlUpdate += ", ";
						}

						params.add(user.getId());
						params.add(cartItems.getString("movie_id"));
						params.add(sale_date);

					}

					if(cartItems.isLast()) {
						sqlUpdate += ";";
					} else {
						sqlUpdate += ", ";
					}

				}

				DBManager.close();
				DBManager.executeUpdate(sqlUpdate, params.toArray(new String[params.size()]));
				DBManager.close();
				DBManager.executeUpdate(sqlClearItems, new String[]{});
				DBManager.close();

			} catch (SQLException e) {
				e.printStackTrace();
				request.setAttribute("error",valid);
				request.getRequestDispatcher("/view/CheckOut.jsp").forward(request,response);
			}

			request.getRequestDispatcher("/view/Confirm.jsp").forward(request,response);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
