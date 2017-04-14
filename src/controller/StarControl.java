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
import domain.Star;

@WebServlet("/StarControl")
public class StarControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String starname = request.getParameter("star");
		Clauss clauss = new Clauss();
		String []starName = starname.split(" ");
		clauss.setFirstName(starName[0]);
		clauss.setLastName(starName[1]);
		request.getSession().setAttribute("clauss", clauss);
		
		String sql = "SELECT id, dob, photo_url FROM stars "
					+"WHERE first_name = \""+starName[0]+"\" AND "
					+"last_name = \""+starName[1]+"\";";
		
		System.out.println(sql);
		ResultSet rs = DBManager.excecuteQuery(sql);
		Star star = new Star();
		try {
			if (rs.next()){
				star.setId(rs.getInt(1));
				star.setDob(rs.getString(2));
				star.setPhotoUrl(rs.getString(3));
				star.setFistName(starName[0]);
				star.setLastName(starName[1]);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBManager.close();
		}
		request.setAttribute("star", star);
		request.getRequestDispatcher("/SearchControl?forStar=true").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
