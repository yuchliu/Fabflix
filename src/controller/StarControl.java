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
		String starname = request.getParameter("star").trim();
		Clauss clauss = new Clauss();
		String[] name = {"",""};
		int split = starname.lastIndexOf(" ");
		if (split==-1)
			name[0] = starname;
		else {
			name[0] = starname.substring(0, split);
			name[1] = starname.substring(split + 1);
		}
		clauss.setFirstName(name[0]);
		clauss.setLastName(name[1]);
		request.getSession().setAttribute("clauss", clauss);
		
		String sql = "SELECT id, dob, photo_url FROM stars "
					+"WHERE first_name like \""+ name[0] +"%\" AND "
					+"last_name like \"%"+name[1]+"\";";
		
		System.out.println(sql);
		ResultSet rs = DBManager.executeQuery(sql);
		Star star = new Star();
		try {
			if (rs.next()){
				star.setId(rs.getInt(1));
				star.setDob(rs.getString(2));
				star.setPhotoUrl(rs.getString(3));
				star.setFistName(name[0]);
				star.setLastName(name[1]);
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
