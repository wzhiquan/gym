package com.gym.entity;

import java.util.HashSet;
import java.util.Set;

public class Teacher {
	private int id;
	private String name;// 教练姓名
	private long tel;// 教练联系电话
	private String idcard;// 教练身份证
	private String password;// 登录密码
	private int type;// 教练类型： 0：普通教练 1 ：具有管理员权限
	// 教授的课程
	private Set<Course> Course = new HashSet<Course>();

	public Teacher() {
		super();
	}

	public Teacher(int id, String name, long tel, String idcard,
			String password, int type, Set<com.gym.entity.Course> course) {
		super();
		this.id = id;
		this.name = name;
		this.tel = tel;
		this.idcard = idcard;
		this.password = password;
		this.type = type;
		Course = course;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getTel() {
		return tel;
	}

	public void setTel(long tel) {
		this.tel = tel;
	}

	public Set<Course> getCourse() {
		return Course;
	}

	public void setCourse(Set<Course> course) {
		Course = course;
	}

}
