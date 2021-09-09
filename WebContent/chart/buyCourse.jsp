<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>echart示例 折线图</title>   
    <script src="<%=basePath%>/js/dist/echarts.js" type="text/javascript"></script>
    <script src="<%=basePath%>/js/jquery.min.js"></script>
    <script src="<%=basePath%>/js/json2.js"></script>
</head>
<body>
<div id="div1" style="width:900px;height:400px;border:1px solid #dddddd;margin:10px auto;"></div>
<script type="text/javascript">
        require.config({
            paths: {
                echarts: './js/dist' //引用资源文件夹路径，注意路径
            }
        });
        require(
            [
             'echarts',
             'echarts/chart/bar',
             'echarts/chart/line'                 
            ],
            function (ec) {
                 var myChart = ec.init(document.getElementById('div1'));
                 var ecConfig = require('echarts/config');                
                 var option = {
                     title: {
                         text: '',
                         x:"center"
                     },
                     tooltip: {
                         trigger: 'axis'
                     },
                     legend: {
                         data:[],
                         y:"bottom"

                     },

                    toolbox: {
                        show: true, //是否显示工具箱
                        feature: {
                            mark: { show: true },
                            dataView: { show: true, readOnly: false },
                            magicType: { show: true, type: ['line', 'bar', 'stack', 'tiled'] },
                            restore: { show: true },
                            saveAsImage: { show: true }
                        }
                    },
                    //calculable: true,    容易搞错的属性，折线图、柱状图是否叠加
                    xAxis: [{
                        type: 'category',
                        data:[] 
                    }],
                    yAxis: [{
                        type: 'value'
                    }],
                    series: []
                };
             // 载入动画---------------------
                myChart.showLoading({
                    text: '正在努力的读取数据中...',    //loading话术
                });
                $.ajax({
                	url : "charts_buyCourseData",
                	dataType : "json",
                    success:function(data)
                    {
                     
                              var legendData=[];
                              var xAxisData=[];
                              var seriesData=[];
                          
                              if(data!=null && data["series"].length>0){
                                  legendData=data["legen"];
                                  xAxisData=data["axis"];
                                  
                                      
                                      seriesData.push({
                                          "name":legendData,
                                          "type":"line",
                                          "data":data["series"]
                                      
                                      });
                                  }
                              
                        option.title.text="报班统计报表";
                        option.legend.data=legendData;
                        option.xAxis[0]["data"]=xAxisData;

                        myChart.setOption(option);
                        myChart.setSeries(seriesData);
                    },
                    error:function()
                    {
                        //数据接口异常处理
                        var legendData=[''];
                        var xAxisData=[''];
                        var seriesData = [
                                {
                                    name:'',
                                    type: 'line',
                                    data: [0]
                                }
                        ];                    
                        option.legend.data=legendData;
                        option.xAxis[0]["data"]=xAxisData;

                        myChart.setOption(option);
                        myChart.setSeries(seriesData);
                    
                    },
                    complete:function()
                    {      
                        //不管数据接口成功或异常，都终于载入提示              
                        //停止动画载入提示                    
                        myChart.hideLoading(); 
                    }
                });
            }
        ); 
    </script>


</body>
</html>