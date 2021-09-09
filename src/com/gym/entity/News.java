package com.gym.entity;

import java.util.Date;

public class News 
{
	private int id;  //主键
	
	private String title; //新闻标 题
	
	private String content;  //新闻内容
	
	private Date time;  //发布时间

	public News() 
	{
		super();
	}

	public News(int id, String title, String content, Date time) 
	{
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.time = time;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

}
