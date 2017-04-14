package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BrowseControl")
public class BrowseControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String genre = request.getParameter("genre");
		String star = request.getParameter("star");
		Clauss clauss = new Clauss();
		if (!"all".equals(genre) && genre!=null )clauss.setGenre(genre);
		if (star!=null){
			String []starName = star.split(" ");
			clauss.setFirstName(starName[0]);
			clauss.setLastName(starName[1]);
		}
		request.getSession().setAttribute("clauss", clauss);
		request.getRequestDispatcher("/SearchControl").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
