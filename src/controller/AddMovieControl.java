package controller;

import doa.DBManager;
import doa.StarManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

@WebServlet("/AddMovieControl")
public class AddMovieControl extends HttpServlet{
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message;
        Boolean error;

        String movieTitle = request.getParameter("movieTitle");
        String movieYear = request.getParameter("movieYear");
        String movieDirector = request.getParameter("movieDirector");
        String movieBannerUrl = request.getParameter("movieBannerUrl");
        String movieTrailerUrl = request.getParameter("movieTrailerUrl");

        String starFirstName = request.getParameter("starFirstName");
        String starLastName = request.getParameter("starLastName");
        String starDob = request.getParameter("starDob");
        String starPhotoUrl = request.getParameter("starPhotoUrl");

        String genreName = request.getParameter("genreName");

        if (starDob.equals("")) starDob = "1700-01-01";
        if (starPhotoUrl.equals("")) starPhotoUrl = "http://static6.businessinsider.com/image/55918b77ecad04a3465a0a63/nbc-fires-donald-trump-after-he-calls-mexicans-rapists-and-drug-runners.jpg";

        if ("".equals(movieTitle)) {
            error = true;
            message = "Movie title is required.";
        }
        else if ("".equals(movieYear)) {
            error = true;
            message = "Movie year is required.(YYYY)";
        }
        else if ("".equals(movieDirector)) {
            error = true;
            message = "Movie Director is required.";
        }
        else if ("".equals(genreName)) {
            error = true;
            message = "Gerne Name is required.";
        }
        else if ("".equals(starFirstName) && "".equals(starLastName)) {
            error = true;
            message = "Please put at least one name for the star.";
        }
        else {
            if ("".equals(starLastName)){
                starLastName = starFirstName;
                starFirstName = "";
            }
            String procedure = "{call add_movie(?,?,?,?,?,?,?,?,?,?,?)}";
            String[] spArgs = {movieTitle, movieYear, movieDirector, movieBannerUrl, movieTrailerUrl,
                    starFirstName, starLastName, starDob, starPhotoUrl, genreName};
            Integer[] outArgs = {Types.VARCHAR};

            DBManager db = new DBManager();
            Object[] output = db.executeStoredProcedure(procedure, spArgs, outArgs);
            error = true;
            message = "Please make sure you entered all input correctly.";

            if (output != null) {

                ResultSet rs = (ResultSet) output[0];
                CallableStatement cs = (CallableStatement) output[1];

                try {
                    error = false;
                    message = cs.getString(11);
                } catch (SQLException e) {
                    e.printStackTrace();
                }

            }

            db.close();
        }

        request.setAttribute("error",error);
        request.setAttribute("message", message);
        request.getRequestDispatcher("/view/AddMovie.jsp").forward(request,response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
