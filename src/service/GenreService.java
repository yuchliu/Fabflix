package service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import doa.DBManager;

public class GenreService {
	public static LinkedList<String> getGenres(){
		String sql = "SELECT name FROM genres ORDER BY name ASC;";

		DBManager db = new DBManager();
		ResultSet rs = db.executeQuery(sql);
		
		LinkedList<String> genreSet = new LinkedList<String>();
		try {
			while(rs.next()) genreSet.add(rs.getString(1));
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.close();
		}
		
		return genreSet;
	}
}
