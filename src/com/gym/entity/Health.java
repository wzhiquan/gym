package com.gym.entity;

public class Health 
{
	/**
	 * 流水ID
	 */
	private String oid;

	/**
	 * 用户名
	 */
	private String userid;
	
	/**
	 * 用户名
	 */
	private String username;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * 体重
	 */
	private String weight;
	
	/**
	 * 脂肪量
	 */
	private String fat;
	
	/**
	 * 肌肉量
	 */
	private String muscle;
	
	/**
	 * 水分量
	 */
	private String water;
	
	/**
	 * 备注
	 */
	private String remark;
	
	/**
	 * 创建时间
	 */
	private String createtime;
	
	public Health()
	{
		super();
	}
	
	public Health(String oid, String userid, String weight, String fat, String muscle, String water, String remark, String createtime)
	{
		super();
		this.oid = oid;
		this.userid = userid;
		this.weight = weight;
		this.fat = fat;
		this.muscle = muscle;
		this.water = water;
		this.remark = remark;
		this.createtime = createtime;
	}
	
	public String getOid() 
	{
		return oid;
	}

	public void setOid(String oid) 
	{
		this.oid = oid;
	}

	public String getUserid()
	{
		return userid;
	}

	public void setUserid(String userid) 
	{
		this.userid = userid;
	}

	public String getWeight() 
	{
		return weight;
	}

	public void setWeight(String weight) 
	{
		this.weight = weight;
	}

	public String getFat() 
	{
		return fat;
	}

	public void setFat(String fat) 
	{
		this.fat = fat;
	}

	public String getMuscle() 
	{
		return muscle;
	}

	public void setMuscle(String muscle) 
	{
		this.muscle = muscle;
	}

	public String getWater() 
	{
		return water;
	}

	public void setWater(String water) 
	{
		this.water = water;
	}

	public String getCreatetime()
	{
		return createtime;
	}

	public void setCreatetime(String createtime) 
	{
		this.createtime = createtime;
	}

	public String getRemark() 
	{
		return remark;
	}

	public void setRemark(String remark) 
	{
		this.remark = remark;
	}
}
