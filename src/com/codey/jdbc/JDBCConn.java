package com.codey.jdbc;

/**
 * 两个jdbc,一个单列类用于一次请求（jdbcconn）
 * 另一个是多次请求(jdbctest)
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCConn
{
    private static Connection conn;
    private final static  String URL="jdbc:mysql://localhost:3306/"
            + "car_shop?characterEncoding=UTF-8&user=root&password=codey";

    private JDBCConn()
    {
    }
    public void setConn(Connection conn)
    {
        this.conn = conn;
    }

    public static Connection getConnection()
    {
        if (conn==null)
        {
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(URL);
            } catch (ClassNotFoundException e)
            {
                e.printStackTrace();
            } catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
        return conn;
    }

    private static final JDBCConn JDBC = new JDBCConn();

    public static JDBCConn getInstance()
    {
        return JDBC;
    }

/*	public static void main(String[] args)
	{
		JDBCConn jdbc=new JDBCConn();
		jdbc.exeCuteSql("select * from carinfo");
	}*/


    public boolean getConn()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL);
            if (conn != null)
            {
                this.setConn(conn);
                return true;
            }
        } catch (ClassNotFoundException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }
/*	public void exeCuteSql(String sql)
	{
		ResultSet rs=null;
		if(getConn())
		{
			try {
				Statement sm=conn.createStatement();
				rs=sm.executeQuery(sql);
				while(rs.next())
				{
					System.out.println(rs.getObject("carName"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}*/
}
