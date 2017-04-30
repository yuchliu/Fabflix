package controller;

import doa.DBManager;
import domain.User;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.LinkedHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ShopControl")
public class ShopControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unchecked")

		User user = (User) request.getSession().getAttribute("User");
		Object clear = request.getParameter("clear");
		Object update = request.getParameter("update");
		if(clear != null && "true".equalsIgnoreCase((String) clear)) {

			String[] params = {user.getId()};
			String sql = "DELETE FROM carts WHERE customer_id = ?;";
			DBManager.executeUpdate(sql, params);
			DBManager.close();

		} else if(update != null && "true".equalsIgnoreCase((String) update)) {

			String[] params;
			String sql;
			int amount = Integer.parseInt(request.getParameter("amount"));
			if(amount <= 0) {
				params = new String[]{user.getId(), request.getParameter("cart_id")};
				sql = "DELETE FROM carts WHERE customer_id = ? AND cart_id = ?;";
			} else {
				params = new String[] {request.getParameter("amount"), request.getParameter("cart_id")};
				sql = "UPDATE carts SET amount = ? WHERE cart_id = ?;";
			}

			DBManager.executeUpdate(sql, params);
			DBManager.close();

		} else {

			String[] params = {user.getId(), request.getParameter("movie")};
			String sql = "INSERT INTO carts (customer_id, movie_id) VALUE(?, ?) ON DUPLICATE KEY UPDATE amount = amount + 1;";
			DBManager.executeUpdate(sql, params);
			DBManager.close();

		}

		request.getRequestDispatcher("/view/shopCart.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
