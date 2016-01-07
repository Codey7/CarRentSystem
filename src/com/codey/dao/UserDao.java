package com.codey.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.codey.bean.UserInfo;
import com.codey.jdbc.JDBCConn;
import com.codey.jdbc.JDBCTest;

public class UserDao {
	public UserInfo loginUser(String username,String password)
	{
		UserInfo ui=null;
		/*JDBCConn.getInstance();
		Connection conn=JDBCConn.
				getConnection();*/
        Connection conn;
        JDBCTest jt=new JDBCTest();
        conn=jt.getConnection();
		if(jt.getConn())
		{
			try {
				PreparedStatement ps=conn.prepareStatement("select * from userinfo where username=? and password=?");
				ps.setString(1, username);
				ps.setString(2, password);
				ResultSet rs=null;
				rs=ps.executeQuery();
				while(rs.next())
				{

					//System.out.println(rs.getString("username"));
					ui=new UserInfo();
					ui.setUsername(rs.getString("username"));
					ui.setPassword(password);
					ui.setRolename(rs.getString("roalName"));
					ui.setMoney(10000);
				}
				rs.close();
				ps.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


		}
		return ui;
	}




	public boolean signIn(String username ,String password,String role)
	{

		if(loginUser(username, password)!=null)
		{
			return false;
		}
		else
		{

			/*JDBCConn.getInstance();
			Connection conn=JDBCConn.
					getConnection();*/
            Connection conn;
            JDBCTest jt=new JDBCTest();
            conn=jt.getConnection();
			PreparedStatement ps;
			try {
				ps = conn.prepareStatement("insert into userinfo(username,password,roalName,money,regtime) values(?,?,?,'100',?)");
				ps.setString(1, username);
				ps.setString(2, password);
                ps.setString(3,role);
				ps.setTimestamp(4,new Timestamp(System.currentTimeMillis()));
				ps.executeUpdate();
				ps.close();
				conn.close();
                return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
        return false;
	}
	public ArrayList<UserInfo> getuser()
	{
		ArrayList<UserInfo> mList=new ArrayList<>();
		/*JDBCConn.getInstance();
		Connection conn=JDBCConn.
				getConnection();*/
        Connection conn;
        JDBCTest jt=new JDBCTest();
        conn=jt.getConnection();
		if(jt.getConn())
		{
			try {
				Statement sta=conn.createStatement();
				String sql="select * from userinfo ORDER BY regtime DESC ";
				ResultSet rs=null;
				rs=sta.executeQuery(sql);
				while(rs.next())
				{
					UserInfo ui=null;
					//System.out.println(rs.getString("username"));
					ui=new UserInfo();
					ui.setUsername(rs.getString("username"));
					ui.setRegtime(rs.getTimestamp("regtime").toString());
                    ui.setRolename(rs.getString("roalName"));
					ui.setMoney(Float.parseFloat(rs.getString("money")));
                    mList.add(ui);
				}
				rs.close();
                sta.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


		}
		return mList;
	}

    public boolean update(String username,String roalname,String money)
    {
        /*JDBCConn.getInstance();
        Connection conn=JDBCConn.
                getConnection();*/
        Connection conn;
        JDBCTest jt=new JDBCTest();
        conn=jt.getConnection();
        PreparedStatement ps;
        try {
            ps = conn.prepareStatement("UPDATE car_shop.userinfo SET money = ?,roalName=? WHERE userinfo.username = ?");
            ps.setString(1, username);
            ps.setString(2, money);
            ps.setString(3,roalname);
            ps.executeUpdate();
            ps.close();
            conn.close();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return false;
    }
    public boolean delete(String username)
    {
        /*JDBCConn.getInstance();
        Connection conn=JDBCConn.
                getConnection();*/
        Connection conn;
        JDBCTest jt=new JDBCTest();
        conn=jt.getConnection();
        PreparedStatement ps;
        try {
            ps = conn.prepareStatement("DELETE FROM userinfo WHERE username = ?");
            ps.setString(1, username);
            ps.executeUpdate();
            ps.close();
            conn.close();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }
}
