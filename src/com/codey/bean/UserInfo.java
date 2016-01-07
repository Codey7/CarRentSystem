package com.codey.bean;
/**
 * �û�bean
 */
public class UserInfo {
	private String username;
	private String password;
	private String rolename;
	private float money;

	public String getRegtime()
	{
		return regtime;
	}

	public void setRegtime(String regtime)
	{
		this.regtime = regtime;
	}

	private String regtime;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public float getMoney() {
		return money;
	}
	public void setMoney(float money) {
		this.money = money;
	}
	
}
