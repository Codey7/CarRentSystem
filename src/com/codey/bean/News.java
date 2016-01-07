package com.codey.bean;

/**
 * Created by Mr.Codey on 2016/1/5.
 */
public class News
{
    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    private int id;
    private String title;

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getUrl()
    {
        return url;
    }

    public void setUrl(String url)
    {
        this.url = url;
    }

    public String getPublishtime()
    {
        return publishtime;
    }

    public void setPublishtime(String publishtime)
    {
        this.publishtime = publishtime;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
    }

    private String url;
    private String publishtime;
    private String content;

}
