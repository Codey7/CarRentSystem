package com.codey.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by Mr.Codey on 2016/1/7.
 */
public class JDBCTest
{
    private Connection conn;
    private final static  String URL="jdbc:mysql://localhost:3306/"
            + "car_shop?characterEncoding=UTF-8&user=root&password=codey";

    public boolean getConn()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL);
            if (conn != null)
            {
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
    public  Connection getConnection()
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
}
