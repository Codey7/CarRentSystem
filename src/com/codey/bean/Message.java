package com.codey.bean;

/**
 * Created by Mr.Codey on 2016/1/7.
 */
public class Message
{
    private String username;

    public String getTime()
    {
        return time;
    }

    public void setTime(String time)
    {
        this.time = time;
    }

    public String getUsername()
    {
        return this.username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
    }

    private String time;
    private String content;
}
