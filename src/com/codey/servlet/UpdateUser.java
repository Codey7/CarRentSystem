package com.codey.servlet;

import com.codey.dao.UserDao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Mr.Codey on 2016/1/7.
 */
public class UpdateUser extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String username=req.getParameter("username");
        String role=req.getParameter("role");
        String money=req.getParameter("money");
        if (!(username.equals("")&&role.equals("")&&money.equals("")))
        {
            UserDao us=new UserDao();
            System.out.println(username);
            if (us.update(username,role,money))
            {
                req.setAttribute("ok","1");
                //req.getRequestDispatcher("userinfo.jsp").forward(req,resp);
                resp.sendRedirect("userinfo.jsp?ok=1");
            }
            else {
                req.setAttribute("ok","0");
                System.out.println("更新失败！");
            }
        }
        else
        {
            req.getRequestDispatcher("../page_500.html").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doGet(req,resp);
    }
}
