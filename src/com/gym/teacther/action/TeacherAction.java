package com.gym.teacther.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.gym.entity.Teacher;
import com.gym.teacther.dao.TeacherDao;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component(value = "teacherAction")
public class TeacherAction extends ActionSupport implements ModelDriven<Teacher> 
{
	private Teacher teacher = new Teacher();

	@Override
	public Teacher getModel() 
	{
		return teacher;
	}

	@Resource(name = "teacherDao")
	private TeacherDao teacherDao;

	// 教练登录
	public String login() 
	{
		Teacher existTeacher = teacherDao.login(teacher);
		if (existTeacher != null) 
		{
			// 记录管理员登录信息
			ActionContext.getContext().getSession().put("existTeacher", existTeacher);
			if (existTeacher.getType() == 1) 
			{
				// 判断是否为管理员
				return "admin";
			} 
			else 
			{
				// 普通教练
				return "teacher"; 
			}
		} 
		else 
		{ 
			// 登录失败
			ActionContext.getContext().getContextMap().put("msg", "输入有误，请输入正确信息");
			return "login";
		}
	}

	// 退出
	public String logOut() 
	{
		// 获取session
		Map attibutes = ActionContext.getContext().getSession();
		// 将名为exitsAdmin的管理员从session中移除
		attibutes.remove("existTeacher");
		return "index";
	}

	// 提升为管理员
	public String toAdmin() 
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		teacherDao.toAdmin(Integer.parseInt(id));
		return "tolist";
	}

	// 恢复为普通教练
	public String toTeacher() 
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		teacherDao.toTeacher(Integer.parseInt(id));
		return "tolist";
	}

	// 查询所有教练
	public String findAll() 
	{
		List<Teacher> list = teacherDao.findAll();
		ActionContext.getContext().getContextMap().put("list", list);
		long count = teacherDao.count();
		ActionContext.getContext().getContextMap().put("count", count);
		return "list";
	}

	// 添加一个教练
	public String add() 
	{
		teacher.setPassword("000000");
		teacherDao.add(teacher);
		return "tolist";
	}

	// 更具id查询员工信息然后跳转到员工信息界面
	public String edit() 
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		Teacher teacher = teacherDao.findById(Integer.parseInt(id));
		ActionContext.getContext().getContextMap().put("teacher", teacher);
		return "toEdit";
	}

	// 更新信息
	public String update() 
	{
		teacherDao.update(teacher);
		return "tolist";
	}

	// 删除
	public String delete() 
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		Teacher teacher = teacherDao.findById(Integer.parseInt(id));
		teacherDao.delete(teacher);
		return "tolist";
	}

}
