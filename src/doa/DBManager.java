package doa;

import java.sql.*;

public class DBManager {

	private static Connection conn = null;
	private static PreparedStatement pst = null;
	private static ResultSet rs = null;

	public static ResultSet executeQuery(String sql)
	{
		//sql format: select * from 
		conn = getConnection();
		try {
			System.out.println("sql = "+sql);
			pst = conn.prepareStatement(sql);		
			rs = pst.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public static int executeUpdate(String sql, String params[])
	{
		//sql format: select * from
		conn = getConnection();
		try {
			System.out.println("UpdateSql = "+sql);
			pst = conn.prepareStatement(sql);
			for (int i=0; i!=params.length; ++i){
				pst.setString(i+1,params[i]);
			}
			return pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	private static boolean openConnection()
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection("jdbc:mysql:///moviedb?autoReconnect=true&useSSL=false", "tomcat122b", "rRQZtDDOYU3w");
			return true;
		}
		catch (SQLException e)
		{
			System.err.println("Message: " + e.getMessage());
			Throwable t = e.getCause();
			while(t != null)
			{
				System.out.println("Cause: " + t);
				t = t.getCause();
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}

		conn = null;
		return false;
	}
	
	public static Connection getConnection()
	{
		if (conn == null) 
		{
			if (openConnection()) 
				return conn;
			else 
				return null;
		}
		return conn;
	}
	
	public static void close() 
	{
		try 
		{
			if( rs!=null )
			{
				rs.close(); rs = null;
			}
			if( pst!=null )
			{
				pst.close(); pst = null;
			}
			if( conn!=null )
			{
				conn.close(); conn = null;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
