package com.codey.servlet;

import com.codey.dao.NewsDao;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Mr.Codey on 2016/1/7.
 */
public class UpdateNews extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        String imgpath=req.getParameter("imgpath");
        String content=req.getParameter("content");
        if (id>0&&!(title.equals("")&&imgpath.equals("")&&content.equals("")))
        {
            NewsDao nd=new NewsDao();
            try
            {
                if (nd.updateNews(id,title,imgpath,content))
                {
                    resp.sendRedirect("newinfo.jsp?ok=1");
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
            resp.sendRedirect("newinfo.jsp?ok=0");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doGet(req, resp);
    }
}
