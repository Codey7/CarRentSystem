package com.codey.dao;

import com.codey.bean.News;
import com.codey.jdbc.JDBCConn;
import com.codey.jdbc.JDBCTest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 * Created by Mr.Codey on 2016/1/5.
 */
public class NewsDao
{
    public ArrayList<News> queryBannerNews()
    {
        ArrayList<News> mList = new ArrayList<>();
        Connection conn = JDBCConn.getConnection();
        if (JDBCConn.getInstance().getConn())
        {
            try
            {
                Statement stat = conn.createStatement();
                String sql = "select * from news order by news.publishTime desc limit 3";
                ResultSet rs = stat.executeQuery(sql);
                addToList(mList, rs);
            } catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
        return mList;
    }

    public ArrayList<News> queryNews()
    {
        ArrayList<News> mList = new ArrayList<>();
        Connection conn;
        JDBCTest jt = new JDBCTest();
        conn = jt.getConnection();
        if (jt.getConn())
        {
            try
            {
                Statement stat = conn.createStatement();
                String sql = "select * from news order by news.publishTime desc limit 10";
                ResultSet rs = stat.executeQuery(sql);
                addToList(mList, rs);
            } catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
        return mList;
    }

    private void addToList(ArrayList<News> mList, ResultSet rs) throws SQLException
    {
        while (rs.next())
        {
            News news = new News();
            news.setTitle(rs.getString("title"));
            news.setUrl(rs.getString("url"));
            news.setContent(rs.getString("content"));
            news.setPublishtime(rs.getString("publishTime"));
            mList.add(news);
        }
    }

    public boolean addNews(String title, String imgpath, String content) throws SQLException
    {
        Connection conn;
        JDBCTest jt = new JDBCTest();
        conn = jt.getConnection();
        PreparedStatement ps = null;
        String sql = "INSERT INTO news(title, url, publishTime, content) VALUES (?,?,?,?)";
        try
        {
            ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, imgpath);
            ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            ps.setString(4, content);
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

    public boolean updateNews(int id, String title, String imgpath, String content) throws SQLException
    {
        Connection conn;
        JDBCTest jt = new JDBCTest();
        conn = jt.getConnection();
        PreparedStatement ps = null;
        String sql = "UPDATE `news` SET `title`=?,`url`=?,`publishTime`=?,`content`=? WHERE id=?";
        try
        {
            ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, imgpath);
            ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            ps.setString(4, content);
            ps.setInt(5, id);
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

    public boolean deleteNew(int id) throws SQLException
    {
        Connection conn;
        JDBCTest jt = new JDBCTest();
        conn = jt.getConnection();
        PreparedStatement ps = null;
        try
        {
            ps = conn.prepareStatement("DELETE FROM news WHERE id = ?");
            ps.setInt(1, id);
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
