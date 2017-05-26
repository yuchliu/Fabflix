package controller;

import doa.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import domain.Movie;

@WebServlet("/FullTextSearch")
public class FullTextSearchControl extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String query = request.getParameter("query");
        String limit = request.getParameter("limit");
        String returnType = request.getParameter("returnType"); // TODO - Might need another response type for android

        if(returnType == null || "".equals(returnType.trim())) returnType = "JSON";

        // TODO NOTE: Temporary query, this is NOT full text search
        String sql = "SELECT title FROM movies WHERE title LIKE \"%" + query + "%\" LIMIT " + limit + ";";
        ResultSet rs = DBManager.executeQuery(sql);

        ArrayList<String> results = new ArrayList<>();

        // Gather the results into an array.
        try {
            while(rs.next()) {
                results.add(rs.getString("title"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.close();
        }

        // Format the results list as a json object (using Google's Gson) and return it to the caller.
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(results, new TypeToken<ArrayList<String>>(){}.getType());

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.println(jsonResponse);
        out.close();

    }

    private LinkedList<Movie> getMovieByFT(String query)
    {
        String[] words = query.split(" ");
        LinkedList<Movie> results = new LinkedList<Movie>();
        String sql = "SELECT * FROM movies WHERE ";

        for (int i=0; i<words.length-1; ++i)
            sql += "MATCH(title) AGAINST ('*"+words[i]+"*') AND";

        sql += "MATCH(title) AGAINST ('"+words[words.length]+"*');";

        try {
            ResultSet rs = DBManager.executeQuery(sql);
            while (rs.next())
            {
                Movie movie = new Movie();
                movie.setId(rs.getInt("id"));
                movie.setYear(rs.getInt("year")+"");
                movie.setTitle(rs.getString("title"));
                movie.setBannerUrl(rs.getString("banner_url"));
                movie.setTrailerUrl(rs.getString("trailer_url"));
                results.push(movie);
            }

        } catch (SQLException e){
            System.out.println(e);
        } finally {
            DBManager.close();
        }

        return results;
    }
}
