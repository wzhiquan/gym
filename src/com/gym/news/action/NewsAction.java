package com.gym.news.action;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.gym.entity.News;
import com.gym.entity.Teacher;
import com.gym.news.dao.NewsDao;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;

@Component(value = "newsAction")
public class NewsAction extends ActionSupport 
{
	private News news;

	public void setNews(News news) 
	{
		this.news = news;
	}

	public News getNews() 
	{
		return news;
	}

	@Resource(name = "newsDao")
	private NewsDao newsDao;

	// 添加消息
	public String add() 
	{
		newsDao.add(news);
		return "tolist";
	}

	// 更新信息
	public String update() 
	{
		newsDao.update(news);
		return "tolist";
	}

	// 查询全部
	public String findAll() 
	{
		List<News> list = newsDao.findAll();
		ActionContext.getContext().getContextMap().put("list", list);
		long count = newsDao.count();
		ActionContext.getContext().getContextMap().put("count", count);
		return "list";
	}
  
	//跳转到编辑页面
	public String edit() 
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		News news = newsDao.findById(Integer.parseInt(id));
		ActionContext.getContext().getContextMap().put("news", news);
		return "toEdit";
	}

	// id查找
	public String findById() 
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		System.out.println("新闻id:" + id);
		News news = newsDao.findById(Integer.parseInt(id));
		ActionContext.getContext().getContextMap().put("news", news);
		return "detail";
	}

	// 模糊查询
	public String findByWord()
	{
		HttpServletRequest request = ServletActionContext.getRequest();

		String words = request.getParameter("words");
		System.out.println("查询的文字为：" + words);
		List<News> list = newsDao.findByWord(words);
		if(list == null){
			System.out.println("空字符");
		}
        request.setAttribute("list", list);
		return "newTypes";
	}

	//访问首页异步请求新闻
	public void toIndex() throws Exception 
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		
		List<News> list = newsDao.toIndex();
		
		// LIST转JSON
		String json = JSONArray.fromObject(list).toString();
		System.out.println("==="+json);
		PrintWriter out = response.getWriter();
		out.write(json);
		out.flush();
		out.close();
	}

	// 删除一条消息
	public String delete() 
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		News news = newsDao.findById(Integer.parseInt(id));
		newsDao.delete(news);
		return "tolist";
	}
	
}
