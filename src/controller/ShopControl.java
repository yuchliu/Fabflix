package controller;

import java.io.IOException;
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
		LinkedHashMap<String,Integer> shopCart = (LinkedHashMap<String, Integer>) request.getSession().getAttribute("shopCart");
		String movie = request.getParameter("movie");
		if (shopCart == null) {shopCart = new LinkedHashMap<String, Integer>(); shopCart.put(movie, 1);}
		else{
			int count = shopCart.containsKey(movie) ? shopCart.get(movie) : 0;
			shopCart.put(movie, count+1);
		}
		if (request.getParameter("clear")!=null && "true".equals(request.getParameter("clear")))
			shopCart = null;
		request.getSession().setAttribute("shopCart", shopCart);
		request.getRequestDispatcher("/view/shopCart.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
