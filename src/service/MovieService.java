package service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import controller.Clauss;
import doa.DBManager;
import domain.Movie;

public class MovieService {
	
	private boolean byStar = false;
	private boolean byGenre = false;
	
	private static final String starTable =
			"movies JOIN stars_in_movies ON movies.id = stars_in_movies.movie_id "
			+ "JOIN stars ON stars.id = stars_in_movies.star_id ";
	private static final String genreTable =
			"movies JOIN genres_in_movies ON movies.id = genres_in_movies.movie_id "
			+ "JOIN genres ON genres.id = genres_in_movies.genre_id ";
	
	@SuppressWarnings("finally")
	public LinkedList<Movie> getMovieByPage(Clauss clauss, int page, int pageSize){
		
		String condition = this.generateCondition(clauss);
		String rowCount = "SELECT count(movies.id)"+
				 		  " FROM "+(byStar?starTable : (byGenre?genreTable:"movies") )+" " +
				 		  condition +";";
		ResultSet rs = DBManager.executeQuery(rowCount);
		int pageNum = 1;
		try {
			if (rs.next()) pageNum = (rs.getInt(1)-1)/pageSize + 1;
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
				
		LinkedList<Movie> movieItem = new LinkedList<Movie>();
		{
			Movie movie = new Movie();
			movie.setId(pageNum);
			movieItem.add(movie);
		}
		
		String movieSelect = "SELECT distinct movies.id, movies.year, movies.title, movies.director, movies.banner_url, movies.trailer_url"
							+" FROM "+(byStar?starTable : (byGenre?genreTable:"movies") )+" " 
							+ condition+" ORDER BY "+clauss.getOrder()
							+" LIMIT "+pageSize+" OFFSET "+(page-1)*pageSize+";";
		rs = DBManager.executeQuery(movieSelect);
		try {
			while (rs.next())
			{
				Movie movie = new Movie();
				movie.setId(rs.getInt(1));
				movie.setYear(rs.getInt(2)+"");
				movie.setTitle(rs.getString(3));
				movie.setDirector(rs.getString(4));
				movie.setBannerUrl(rs.getString(5));
				movie.setTrailerUrl(rs.getString(6));
				movieItem.add(movie);
			}
			for (Movie movie : movieItem)
			{
				String starSelect = "SELECT distinct stars.first_name, stars.last_name "+
									"FROM stars_in_movies JOIN stars ON stars_in_movies.star_id = stars.id "+
									"WHERE stars_in_movies.movie_id = "+movie.getId()+";";
				
				rs = DBManager.executeQuery(starSelect);
				while (rs.next())
					movie.getStars().add(rs.getString(1)+" "+rs.getString(2));
				
				String genreSelect = "SELECT distinct genres.name "+
									 "FROM genres_in_movies JOIN genres ON genres_in_movies.genre_id = genres.id "+
									 "WHERE genres_in_movies.movie_id = "+movie.getId()+";";

				rs = DBManager.executeQuery(genreSelect);
				while (rs.next())
					movie.getGenre().add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBManager.close();
			return movieItem;
		}
	}
	
	@SuppressWarnings("finally")
	public Movie getMovieById(String ID){
		String movieSelect = "SELECT distinct movies.id, movies.year, movies.title, movies.director, movies.banner_url, movies.trailer_url"
				+" FROM movies " 
				+"WHERE movies.id="+ID+";";
		
		ResultSet rs = DBManager.executeQuery(movieSelect);
		Movie movie = new Movie();
		try {
			if (rs.next()){
				movie.setId(rs.getInt(1));
				movie.setYear(rs.getInt(2)+"");
				movie.setTitle(rs.getString(3));
				movie.setDirector(rs.getString(4));
				movie.setBannerUrl(rs.getString(5));
				movie.setTrailerUrl(rs.getString(6));
				
				String starSelect = "SELECT distinct stars.first_name, stars.last_name "+
						"FROM stars_in_movies JOIN stars ON stars_in_movies.star_id = stars.id "+
						"WHERE stars_in_movies.movie_id = "+movie.getId()+";";
				rs = DBManager.executeQuery(starSelect);
				while (rs.next())
					movie.getStars().add(rs.getString(1)+" "+rs.getString(2));
				
				String genreSelect = "SELECT distinct genres.name "+
									 "FROM genres_in_movies JOIN genres ON genres_in_movies.genre_id = genres.id "+
									 "WHERE genres_in_movies.movie_id = "+movie.getId()+";";
	
				rs = DBManager.executeQuery(genreSelect);
				while (rs.next())
					movie.getGenre().add(rs.getString(1));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBManager.close();
			return movie;
		}
	}
	
	private String generateCondition (Clauss clauss){
		String title = clauss.getTitle();
		String year =  clauss.getYear();
		String director = clauss.getDirector();
		String firstName = clauss.getFirstName();
		String lastName = clauss.getLastName();
		String genre = clauss.getGenre();
		String startBy = clauss.getStartBy();


		String condition = "";
		if ("".equals(title+year+director+firstName+lastName+genre+startBy)) ;
		else if("".equals(genre) && "".equals(startBy)){
			boolean isFirstCondition = true;
			condition += "WHERE ";

			if(firstName!=null && !"".equals(firstName)) {
				condition += "stars.first_name LIKE \""+"%"+firstName+"%\" "; 
				isFirstCondition = false;
				this.byStar = true;
			}
			
			if(lastName!=null && !"".equals(lastName)) {
				condition += isFirstCondition ? "" : "AND ";
				condition += "stars.last_name LIKE \""+"%"+lastName+"%\" ";
				isFirstCondition = false;
				this.byStar = true;
			}
			
			if(director!=null && !"".equals(director)) {
				condition += isFirstCondition ? "" : "AND ";
				condition += "movies.director LIKE \""+"%"+director+"%\" ";
				isFirstCondition = false;
			}
			
			if(title!=null && !"".equals(title)) {
				condition += isFirstCondition ? "" : "AND ";
				condition += "movies.title LIKE \""+"%"+title+"%\" ";
				isFirstCondition = false;
			}
			
			if(year!=null && !"".equals(year)) {
				condition += isFirstCondition ? "" : "AND ";
				condition += "movies.year = "+year;
			}
		} else if(!"".equals(startBy)) {
			condition = "WHERE movies.title LIKE \""+startBy+"%\" ";
		}
		else {
			this.byGenre = true;
			condition = "WHERE genres.name = \""+genre+"\" ";
		}
		return condition;
	}
}
