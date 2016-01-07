package com.codey.bean;

/**
 * Created by Mr.Codey on 2016/1/5.
 */
public class CarInfo
{
    private String carname;
    private String carintro;



    public String getImgpath()
    {
        return imgpath;
    }

    public void setImgpath(String imgpath)
    {
        this.imgpath = imgpath;
    }

    public String getCarintro()
    {
        return carintro;
    }

    public void setCarintro(String carintro)
    {
        this.carintro = carintro;
    }

    public String getCarname()
    {
        return carname;
    }

    public void setCarname(String carname)
    {
        this.carname = carname;
    }

    public float getCarprize()
    {
        return carprize;
    }

    public void setCarprize(float carprize)
    {
        this.carprize = carprize;
    }

    private float carprize;
    private String imgpath;
    private int carNum;

    public int getCarNum()
    {
        return carNum;
    }

    public void setCarNum(int carNum)
    {
        this.carNum = carNum;
    }
}
