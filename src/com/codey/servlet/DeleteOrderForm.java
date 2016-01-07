package com.codey.servlet;

import com.codey.dao.OrderFormDao;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Mr.Codey on 2016/1/7.
 */
public class DeleteOrderForm extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String username=req.getParameter("username");
        String carname=req.getParameter("carname");
        //String ispay=req.getParameter("ispay");
        if (!(username.equals("")&&carname.equals("")))
        {
            OrderFormDao ofd=new OrderFormDao();
            try
            {
                if (ofd.deleteOrderForm(username,carname))
                {
                    resp.sendRedirect("orderinfo.jsp?ok=1");
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
            resp.sendRedirect("orderinfo.jsp?ok=0");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doGet(req,resp);
    }
}
