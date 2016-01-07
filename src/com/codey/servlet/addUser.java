package com.codey.servlet;

import com.codey.dao.UserDao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Mr.Codey on 2016/1/6.
 */
public class addUser extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String username=req.getParameter("username");
        String pwd=req.getParameter("pwd");
        String role=req.getParameter("role");
        if (!(username.equals("")&&pwd.equals("")&&role.equals("")))
        {
            UserDao us=new UserDao();
            //System.out.println(role);
            if (us.signIn(username,pwd,role))
            {
                //req.setAttribute("ok","1");
                //req.getRequestDispatcher("userinfo.jsp").forward(req,resp);
                resp.sendRedirect("userinfo.jsp?ok=1");
            }
            else {
                req.setAttribute("ok","0");
                System.out.println("添加失败！");
            }
        }
        else
        {
            req.getRequestDispatcher("page_500.html").forward(req,resp);
        }
    }
}
