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
		StringBuffer bFirstName = new StringBuffer();
		for (int i = 0; i < starName.length - 1; ++i) {
			if (i != starName.length - 2)
				bFirstName.append(starName[i] + " ");
			else
				bFirstName.append(starName[i]);
		}
		String concatFirstName = bFirstName.toString().trim();
		clauss.setFirstName(concatFirstName);
		clauss.setLastName(starName[starName.length-1].trim());
		request.getSession().setAttribute("clauss", clauss);
		
		String sql = "SELECT id, dob, photo_url FROM stars "
					+"WHERE first_name like \""+ concatFirstName +"%\" AND "
					+"last_name like \"%"+starName[starName.length-1]+"\";";
		
		System.out.println(sql);
		DBManager db = new DBManager();
		ResultSet rs = db.executeQuery(sql);
		Star star = new Star();
		try {
			if (rs.next()){
				star.setId(rs.getInt(1));
				star.setDob(rs.getString(2));
				star.setPhotoUrl(rs.getString(3));
				star.setFistName(concatFirstName);
				star.setLastName(starName[starName.length-1]);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close();
		}
		request.setAttribute("star", star);
		request.getRequestDispatcher("/SearchControl?forStar=true").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
