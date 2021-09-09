package com.gym.news.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.gym.entity.News;
import com.gym.entity.Teacher;

@Component
public class NewsDao 
{
	@Resource
	private SessionFactory sessionFactory;

	// 更新信息
	public void update(News news) 
	{
		sessionFactory.getCurrentSession().update(news);
	}

	// 添加消息
	public void add(News news) 
	{
		sessionFactory.getCurrentSession().save(news);
	}

	// 删除
	public void deltete(News news) 
	{
		sessionFactory.getCurrentSession().delete(news);
	}

	// 消息展示
	public List<News> findAll() 
	{
		String hql = "from News";
		return sessionFactory.getCurrentSession().createQuery(hql).list();
	}

	//首页消息展示
	public List<News> toIndex()
	{
		String hql = "from News order by id desc";
		return sessionFactory.getCurrentSession().createQuery(hql).setMaxResults(10).list();
	}
	
	// 返回总记录数
	public long count() 
	{
		String hql = "select count(*) from News u";
		long count = (Long) sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return count;
	}

	// 类型查找
	public List<News> findByType(String type)
	{
		String hql = "from News where type = ?";
		List<News> list = (List<News>) sessionFactory.getCurrentSession()
				.createQuery(hql).setParameter(0, type).list();
		return list;
	}

	// id查找
	public News findById(int id) 
	{
		String hql = "from News where id = ?";
		News news = (News) sessionFactory.getCurrentSession().createQuery(hql)
				.setParameter(0, id).uniqueResult();
		return news;
	}
	
	//	模糊查询
	public List<News> findByWord(String words)
	{
		 String hql="from News as a where a.title like :name";   
		    Query query = sessionFactory.getCurrentSession().createQuery(hql);   
		    query.setString("name", "%"+words+"%");   
		    List<News> list= query.list();    
          return list;
	}
	
	// 删除一条消息
	public void delete(News news) 
	{
		sessionFactory.getCurrentSession().delete(news);
	}
	
}
