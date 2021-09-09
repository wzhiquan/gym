package com.gym.course.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.gym.entity.Course;

@Component
public class CourseDao 
{
	@Resource
	private SessionFactory sessionFactory;

	// 添加一门课程
	public void add(Course course) 
	{
		sessionFactory.getCurrentSession().save(course);
	}

	// 更新一门课程
	public void update(Course course) 
	{
		sessionFactory.getCurrentSession().update(course);
	}

	// 删除一门课程
	public void delete(Course course) 
	{
		sessionFactory.getCurrentSession().delete(course);
	}

	// 查找所有课程
	public List<Course> findAll() 
	{
		String hql = "from Course";
		List<Course> list = sessionFactory.getCurrentSession().createQuery(hql)
				.list();
		return list;
	}

	// 更具id查询
	public Course findById(int id) 
	{
		String hql = "from Course where id = ?";
		Course course = (Course) sessionFactory.getCurrentSession()
				.createQuery(hql).setParameter(0, id).uniqueResult();
		return course;
	}

	// 查看教练教授的课程
	public List<Course> findByTid(int tid) 
	{
		String hql = "from Course where tid = ?";
		return sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, tid).list();
	}

	/**
	 * 管理员更改用户课时
	 */
	public void changeTime(int id, int cid, int uid, int times) 
	{
		String sql = "update relation set times = " + times + " where id = " + id + " and cid = " + cid + " and uid = " + uid;    
		sessionFactory.getCurrentSession().createSQLQuery(sql).executeUpdate();
	}

	// 报班
	public void into(int cid, int uid, int keshi)
	{
		// 获取当前日期年月日
	    Date d = new Date();  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");  
        String dateNowStr = sdf.format(d);  
		String sql = "insert into relation(cid,uid,times,createdate) values(" + cid + ","
				+ uid + "," + keshi + "," + dateNowStr + ")";
		sessionFactory.getCurrentSession().createSQLQuery(sql).executeUpdate();
	}

	//更具课程查看用户
	public Course findUser(int id) 
	{
		return  (Course) sessionFactory.getCurrentSession().get(Course.class, id);
	}

	//通过cid查询剩余时间
	public List findTimeByCid(int cid) 
	{
		 String sql = "select * from relation where cid = "+cid;
		 List times = sessionFactory.getCurrentSession().createSQLQuery(sql).list();
		return times;
	}

	public void changeTimesByTeacher(int uid, int cid) 
	{
		System.out.println(uid+"==="+cid);
		String sql = "update relation set times =  times - 2 "+ " where uid = "+uid+" and cid = "+cid;
		sessionFactory.getCurrentSession().createSQLQuery(sql).executeUpdate();
	}
	
	//写操作日志
	public void writeLog(int user_id,int course_id,int teacher_id)
	{
		String sql = "insert into logs (user_id,course_id,teacher_id,times) values(?,?,?,?)";
		sessionFactory.getCurrentSession()
		  .createSQLQuery(sql)
		  .setParameter(0, user_id)
		  .setParameter(1, course_id)
		  .setParameter(2, teacher_id)
		  .setParameter(3, new Date()).executeUpdate();
	}

	public List findCourselogs(int uid, int cid) 
	{
//		String sql = "select teacher.name,course.name,user.name,course_record.times  "+
//							"from teacher,course,course_record,user"+
//							"where course_record.user_id = ? "+
//							"and course_record.course_id = ?"+
//							"and course_record.teacher_id = teacher.id "+
//							"and course_record.course_id = course.id and "+
//							"course_record.user_id = user.id"	;
		
//		String sql = "select c.name as course_name, t.name as teacher_name,u.name as user_name,cr.times   from teacher t,course c,course_record cr,user u where cr.user_id = ? and cr.course_id = ? and cr.teacher_id = t.id  and cr.course_id = c.id and  cr.user_id = u.id";
		
		//hibernate查询相同列名称时需要使用别名 格式如下方所示
		String sql = "select ifnull(c.name,''), ifnull(t.name,''), ifnull(u.name,''),cr.times   from teacher t,course c,logs cr,user u where cr.user_id = ? and cr.course_id = ? and cr.teacher_id = t.id  and cr.course_id = c.id and  cr.user_id = u.id";

		//		String sql = "select teacher.name,course.name,user.name,course_record.times   from teacher,course,course_record,user where course_record.user_id = ? and course_record.course_id = ? and course_record.teacher_id = teacher.id  and course_record.course_id = course.id and  course_record.user_id = user.id";

		//		String sql = "select * from logs where user_id = ? and course_id = ?";
		List loglist = sessionFactory.getCurrentSession()
		  .createSQLQuery(sql)
		  .setParameter(0, uid)
		  .setParameter(1, cid)
		  .list();
		return loglist;
	}
}
