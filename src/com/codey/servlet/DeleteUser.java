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
public class DeleteUser extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String username=req.getParameter("username");
        if (!(username.equals("")))
        {
            UserDao us=new UserDao();
            System.out.println(username);
            if (us.delete(username))
            {
                req.setAttribute("ok","1");
                //req.getRequestDispatcher("userinfo.jsp").forward(req,resp);
                resp.sendRedirect("userinfo.jsp");
            }
            else {
                req.setAttribute("ok","0");
                System.out.println("删除失败！");
            }
        }
        else
        {
            req.getRequestDispatcher("page_500.html").forward(req,resp);
        }
    }
}
