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
public class AddOrderForm extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String username=req.getParameter("username");
        String carname=req.getParameter("carname");
        int num=Integer.parseInt(req.getParameter("num"));
        float unitprice=Float.parseFloat(req.getParameter("unitprice"));
        //String ispay=req.getParameter("ispay");
        if (!(username.equals("")&&carname.equals(""))&&num>0&&unitprice>0)
        {
            OrderFormDao ofd=new OrderFormDao();
            try
            {
                if (ofd.addOrderForm(username,carname,num,unitprice,false))
                {
                    resp.sendRedirect("orderinfo.jsp?ok=1");
                }
                else {
                    System.out.println("添加失败！");
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
