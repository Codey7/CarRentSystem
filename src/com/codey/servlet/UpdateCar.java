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
public class UpdateCar extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String carname=req.getParameter("carname");
        String carinfo=req.getParameter("carinfo");
        float carprice=Float.parseFloat(req.getParameter("carprice"));
        String imgpath=req.getParameter("imgpath");
        int num=Integer.parseInt(req.getParameter("num"));
        if (!(carname.equals("")&&carinfo.equals("")&&imgpath.equals(""))&&carprice>0&&num>0)
        {
            CarDao cd=new CarDao();
            try
            {
                if (cd.updateCar(imgpath,carinfo,carprice,num,carname))
                {
                    resp.sendRedirect("carinfo.jsp?ok=1");
                }
                else {
                    System.out.println("更新失败！");
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
