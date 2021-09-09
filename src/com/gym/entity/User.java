package com.gym.entity;

import java.util.HashSet;
import java.util.Set;

public class User {

	private int id;
	private String username;// 用户名
	private String name; // 真实姓名
	private String password;// 登录密码
	private long tel;// 电话号码
	private String idcard;// 身份证

	private Set<Course> course = new HashSet<Course>();

	public User() {
		super();
	}

	public User(int id, String username, String name, String password,
			long tel, String idcard, Set<Course> course) {
		super();
		this.id = id;
		this.username = username;
		this.name = name;
		this.password = password;
		this.tel = tel;
		this.idcard = idcard;
		this.course = course;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public long getTel() {
		return tel;
	}

	public void setTel(long tel) {
		this.tel = tel;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public Set<Course> getCourse() {
		return course;
	}

	public void setCourse(Set<Course> course) {
		this.course = course;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", name=" + name + ", password=" + password + ", tel="
				+ tel + ", idcard=" + idcard + ", course=" + course + "]";
	}

}
