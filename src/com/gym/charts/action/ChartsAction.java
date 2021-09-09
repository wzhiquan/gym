package com.gym.charts.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.gym.charts.dao.ChartsDao;
import com.gym.entity.Health;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Component(value = "chartsAction")
public class ChartsAction extends ActionSupport implements ModelDriven<Health> 
{
	/**
	 * 序列化
	 */
	private static final long serialVersionUID = 1L;
	
	@Resource(name = "chartsDao")
	private  ChartsDao chartsDao;
	
	public ChartsDao getChartsDao() 
	{
		return chartsDao;
	}

	public void setChartsDao(ChartsDao chartsDao) 
	{
		this.chartsDao = chartsDao;
	}
	
	/**
	 * 注入Health实体类
	 */
	private Health health = new Health();

	// 图表展示购买课题
	public String buyCourse() 
	{
		return "chartCourse";
	}
	
	// 图表展示购买课题
	public void buyCourseData() throws IOException 
	{
		// 查询购买课程数据
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		// 获取当前日期年月日
	    Date d = new Date();  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");  
		
		// 初始化数组
		PrintWriter out = response.getWriter();
		// 获取最近7天的日期
		List<String> list = getPastDateList(7);
		List<Integer> valuelist = new ArrayList<Integer>();
		for(String createDate : list)
		{
			// 选课时间
			List counts = chartsDao.findCounts(createDate);
			valuelist.add(Integer.parseInt(counts.get(0).toString()));
		}
		//向json中添加数据
        JSONObject json = new JSONObject();
        json.put("legen", "课程数量");
        json.put("axis",JSONArray.fromObject(list).toString());
        json.put("series", JSONArray.fromObject(valuelist).toString());		 
		 
		out.write(json.toString());
		out.flush();
		out.close();
	}
	/** 
	* 获取过去或者未来 任意天内的日期数组 
	* @param intervals intervals天内 
	* @return 日期数组 
	*/  
	public static List<String> getPastDateList(int intervals ) 
	{  
	   List<String> pastDaysList = new ArrayList<String>();  
	   for (int i = 0; i <intervals; i++)
	   {  
	     pastDaysList.add(getPastDate(i));  
	   }  
	   return pastDaysList;  
	}  

	/** 
      * 获取过去第几天的日期 
      * 
      * @param past 
      * @return 
      */  
     public static String getPastDate(int past) 
     {  
         Calendar calendar = Calendar.getInstance();  
         calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - past);  
         Date today = calendar.getTime();  
         SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");  
         String result = format.format(today);  
         return result;  
     }
     
     /**
      * 初始化图表统计录入数据
      */
     public String initEnterUserData()
     {
    	// 获取当前会员ID
 		HttpServletRequest request = ServletActionContext.getRequest();
 		String id = request.getParameter("id");
 		String username = request.getParameter("username");
 		health.setUserid(id);
 		health.setUsername(username);
 		ActionContext.getContext().getContextMap().put("health", health);
    	 return "initEnterUserData";
     }
     
     /**
      * 保存图表统计录入数据
      */
     public String saveEnterUserData()
     {
    	 chartsDao.saveEnterUserData(health);
    	 ActionContext.getContext().getContextMap().put("health", health);
    	return "success";
     }
     
     /**
      * 初始化图表展示会员健康状况
      * @return
      */
 	public String initHealthCondition() 
 	{
		// 获取当前会员ID
		HttpServletRequest request = ServletActionContext.getRequest();
		String userId = request.getParameter("id");
		health.setUserid(userId);
		// request.setAttribute("userid", userId);
		ActionContext.getContext().getContextMap().put("health", health);
 		return "healthCondition";
 	}
 	
 	/**
 	 * 图表展示会员健康状况
 	 * @throws IOException
 	 */
	public void qryHealthData() throws IOException 
	{
		// 获取当前会员ID
		HttpServletRequest request = ServletActionContext.getRequest();
		String userid = request.getParameter("userid");
		// 查询购买课程数据
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		// 获取当前日期年月日
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		// 初始化数组
		PrintWriter out = response.getWriter();
		// 获取最近7天的日期
		List<String> list = getPastDateList(7);
		// 体重、脂肪、肌肉、水体量list
		List<Double> valuelist = new ArrayList<Double>();
		List<Double> fatlist = new ArrayList<Double>();
		List<Double> musclelist = new ArrayList<Double>();
		List<Double> waterlist = new ArrayList<Double>();
		// 体重
		String weight = "";
		// 脂肪
		String fat = "";
		// 肌肉
		String muscle = "";
		// 水量
		String water = "";

		for (String createDate : list) 
		{
			// 体重
			weight = chartsDao.qryHealthWeight(userid, createDate);
			// 脂肪
			fat = chartsDao.qryHealthFat(userid, createDate);
			// 肌肉
			muscle = chartsDao.qryHealthMuscle(userid, createDate);
			// 水体量
			water = chartsDao.qryHealthWater(userid, createDate);

			if (StringUtils.isEmpty(weight))
			{
				weight = "0";
			}

			if (StringUtils.isEmpty(fat)) 
			{
				fat = "0";
			}
			if (StringUtils.isEmpty(muscle)) 
			{
				muscle = "0";
			}
			if (StringUtils.isEmpty(water)) 
			{
				water = "0";
			}
			valuelist.add(Double.parseDouble(weight));
			fatlist.add(Double.parseDouble(fat));
			musclelist.add(Double.parseDouble(muscle));
			waterlist.add(Double.parseDouble(water));
		}

		List<String> totalList = new ArrayList<String>();
		totalList.add(JSONArray.fromObject(valuelist).toString());
		totalList.add(JSONArray.fromObject(fatlist).toString());
		totalList.add(JSONArray.fromObject(musclelist).toString());
		totalList.add(JSONArray.fromObject(waterlist).toString());

		List<String> titleList = new ArrayList<String>();
		titleList.add("体重");
		titleList.add("脂肪");
		titleList.add("肌肉");
		titleList.add("水体量");
		System.out.println(JSONArray.fromObject(titleList).toString());
		// 向json中添加数据
		JSONObject json = new JSONObject();
		json.put("legen", JSONArray.fromObject(titleList).toString());
		json.put("axis", JSONArray.fromObject(list).toString());
		json.put("series", JSONArray.fromObject(totalList).toString());
		out.write(json.toString());
		out.flush();
		out.close();
	}
	
	

	@Override
	public Health getModel() {
		// TODO Auto-generated method stub
		return health;
	}     
}
