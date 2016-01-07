package com.codey.dao;

import com.codey.bean.Message;
import com.codey.bean.OrderForm;
import com.codey.jdbc.JDBCTest;
import com.sun.org.apache.xpath.internal.operations.Or;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 * Created by Mr.Codey on 2016/1/7.
 */
public class OrderFormDao
{
    public ArrayList<OrderForm> queryOrderForm() throws SQLException
    {
        ArrayList<OrderForm> mList = new ArrayList<>();
        Connection conn;
        JDBCTest jt = new JDBCTest();
        conn = jt.getConnection();
        if (jt.getConn())
        {
            ResultSet rs = null;
            Statement stat = null;
            try
            {
                stat = conn.createStatement();
                String sql = "select * from message order by ordertime desc";
                rs = stat.executeQuery(sql);
                while (rs.next())
                {
                    OrderForm of=new OrderForm();
                    of.setUsername(rs.getString("username"));
                    of.setCarname(rs.getString("carname"));
                    of.setNum(rs.getInt("num"));
                    of.setUnitprice(rs.getFloat("unitprice"));
                    of.setOrdertime(rs.getTimestamp("ordertime").toString());
                    of.setIspay(rs.getBoolean("ispay"));
                    mList.add(of);
                }

            } catch (SQLException e)
            {
                e.printStackTrace();
            } finally
            {
                if (rs != null)
                {
                    rs.close();
                }
                if (stat != null)
                {
                    stat.close();
                }
                if (conn != null)
                {
                    conn.close();
                }
            }
        }
        return mList;
    }

    public boolean addOrderForm(String username, String carname,int num,float unitprice,boolean ispay) throws SQLException
    {
        Connection conn;
        JDBCTest jt = new JDBCTest();
        conn = jt.getConnection();
        PreparedStatement ps = null;
        String sql = "INSERT INTO `orderform`(`username`, `carname`, `num`, `unitprice`, `ordertime`, `ispay`) " +
                "VALUES (?,?,?,?,?,?)";
        try
        {
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, carname);
            ps.setInt(3,num);
            ps.setFloat(4,unitprice);
            ps.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            ps.setBoolean(6,ispay);
            return true;
        } catch (SQLException e)
        {
            e.printStackTrace();
        } finally
        {
            if (ps != null)
            {
                ps.close();
            }
            if (conn != null)
            {
                conn.close();
            }
        }
        return false;
    }

    public boolean updateOrderForm(String username, String carname,int num,float unitprice,boolean ispay) throws SQLException
    {
        Connection conn;
        JDBCTest jt = new JDBCTest();
        conn = jt.getConnection();
        PreparedStatement ps = null;
        String sql = "UPDATE `orderform` SET `num`=?,`unitprice`=?,`ispay`=? WHERE username=? and carname=?";
        try
        {
            ps = conn.prepareStatement(sql);
            ps.setInt(1,num);
            ps.setFloat(2,unitprice);
            ps.setBoolean(3,ispay);
            ps.setString(4, username);
            ps.setString(5, carname);
            ps.executeUpdate();
            return true;
        } catch (SQLException e)
        {
            e.printStackTrace();
        } finally
        {
            if (ps != null)
            {
                ps.close();
            }
            if (conn != null)
            {
                conn.close();
            }
        }
        return false;
    }

    public boolean deleteOrderForm(String username, String carname) throws SQLException
    {
        Connection conn;
        JDBCTest jt = new JDBCTest();
        conn = jt.getConnection();
        PreparedStatement ps = null;
        try
        {
            ps = conn.prepareStatement("DELETE FROM orderform WHERE username = ? and carname=?");
            ps.setString(1, username);
            ps.setString(2,carname);
            ps.executeUpdate();
            return true;
        } catch (SQLException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally
        {
            if (ps != null)
            {
                ps.close();
            }
            if (conn != null)
            {
                conn.close();
            }
            return false;
        }
    }
}
