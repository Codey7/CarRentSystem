package com.codey.servlet;

import com.codey.dao.MessageDao;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Mr.Codey on 2016/1/7.
 */
public class DeleteMessage extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String username= req.getParameter("username");
        String pubtime=req.getParameter("pubtime");
        if (!(username.equals("")&&pubtime.equals("")))
        {
            MessageDao md=new MessageDao();
            try
            {
                if (md.deletemessage(username,pubtime))
                {
                    resp.sendRedirect("leaveinfo.jsp?ok=1");
                }
                else {
                    System.out.println("删除失败！");
                }
            } catch (SQLException e)
            {
                e.printStackTrace();
            }
        }
        else
        {
            resp.sendRedirect("leaveinfo.jsp?ok=0");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doGet(req, resp);
    }
}
