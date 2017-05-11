package doa;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class StarManager {
	public static void insertStar(String firstName, String lastName, String birthday, String photo_url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		firstName = firstName.trim();
		lastName = lastName.trim();
		birthday = birthday.trim();
		photo_url = photo_url.trim();

		if ("".equals(firstName) && "".equals(lastName)) {
			request.setAttribute("error",true);
			request.getRequestDispatcher("/view/Dashboard.jsp").forward(request,response);
			return;
		}

		if ("".equals(lastName)){
			lastName = firstName;
			firstName = "";
		}

		String sql = "INSERT INTO stars (first_name, last_name, dob, photo_url) " +
				"VALUES (?, ?, ?, ?)";

		String param[] = {firstName.trim(), lastName.trim(), birthday.trim(), photo_url.trim()};
		DBManager.executeUpdate(sql, param);
		DBManager.close();

		request.setAttribute("error",false);
		request.getRequestDispatcher("/view/Dashboard.jsp").forward(request,response);
	}
}
