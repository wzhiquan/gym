package com.gym.teacther.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.gym.entity.Teacher;

@Component
public class TeacherDao 
{
	@Resource
	private SessionFactory sessionFactory;

	// 教练登录
	public Teacher login(Teacher teacher) 
	{
		String hql = "from Teacher where tel = ? and password = ?";
		Teacher existTeacher = (Teacher) sessionFactory.getCurrentSession()
				.createQuery(hql).setParameter(0, teacher.getTel())
				.setParameter(1, teacher.getPassword()).uniqueResult();
		return existTeacher;
	}

	// 添加一个教练
	public void add(Teacher teacher) 
	{
		sessionFactory.getCurrentSession().save(teacher);
	}

	// 更新教练信息
	public void update(Teacher teacher) 
	{
		sessionFactory.getCurrentSession().update(teacher);
	}

	// 通过id查询教练
	public Teacher findById(int id) 
	{
		String hql = "from Teacher where id = ?";
		Teacher teacher = (Teacher) sessionFactory.getCurrentSession()
				.createQuery(hql).setParameter(0, id).uniqueResult();
		return teacher;
	}

	// 查询全部教练
	public List<Teacher> findAll() 
	{
		String hql = "from Teacher ";
		List<Teacher> list = sessionFactory.getCurrentSession()
				.createQuery(hql).list();
		return list;
	}

	// 删除一个教练
	public void delete(Teacher teacher) 
	{
		sessionFactory.getCurrentSession().delete(teacher);
	}

	// 返回总记录数
	public long count() 
	{
		String hql = "select count(*) from Teacher u";
		long count = (Long) sessionFactory.getCurrentSession().createQuery(hql)
				.uniqueResult();
		return count;
	}

	// 提升为管理员
	public void toAdmin(int id) 
	{
		String hql = "update Teacher set type = 1 where id = ?";
		sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, id)
				.executeUpdate();
	}

	// 恢复为普通教练
	public void toTeacher(int id) 
	{
		String hql = "update Teacher set type = 0 where id = ?";
		sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, id)
				.executeUpdate();
	}
}
