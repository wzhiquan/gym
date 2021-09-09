package com.gym.user.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.gym.entity.Course;
import com.gym.entity.User;
import com.gym.user.dao.UserDao;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component(value = "userAction")
public class UserAction extends ActionSupport 
{
	private User user;

	public void setUser(User user) 
	{
		this.user = user;
	}

	public User getUser() 
	{
		return user;
	}

	@Resource(name = "userDao")
	private UserDao userDao;

	// 用户注册
	public String add() 
	{
		System.out.println(user.getName());
		userDao.add(user);
		return "login";
	}

	// 用户登录
	public String login() 
	{
		User existUser = userDao.login(user);
		if (existUser != null) 
		{
			// 记录管理员登录信息
			Map sesion = ActionContext.getContext().getSession();
			sesion.put("existUser", existUser);
			return "index";
		} 
		else 
		{
			return "login";
		}
	}

	// 用户退出
	public String logOut() 
	{
		// 获取session
		Map attibutes = ActionContext.getContext().getSession();
		// 将名为exitsAdmin的管理员从session中移除
		attibutes.remove("existUser");
		return "index";
	}

	// 更新信息后重新登录
	public String update() 
	{
		userDao.update(user);
		// 获取session
		Map attibutes = ActionContext.getContext().getSession();
		// 将名为exitsAdmin的管理员从session中移除
		attibutes.remove("existUser");
		return "login";
	}

	// 查询全部
	public String findAll() 
	{
		List<User> list = userDao.findAll();
		ActionContext.getContext().getContextMap().put("list", list);
		long count = userDao.count();
		ActionContext.getContext().getContextMap().put("count", count);
		return "list";
	}

	/**
	 * 查看用户的所选课程以及选课时间
	 * @return listCourse
	 */
	public String find()
	{
		// 获取当前用户ID
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		
		// 查询当前会员所选课程
		List<Course> clist = userDao.findCourse(Integer.parseInt(id));
		ActionContext.getContext().getContextMap().put("clist", clist);
		
		// 查询当前会员所选课时
		List times = userDao.findTimes(Integer.parseInt(id));
		ActionContext.getContext().getContextMap().put("times", times);
		
		return "listCourse";
	}
	
	//用户查看自己的课程
	public String findMycourse()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		//用户选课
		List<Course> clist = userDao.findCourse(Integer.parseInt(id));
		ActionContext.getContext().getContextMap().put("clist", clist);
		//选课时间
		List times = userDao.findTimes(Integer.parseInt(id));
		System.out.println("对应长度"+times.size());
		
		ActionContext.getContext().getContextMap().put("times", times);
		return "findMycourse";
	}

	/**
	 * 图表统计查询统计会员，用于统计单个会员的健康情况
	 * @return 
	 */
	public String findAllOfChart() 
	{
		List<User> list = userDao.findAll();
		ActionContext.getContext().getContextMap().put("list", list);
		long count = userDao.count();
		ActionContext.getContext().getContextMap().put("count", count);
		return "listOfChart";
	}	
	
	
	
	/**
	 * 图表统计查询统计会员
	 * @return 
	 */
	public String countAllUsers() 
	{
		return "countAllUsers";
	}	
}
