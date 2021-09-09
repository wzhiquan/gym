package com.gym.course.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.gym.course.dao.CourseDao;
import com.gym.entity.Course;
import com.gym.entity.Teacher;
import com.gym.entity.User;
import com.gym.teacther.dao.TeacherDao;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component(value = "courseAction")
public class CourseAction extends ActionSupport implements ModelDriven<Course> 
{
	private Course course = new Course();

	public Course getModel() 
	{
		return course;
	}

	@Resource
	private CourseDao courseDao;

	@Resource
	private TeacherDao teacherDao;

	// 跳转到添加页面
	public String toAdd() 
	{
		ActionContext.getContext().getContextMap()
				.put("list", teacherDao.findAll());
		return "toAdd";
	}

	// 添加一门课程
	public String add() 
	{
		courseDao.add(course);
		Teacher teacher = (Teacher) ActionContext.getContext().getSession()
				.get("existTeacher");
		if (teacher.getType() == 1) 
		{ // 如果为管理员，添加成功后查询所有课程
			return "tolist";
		} 
		else 
		{
			return "findMyCourse"; // 如果为普通教练只查询自己的课程
		}
	}

	// 教练查看自己的课程
	public String findMyCourse() 
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		Teacher teacher = (Teacher) session.getAttribute("existTeacher");
		List<Course> list = courseDao.findByTid(teacher.getId());
	    if(list.size()>0)
	    {
			ActionContext.getContext().getContextMap().put("list", list);
			ActionContext.getContext().getContextMap().put("count", list.size());
			return "list";
		}
	    else 
	    {
			return "noCourse";
		}
	}

	// 通过id删除一门课程
	public String delete() 
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		
		Course course = courseDao.findById(Integer.parseInt(id));
		courseDao.delete(course);
		
		Teacher teacher = (Teacher) ActionContext.getContext().getSession().get("existTeacher");
		
		if (teacher.getType() == 1) 
		{ 
			// 如果为管理员，添加成功后查询所有课程
			return "tolist";
		} 
		else
		{
			return "findMyCourse"; // 如果为普通教练只查询自己的课程
		}
	}

	// 更新一门课程
	public String update() 
	{
		courseDao.update(course);
		Teacher teacher = (Teacher) ActionContext.getContext().getSession().get("existTeacher");
		if (teacher.getType() == 1) 
		{ 
			// 如果为管理员，添加成功后查询所有课程
			return "tolist";
		} 
		else 
		{
			return "findMyCourse"; // 如果为普通教练只查询自己的课程
		}
	}

	// 查询全部课程
	public String findAll() 
	{
		List<Course> list = courseDao.findAll();
		ActionContext.getContext().getContextMap().put("list", list);
		// 课程数量
		int count = list.size();
		ActionContext.getContext().getContextMap().put("count", count);
		return "list";
	}

	// 通过Tid查询指定教练的课程
	public String findByTid()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String tid = request.getParameter("tid");

		List<Course> list = courseDao.findByTid(Integer.parseInt(tid));

		ActionContext.getContext().getContextMap().put("count", list.size());
		ActionContext.getContext().getContextMap().put("list", list);
		return "list";
	}

	// 跳转到编辑页面
	public String edit() 
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		Course course = courseDao.findById(Integer.parseInt(id));
		// 查询所有教练
		List<Teacher> tlist = teacherDao.findAll();
		ActionContext.getContext().getContextMap().put("tlist", tlist);
		ActionContext.getContext().getContextMap().put("course", course);
		return "toEdit";

	}

	// 用户查询所有课程
	public String courseList() 
	{
		List<Course> list = courseDao.findAll();
		ActionContext.getContext().getContextMap().put("list", list);
		System.out.println("用户查看课程" + list.size());
		// 课程数量
		int count = list.size();
		ActionContext.getContext().getContextMap().put("count", count);
		return "courseList";
	}

	// 用户报班
	public String into() 
	{
		HttpServletRequest request = ServletActionContext.getRequest();

		//首先判断是否为登录状态
		String Cid = request.getParameter("cid");
		User user = (User)request.getSession().getAttribute("existUser");
		
		if (user == null)
		{
			request.setAttribute("msg", "请登录");
			return "login";
		}
		
		String Keshi = request.getParameter("keshi");
		int cid = Integer.parseInt(Cid);
		int uid = user.getId();
		int keshi = Integer.parseInt(Keshi);

		System.out.println("添加到课程" + cid + "===" + uid);
		courseDao.into(cid, uid,keshi);
		return "index";
	}

	/**
	 * 管理员更改用户课时
	 */
	public void changeTimes() 
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		// 主键ID
		String id = request.getParameter("id");
		// 课程ID
		String cid = request.getParameter("cid");
		// 会员ID
		String uid = request.getParameter("uid");
		// 课时数
		String times = request.getParameter("times");
		
		courseDao.changeTime(Integer.parseInt(id),Integer.parseInt(cid), Integer.parseInt(uid), Integer.parseInt(times));
	}
	
	// 教练更改用户课时
	public void changeTimesByTeacher()
	{
		System.out.println("========================更改了课时");
		HttpServletRequest request = ServletActionContext.getRequest();
		String uid = request.getParameter("uid");
		String cid = request.getParameter("cid");
		courseDao.changeTimesByTeacher(Integer.parseInt(uid), Integer.parseInt(cid));
	    //写操作日志
		System.out.println("=========写日志操作");
		Teacher teacher = (Teacher) ActionContext.getContext().getSession()
				.get("existTeacher");
		System.out.println("教练姓名"+teacher.getName());
		courseDao.writeLog(Integer.parseInt(uid), Integer.parseInt(cid), teacher.getId());
	}
	// 查看该课程下的用户
	public String findUser() 
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		System.out.println(id);
		Course course = courseDao.findUser(Integer.parseInt(id));

		request.setAttribute("course", course);
		System.out.println(course.getUser());
		return "findUser";
	}

	// 教练查看该课程下的用户
	public String findUserByCourse() 
	{
		HttpServletRequest request = ServletActionContext.getRequest();

		String id = request.getParameter("id");

		System.out.println(id);

		//查询该课程下所有用户
		Course course = courseDao.findUser(Integer.parseInt(id));
        
		request.setAttribute("course", course);

		//查询该课程所有时间
		List times = courseDao.findTimeByCid(Integer.parseInt(id));
		System.out.println("time的长度"+times.size());
		request.setAttribute("times", times);

		return "findUserByCourse";
	}
	
	//用户查看某一门课程的日志
	public String findCourselogs()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = (User) request.getSession().getAttribute("existUser");
		String cid = request.getParameter("cid");
	    System.out.println("查看的课程id为："+cid+"用户id为:"+user.getId());
		List loglist = courseDao.findCourselogs(user.getId(),Integer.parseInt(cid));
		System.out.println("集合长度"+loglist.size());
		
		request.setAttribute("loglist",loglist);
		return "loglist";
	}
}