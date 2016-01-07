package com.codey.control;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Mr.Codey on 2016/1/5.
 */
public class CheckCookies
{
    private static final CheckCookies cc = new CheckCookies();
    public static CheckCookies getInstance()
    {
        return cc;
    }
    public int checkCookies(HttpServletRequest request)
    {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie cookie = cookies[i];
                if (cookie.getName().equals("roleCookie")) {
                    return Integer.parseInt(cookie.getValue());
                }
            }
        }
        else
        {
            return 0;
        }
        return 0;
    }
    public void deleteCookie(HttpServletRequest request, HttpServletResponse response)
    {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie cookie = cookies[i];
                if (cookie.getName().equals("roleCookie")) {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
            }
        }
    }
}
