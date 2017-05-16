package doa;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class StarManager {
	public static void insertStar(String firstName, String lastName, String birthday, String photo_url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message;
		firstName = firstName.trim();
		lastName = lastName.trim();
		birthday = birthday.trim();
		photo_url = photo_url.trim();

		if ("".equals(firstName) && "".equals(lastName)) {
			request.setAttribute("error",true);
			message = "Please put at least one name for the star.";
			request.setAttribute("message", message);
			request.getRequestDispatcher("/view/AddStar.jsp").forward(request,response);
			return;
		}

		if ("".equals(lastName)){
			lastName = firstName;
			firstName = "";
		}

		String sql = "INSERT INTO stars (first_name, last_name, dob, photo_url) " +
				"VALUES (?, ?, ?, ?)";

		String param[] = {firstName.trim(), lastName.trim(), birthday.trim(), photo_url.trim()};
		int  retVal = DBManager.executeUpdate(sql, param);
		DBManager.close();

		if (retVal == -1) { // dob failed
			request.setAttribute("error",true);
			message = "Please make sure you entered all input in correct format.";
		}
		else if (retVal == 0) {
			request.setAttribute("error",false);
			message = "Adding new star failed.";
		}
		else {
			request.setAttribute("error",false);
			message = "Success: A new star inserted.";
		}
		request.setAttribute("message",message);
		request.getRequestDispatcher("/view/AddStar.jsp").forward(request,response);
	}
}
