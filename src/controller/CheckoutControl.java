package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		int trans = 0;
		
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
			User user = (User) request.getSession().getAttribute("User");
			LinkedHashMap<String,Integer> shopCart = (LinkedHashMap<String, Integer>) request.getSession().getAttribute("shopCart");
			String sqlUpdate = "INSERT INTO sales (customer_id, movie_id, sale_date) VALUES(?,?,?)";

			//get UTC time
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate localDate = LocalDate.now();
			String sale_date = dtf.format(localDate);

			for (String movie : shopCart.keySet()) {
                String[] params = new String[]{
                		user.getId(),
						movie.split("SPLITER")[0],
						sale_date
				};

                int quantity = shopCart.get(movie);
                for (int i = 0; i!=quantity; ++i)
                	trans += DBManager.executeUpdate(sqlUpdate,params);
            }

            request.getSession().removeAttribute("shopCart");
		}

		DBManager.close();
		response.sendRedirect("/view/Confirm.jsp?trans="+trans);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
