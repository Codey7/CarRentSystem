package com.codey.servlet;

import com.codey.dao.CarDao;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Mr.Codey on 2016/1/7.
 */
public class DeleteCar extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String carname=req.getParameter("carname");

        if (!(carname.equals("")))
        {
            CarDao cd=new CarDao();
            try
            {
                if (cd.deleteCar(carname))
                {
                    resp.sendRedirect("carinfo.jsp?ok=1");
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
            resp.sendRedirect("carinfo.jsp?ok=0");
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doGet(req,resp);
    }
}
