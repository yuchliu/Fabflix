package doa;

import domain.MetaData;

import javax.naming.InitialContext;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.Random;

public class DBManager {
	//TODO: toggle this variable between single or scaled version
	private static final boolean SCALED = false;
	private static Connection conn = null;
	private static PreparedStatement pst = null;
	private static Statement st = null;
	private static ResultSet rs = null;

	public static ResultSet executeQuery(String sql, String type)
    {
        switch(type) {
			case "OnlyPooled": return executeQuery_pooled_noPrepared(sql); // (T3.3A4/T3.3B3)
            case "OnlyPrepared": return executeQuery_noPool_Prepared(sql);	// (T3.3A5/T3.3B4)
			// case "Raw": return executeQuery_RawSql(sql); // depreciated version
            default: return executeQuery(sql);	// (T3.3A1~A3/T3.3B1,B1T3.3B2)
        }
    }

    //IMPORTANT: used for test query WITH connection pooling AND prepared statement (T3.3A1~A3/T3.3B1,B1T3.3B2)
	public static ResultSet executeQuery(String sql)
	{
		try {

			Context initCtx = new InitialContext();
			if (initCtx == null)
				System.err.println("executeQueryPooled: initCtx is null.");

			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			if (envCtx == null)
				System.err.println("executeQueryPooled: envCtx is null.");

			DataSource ds = getReadDs(envCtx);

			if (ds == null)
				System.err.println("executeQueryPooled: ds is null.");

			conn = ds.getConnection();
			if (conn == null)
				System.err.println("executeQueryPooled: dbcon is null.");

            pst = conn.prepareStatement(sql);
			return pst.executeQuery();

		} catch (SQLException e) {

			System.err.println("Error");
			while(e != null) {
				System.out.println("Error: " + e.getMessage());
				e = e.getNextException();
			}

		} catch (Exception e) {
			System.err.println("Error");
		}

		return null;
	}

	//IMPORTANT: used for test query WITH connection pooling BUT WITHOUT prepared statement (T3.3A4/T3.3B3)
	private static ResultSet executeQuery_pooled_noPrepared(String sql)
	{
		try {

			Context initCtx = new InitialContext();
			if (initCtx == null)
				System.err.println("executeQueryPooled: initCtx is null.");

			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			if (envCtx == null)
				System.err.println("executeQueryPooled: envCtx is null.");

			DataSource ds = getReadDs(envCtx);

			if (ds == null)
				System.err.println("executeQueryPooled: ds is null.");

			conn = ds.getConnection();
			if (conn == null)
				System.err.println("executeQueryPooled: dbcon is null.");

			st = conn.createStatement();
			return st.executeQuery(sql);

		} catch (SQLException e) {

			System.err.println("Error");
			while(e != null) {
				System.out.println("Error: " + e.getMessage());
				e = e.getNextException();
			}

		} catch (Exception e) {
			System.err.println("Error: " + e.getMessage());
		}

		return null;
	}

	//IMPORTANT: used for test query WITHOUT connection pooling BUT with prepared statement(T3.3A5/ T3.3B4)
    private static ResultSet executeQuery_noPool_Prepared(String sql)
    {
        conn = getConnection(false);
        try {
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.err.println("Error");
            while(e != null) {
                System.out.println("Error: " + e.getMessage());
                e = e.getNextException();
            }
        }
        return rs;
    }

