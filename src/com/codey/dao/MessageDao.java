package com.codey.dao;

import com.codey.bean.Message;
import com.codey.jdbc.JDBCTest;

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
public class MessageDao
{
    public ArrayList<Message> queryMessage() throws SQLException
    {
        ArrayList<Message> mList = new ArrayList<>();
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
                String sql = "select * from message order by pubtime desc";
                rs = stat.executeQuery(sql);
                while (rs.next())
                {
                    Message msg = new Message();
                    msg.setUsername(rs.getString("username"));
                    msg.setContent(rs.getString("content"));
                    msg.setTime(rs.getTimestamp("pubtime").toString());
                    mList.add(msg);
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

    public boolean addMessage(String username, String content) throws SQLException
    {
        Connection conn;
        JDBCTest jt = new JDBCTest();
        conn = jt.getConnection();
        PreparedStatement ps = null;
        String sql = "INSERT INTO message(username, content,pubtime) VALUES (?,?,?)";
        try
        {
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, content);
            ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
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

    public boolean updateMessage(String username, String pubtime, String content) throws SQLException
    {
        Connection conn;
        JDBCTest jt = new JDBCTest();
        conn = jt.getConnection();
        PreparedStatement ps = null;
        String sql = "UPDATE message SET `content`=? WHERE username=? and pubtime=?";
        try
        {
            ps = conn.prepareStatement(sql);
            ps.setString(1, content);
            ps.setString(2, username);
            ps.setTimestamp(3, new Timestamp(Long.parseLong(pubtime)));
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

    public boolean deletemessage(String username, String pubtime) throws SQLException
    {
        Connection conn;
        JDBCTest jt = new JDBCTest();
        conn = jt.getConnection();
        PreparedStatement ps = null;
        try
        {
            ps = conn.prepareStatement("DELETE FROM news WHERE username = ? and pubtime=?");
            ps.setString(1, username);
            ps.setTimestamp(2, new Timestamp(Long.parseLong(pubtime)));
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
