package controller;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Movie;
import service.MovieService;

@WebServlet("/SearchControl")
public class SearchControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Clauss clauss = null;
		
		if (request.getParameter("refresh")!=null && "yes".equals(request.getParameter("refresh")))
		{
			clauss = new Clauss();
			clauss.setTitle(request.getParameter("title"));
			clauss.setYear(request.getParameter("year"));
			clauss.setDirector(request.getParameter("director"));
			clauss.setFirstName(request.getParameter("firstName"));
			clauss.setLastName(request.getParameter("lastName"));
			
		}
		else if (request.getParameter("reorder")!=null && "yes".equals(request.getParameter("reorder"))){
			System.out.println("order="+request.getParameter("order")+request.getParameter("orderType"));
			clauss = (Clauss) request.getSession().getAttribute("clauss");
			clauss.setOrder(request.getParameter("order")+request.getParameter("orderType"));
		}
		
		else{
			clauss = (Clauss) request.getSession().getAttribute("clauss");
		}
		String pageInfo = request.getParameter("page"); 
		String pageSizeInfo = request.getParameter("pageSize");
		
		int page = pageInfo==null ? 1 : Integer.parseInt(pageInfo);
		int pageSize = pageSizeInfo==null ? 5 :Integer.parseInt(pageSizeInfo);
		
		MovieService movieService = new MovieService();
		LinkedList<Movie> item = movieService.getMovieByPage(clauss,page,pageSize);
		int pageNum = item.getFirst().getId();
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageSize", pageSize);
		item.removeFirst();
		request.setAttribute("result", item);
		request.setAttribute("clauss", clauss);
		if (request.getParameter("forStar")!=null && "true".equals(request.getParameter("forStar")))
		{
			request.setAttribute("star", request.getAttribute("star"));
			request.getRequestDispatcher("/view/SingleStar.jsp").forward(request, response);
		}
		else{
			request.getRequestDispatcher("/view/MovieList.jsp?page="+page).forward(request, response);;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
