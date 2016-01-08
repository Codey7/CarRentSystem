package com.codey.dao;

import com.codey.bean.CarInfo;
import com.codey.bean.News;
import com.codey.jdbc.JDBCConn;
import com.codey.jdbc.JDBCTest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by Mr.Codey on 2016/1/5.
 */
public class CarDao
{

    public CarInfo querycarByName(String carname)
    {
        Connection conn;
        JDBCTest jt = new JDBCTest();
        conn = jt.getConnection();
        PreparedStatement ps = null;

        CarInfo ci=null;
        if (jt.getConn())
        {
            try
            {
                String sql = "select * from carinfo where carname=?";
                ps=conn.prepareStatement(sql);
                ps.setString(1,carname);
                ResultSet rs = ps.executeQuery(sql);
                while (rs.next())
                {
                    ci = new CarInfo();
                    ci.setCarname(rs.getString("carname"));
                    ci.setCarintro(rs.getString("carinfo"));
                    ci.setCarprize(rs.getFloat("carprice"));
                    ci.setImgpath(rs.getString("imagepath"));
                    ci.setCarNum(rs.getInt("carnum"));
                }
                rs.close();
                ps.close();
                conn.close();
            } catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
        return ci;
    }
    public ArrayList<CarInfo> querycarInfo()
    {
        ArrayList<CarInfo> mList = new ArrayList<>();
        Connection conn;
        JDBCTest jt = new JDBCTest();
        conn = jt.getConnection();
        if (jt.getConn())
        {
            try
            {
                Statement stat = conn.createStatement();
                String sql = "select * from carinfo";
                ResultSet rs = stat.executeQuery(sql);
                int i = 0;
                while (rs.next())
                {
                    i++;
                    CarInfo ci = new CarInfo();
                    ci.setCarname(rs.getString("carname"));
                    ci.setCarintro(rs.getString("carinfo"));
                    ci.setCarprize(rs.getFloat("carprice"));
                    ci.setImgpath(rs.getString("imagepath"));
                    ci.setCarNum(rs.getInt("carnum"));
                    mList.add(ci);
                }
                rs.close();
                stat.close();
                conn.close();
            } catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
        return mList;
    }

    public boolean addCar(String carname, String carinfo, float carprice, String imgpath, int num) throws SQLException
    {
        Connection conn;
        JDBCTest jt = new JDBCTest();
        conn = jt.getConnection();
        PreparedStatement ps = null;
        String sql = "INSERT INTO carinfo(imagepath, carname, carinfo, carprice, rentby, carnum) VALUES (?,?,?,?,'无',?)";
        try
        {
            ps = conn.prepareStatement(sql);
            ps.setString(1, imgpath);
            ps.setString(2, carname);
            ps.setString(3, carinfo);
            ps.setFloat(4, carprice);
            ps.setInt(5, num);
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

    public boolean updateCar(String imgpath, String carinfo, float carprice, int carnum, String carname) throws SQLException
    {
        Connection conn;
        JDBCTest jt = new JDBCTest();
        conn = jt.getConnection();
        PreparedStatement ps = null;
        String sql = "UPDATE carinfo SET imagepath=?,carinfo=?,carprice=?,carnum=? WHERE carname = ?";
        try
        {
            ps = conn.prepareStatement(sql);
            ps.setString(1, imgpath);
            ps.setString(2, carinfo);
            ps.setFloat(3, carprice);
            ps.setInt(4, carnum);
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

    public boolean deleteCar(String carname) throws SQLException
    {
        Connection conn;
        JDBCTest jt = new JDBCTest();
        conn = jt.getConnection();
        PreparedStatement ps = null;
        try
        {
            ps = conn.prepareStatement("DELETE FROM carinfo WHERE carname = ?");
            ps.setString(1, carname);
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
