package com.gym.entity;

import java.util.HashSet;
import java.util.Set;

public class Course 
{
	private int id;// 主键
	
	private String name;// 课程名称
	
	private String place;// 上课地点
	
	private String times;// 上课时间  分为上午 下午 晚上
	
	private int keshi;//课程总课时
	
	private double cost;//课程费用
	
	private String remark ;//备注
	
	private Teacher teacher;// 授课的老师
	
	private Set<User> user = new HashSet<User>();

	public Course() 
	{
		super();
	}

	public Course(int id, String name, String place, String times, int keshi, double cost, String remark, Teacher teacher, Set<User> user) 
	{
		super();
		this.id = id;
		this.name = name;
		this.place = place;
		this.times = times;
		this.keshi = keshi;
		this.cost = cost;
		this.remark = remark;
		this.teacher = teacher;
		this.user = user;
	}

	public int getKeshi() 
	{
		return keshi;
	}

	public void setKeshi(int keshi) 
	{
		this.keshi = keshi;
	}

	public double getCost() 
	{
		return cost;
	}

	public void setCost(double cost) 
	{
		this.cost = cost;
	}

	public String getRemark() 
	{
		return remark;
	}

	public void setRemark(String remark) 
	{
		this.remark = remark;
	}

	public String getTimes() 
	{
		return times;
	}

	public void setTimes(String times) 
	{
		this.times = times;
	}


	public int getId() 
	{
		return id;
	}

	public void setId(int id) 
	{
		this.id = id;
	}

	public String getName() 
	{
		return name;
	}

	public void setName(String name) 
	{
		this.name = name;
	}

	public String getPlace() 
	{
		return place;
	}


	public void setPlace(String place) 
	{
		this.place = place;
	}

	public Teacher getTeacher() 
	{
		return teacher;
	}

	public void setTeacher(Teacher teacher) 
	{
		this.teacher = teacher;
	}

	public Set<User> getUser() 
	{
		return user;
	}

	public void setUser(Set<User> user) 
	{
		this.user = user;
	}
}
