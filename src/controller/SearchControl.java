package controller;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import doa.DBManager;
import domain.Movie;
import service.MovieService;

@WebServlet("/SearchControl")
public class SearchControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		DBManager.restartTimer();
		long startTime = System.nanoTime();

		// Build Clauss object
		Clauss clauss = null;

		// Clauss search parameters
		String order = request.getParameter("order");
		String orderType = request.getParameter("orderType");
		String title = request.getParameter("title");
		String year = request.getParameter("year");
		String director = request.getParameter("director");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String genre = request.getParameter("genre");
		String startBy = request.getParameter("startby");
		String connectionType = request.getParameter("connectionType");

		// Set parameters
		clauss = new Clauss();
		if(order != null) clauss.setOrder(order);
		if(order != null && orderType != null) clauss.setOrder(order + " " + orderType);
		if(title != null) clauss.setTitle(title.trim());
		if(year != null) clauss.setYear(year.trim());
		if(director != null) clauss.setDirector(director.trim());
		if(firstName != null) clauss.setFirstName(firstName.trim());
		if(lastName != null) clauss.setLastName(lastName.trim());
		if(genre != null && !"all".equals(genre))clauss.setGenre(genre);
		if(startBy != null) clauss.setStartBy(startBy.trim());
		if(connectionType == null) connectionType = "";
		if (request.getParameter("forStar") != null && "true".equals(request.getParameter("forStar")))
			clauss = (Clauss) request.getSession().getAttribute("clauss");

		// Pagination parameters
		int pageNum = request.getParameter("pageNum") == null ? 1 : Integer.parseInt(request.getParameter("pageNum"));
		int pageSize = request.getParameter("pageSize") == null ? 16 : Integer.parseInt(request.getParameter("pageSize"));

		MovieService movieService = new MovieService();
		LinkedList<Movie> items = movieService.getMovieByPage(clauss, pageNum, pageSize, connectionType);

		request.setAttribute("pageTotal", items.getFirst().getId());
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("clauss", clauss);

		items.removeFirst();
		request.setAttribute("result", items);
		request.setAttribute("clauss", clauss);

		long endTime = System.nanoTime();

		long tj = DBManager.readTimer();
		long ts = endTime - startTime;
		String logEntry = String.format("%d - %d", ts, tj);

		try(FileWriter fw = new FileWriter(MyConstants.LOG_FILE_LOC, true);
			BufferedWriter bw = new BufferedWriter(fw);
			PrintWriter out = new PrintWriter(bw))
		{
			out.println(logEntry);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (request.getParameter("forStar") != null && "true".equals(request.getParameter("forStar"))) {
			request.setAttribute("star", request.getAttribute("star"));
			request.getRequestDispatcher("/view/SingleStar.jsp").forward(request, response);
		}
		else if (request.getParameter("newPage") != null) {
			request.getRequestDispatcher("/view/partial/MovieList.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/view/MovieList.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
