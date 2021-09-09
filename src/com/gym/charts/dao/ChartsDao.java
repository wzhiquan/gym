package com.gym.charts.dao;

import java.util.List;

import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.gym.entity.Health;
@Component
public class ChartsDao
{
	@Resource
	private SessionFactory sessionFactory;
	
	// 查看某一天报名课程总数
	public List findCounts(String createdate) 
	{
		// 查询课时
		String sql = "SELECT count(*) from relation where createdate = ?";
		List counts = sessionFactory.getCurrentSession().createSQLQuery(sql).setParameter(0, createdate).list();
		return counts;
	}
	
	// 查看某一天报名课程总数
	public Integer findCounts1(String createdate) 
	{
		// 查询课时
		String sql = "SELECT count(*) from relation where createdate = ?";
		return (Integer) sessionFactory.getCurrentSession().createSQLQuery(sql).setParameter(0, createdate).uniqueResult();
	}
	
    /**
     * 保存图表统计录入数据
     */
    public void saveEnterUserData(Health health)
    {
    	sessionFactory.getCurrentSession().save(health);
    }
    
	// 查看某一天报名课程总数
	public Health qryHealthCondition(String id) 
	{
		// 查询课时
		String sql = "SELECT * from health where userid = ?";
		Health health = (Health) sessionFactory.getCurrentSession().createSQLQuery(sql).setParameter(0, id).uniqueResult();
		return health;
		 
	}
	
	// 查询体重
	public String qryHealthWeight(String id,String date) 
	{
		// 查询课时
		String sql = "SELECT weight from health where userid = ? and createtime = ?";
		String weight = (String) sessionFactory.getCurrentSession().createSQLQuery(sql).setParameter(0, id).setParameter(1, date).uniqueResult();
		return weight;
	}
	
	// 查询脂肪
	public String qryHealthFat(String id, String date)
	{
		String sql = "SELECT fat from health where userid = ? and createtime = ?";
		String fat = (String) sessionFactory.getCurrentSession().createSQLQuery(sql).setParameter(0, id)
				.setParameter(1, date).uniqueResult();
		return fat;
	}
	
	// 查询肌肉
	public String qryHealthMuscle(String id, String date)
	{
		String sql = "SELECT muscle from health where userid = ? and createtime = ?";
		String muscle = (String) sessionFactory.getCurrentSession().createSQLQuery(sql).setParameter(0, id)
				.setParameter(1, date).uniqueResult();
		return muscle;
	}
	
	// 查询水体量
	public String qryHealthWater(String id, String date)
	{
		String sql = "SELECT water from health where userid = ? and createtime = ?";
		String water = (String) sessionFactory.getCurrentSession().createSQLQuery(sql).setParameter(0, id)
				.setParameter(1, date).uniqueResult();
		return water;
	}
}
