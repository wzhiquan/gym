package com.gym.user.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.gym.entity.Course;
import com.gym.entity.User;

@Component
public class UserDao 
{
	@Resource
	private SessionFactory sessionFactory;

	// 会员登录
	public User login(User user) 
	{
		String hql = "from User where tel = ? and password = ?";
		User existuser = (User) sessionFactory.getCurrentSession()
				.createQuery(hql).setParameter(0, user.getTel())
				.setParameter(1, user.getPassword()).uniqueResult();
		System.out.println(existuser);
		System.out.println("=======");
		return existuser;
	}

	// 更新信息
	public void update(User user) 
	{
		sessionFactory.getCurrentSession().update(user);
	}

	// 用户注册
	public void add(User user) 
	{
		sessionFactory.getCurrentSession().save(user);
	}

	// 删除
	public void deltete(User user) 
	{
		sessionFactory.getCurrentSession().delete(user);
	}

	// 用户列表展示
	public List<User> findAll() 
	{
		String hql = "from User";
		return sessionFactory.getCurrentSession().createQuery(hql).list();
	}

	// 返回总记录数
	public long count() 
	{
		String hql = "select count(*) from User u";
		long count = (Long) sessionFactory.getCurrentSession().createQuery(hql)
				.uniqueResult();
		return count;
	}

	//
	public User findById(int id) 
	{
		User user = (User) sessionFactory.getCurrentSession().get(User.class,
				id);
		return user;
	}

	public int findTimes(int uid, int cid) 
	{
		String sql = "select times from relation where uid = ? and cid = ?";
		int times = (Integer) sessionFactory.getCurrentSession()
				.createSQLQuery(sql).setParameter(0, uid).setParameter(1, cid)
				.uniqueResult();
		return times;
	}

	/**
	 * 查询当前会员所选课程
	 * @param userid
	 * @return clist
	 */

	public List<Course> findCourse(int id) 
	{
		String sql = "SELECT * from course where id in(select cid from relation where uid = ?) ";
		List<Course>  clist = sessionFactory.getCurrentSession().createSQLQuery(sql).setParameter(0, id).list();
		return clist;
	}
	
	/**
	 * 查询当前会员所选课时
	 * @param userid
	 * @return times
	 */
	public List findTimes(int id) 
	{
		String sql = "SELECT * from relation where uid = ?";
		List  times = sessionFactory.getCurrentSession().createSQLQuery(sql).setParameter(0, id).list();
		return times;
	}
}