	//IMPORTANT: used for test query WITHOUT EITHER connection pooling OR prepared statement (depreciated version)
    public static ResultSet executeQuery_RawSql(String sql)
    {
        conn = getConnection(false);
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
        } catch (SQLException e) {
            System.err.println("Error");
            while(e != null) {
                System.out.println("Error: " + e.getMessage());
                e = e.getNextException();
            }
        }
        return rs;
    }

	public static int executeUpdate(String sql, String params[])
	{
        try {

            Context initCtx = new InitialContext();
            if (initCtx == null)
                System.err.println("executeUpdatePooled: initCtx is null.");

            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            if (envCtx == null)
                System.err.println("executeUpdatePooled: envCtx is null.");

			DataSource ds;
			if (SCALED)
            	ds = (DataSource) envCtx.lookup("jdbc/MovieDB_Write_Master");
            else
				ds = (DataSource) envCtx.lookup("jdbc/MovieDB_Write_Local");

            if (ds == null)
                System.err.println("executeUpdatePooled: ds is null.");

            conn = ds.getConnection();
            if (conn == null)
                System.err.println("executeUpdatePooled: dbcon is null.");

            PreparedStatement statement = conn.prepareStatement(sql);
            for (int i=0; i!=params.length; ++i){
                statement.setString(i+1,params[i]);
            }

            return statement.executeUpdate();

        } catch (SQLException e) {

            System.err.println("Error");
            while(e != null) {
                System.out.println("Error: " + e.getMessage());
                e = e.getNextException();
            }

        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
        }

        return -1;
	}

	public static Object[] executeStoredProcedure(String procedure, String params[], Integer[] outParams)
	{
		try {

            Context initCtx = new InitialContext();
            if (initCtx == null)
                System.err.println("executeUpdatePooled: initCtx is null.");

            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            if (envCtx == null)
                System.err.println("executeUpdatePooled: envCtx is null.");

			DataSource ds;
			if (SCALED)
				ds = (DataSource) envCtx.lookup("jdbc/MovieDB_Write_Master");
			else
				ds = (DataSource) envCtx.lookup("jdbc/MovieDB_Write_Local");

            if (ds == null)
                System.err.println("executeUpdatePooled: ds is null.");

            conn = ds.getConnection();
			CallableStatement cs = conn.prepareCall(procedure);

			int i;
			for (i=0; i!=params.length; ++i){
				cs.setString(i+1,params[i]);
			}
			for (int j = 0; j!=outParams.length; ++j){
				cs.registerOutParameter(i+1,outParams[j]);
			}

			ResultSet rs = cs.executeQuery();

			Object[] output = {rs, cs};
			return output;

		} catch (SQLException e) {
			System.err.println("Error");
			while(e != null) {
				System.out.println("Error: " + e.getMessage());
				e = e.getNextException();
			}
		} catch (Exception e) {
            System.err.println("Error");
        }

		return null;
	}

	public static MetaData getMetaData() {
		conn = getConnection(false);
		ResultSet resultTables = null;
		ResultSet resultColumns = null;
		ArrayList<String> tables = new ArrayList<>();
		MetaData metaData = new MetaData();

		try {
			DatabaseMetaData metadata = conn.getMetaData();
			String[] tableTypes = {"TABLE"};
			resultTables = metadata.getTables(null, "%", "%", tableTypes);

			while (resultTables.next())
			{
				String tableName = resultTables.getString("TABLE_NAME");
				tables.add(tableName);
				metaData.tableMap.put(tableName, new MetaData.Table(tableName));
			}

			for (String tableName : tables)
			{

				resultColumns = metadata.getColumns(null, "%", tableName, "%");

				while (resultColumns.next())
				{
					String colName = resultColumns.getString("COLUMN_NAME");
					String colType = resultColumns.getString("TYPE_NAME");
					metaData.tableMap.get(tableName).colMap.put(colName, new MetaData.Column(colName, colType));
				}
			}
		}
		catch (SQLException e)
		{
			System.err.println("Error");
			while(e != null) {
				System.out.println("Error: " + e.getMessage());
				e = e.getNextException();
			}
		}
		finally
		{
			try
			{
				resultTables.close();
				resultColumns.close();
			}
			catch (SQLException e) {
				System.err.println("Error");
				while(e != null) {
					System.out.println("Error: " + e.getMessage());
					e = e.getNextException();
				}
			}
		}
		return metaData;
	}

	private static DataSource getReadDs (Context envCtx){
		DataSource ds = null;
		try{
			if (SCALED) {
				Random rand = new Random();
				int n = rand.nextInt(100) + 1;
				if (n > 50)
					ds = (DataSource) envCtx.lookup("jdbc/MovieDB_Read_Master");
				else
					ds = (DataSource) envCtx.lookup("jdbc/MovieDB_Read_Slave");
			}
			else
				ds = (DataSource) envCtx.lookup("jdbc/MovieDB_Read_Local");
		} catch (NamingException e) {
			System.err.println("Error: Naming Exception");
		}
		return ds;
	}

	private static boolean openConnection(Boolean writeOP)
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			if (writeOP)
				conn = DriverManager.getConnection("jdbc:mysql://172.31.26.150:3306/moviedb?autoReconnect=true&useSSL=false", "tomcat122b", "rRQZtDDOYU3w");
			else
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
			System.err.println("Message: " + e.getMessage());
		}

		conn = null;
		return false;
	}
	
	private static Connection getConnection(Boolean writeOP)
	{
		if (conn == null) 
		{
			if (openConnection(writeOP))
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
			if( st!=null )
			{
				st.close(); st = null;
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
