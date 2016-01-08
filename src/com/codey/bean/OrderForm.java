package com.codey.bean;

/**
 * Created by Mr.Codey on 2016/1/7.
 */
public class OrderForm
{
    private String username;
    private String carname;
    private int num;
    private float unitprice;
    private String ordertime;
    private boolean ispay;

    public String pay(boolean ispay)
    {
        if (ispay)
        {
            return "已支付";
        }
        else
        {
            return "未支付";
        }
    }
    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getCarname()
    {
        return carname;
    }

    public void setCarname(String carname)
    {
        this.carname = carname;
    }

    public int getNum()
    {
        return num;
    }

    public void setNum(int num)
    {
        this.num = num;
    }

    public float getUnitprice()
    {
        return unitprice;
    }

    public void setUnitprice(float unitprice)
    {
        this.unitprice = unitprice;
    }

    public String getOrdertime()
    {
        return ordertime;
    }

    public void setOrdertime(String ordertime)
    {
        this.ordertime = ordertime;
    }

    public boolean ispay()
    {
        return ispay;
    }

    public void setIspay(boolean ispay)
    {
        this.ispay = ispay;
    }
}
