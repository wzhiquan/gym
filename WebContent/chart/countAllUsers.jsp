<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>数据绑定 饼图</title>   
        <script src="<%=basePath%>/js/dist/echarts.js" type="text/javascript"></script>
        <script src="<%=basePath%>/js/jquery.min.js"></script>
</head>
<body>
<div id="div1" style="width:900px;height:400px;border:1px solid #dddddd;margin:10px auto;"></div>

<script type="text/javascript">
        require.config({
            paths: {
                echarts: '../js/dist' //引用资源文件夹路径，注意路径
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
                        text: '标题',
                        x:"center"
                    },
                    tooltip: {
                        trigger: 'item',                        
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        data:[],
                        y:"bottom"
                    },
                    calculable : true,
                    toolbox: {
                        show: true,
                        feature: {
                            mark: { show: true },
                            dataView: { show: true, readOnly: false },
                            magicType: { show: true, type: ['line', 'bar'] },
                            restore: { show: true },
                            saveAsImage: { show: true }
                        }
                    },
                    series: []
                };

                // 载入动画---------------------
                myChart.showLoading({
                    text: '正在努力的读取数据中...',    //loading话术
                });

                $.ajax({
                    url:"Default.aspx",
                    data:{},
                    success:function(data){
                        //后台需要返回以下结构的json数据
                        data={
                            "legen":["访问量","订单数","购买数"],
                            "series":[4440,3220,1110]
                        }
                        var legendData=[];
                        var seriesData=[];
                        if(data!=null && data["series"].length>0){
                            legendData=data["legen"];
                            seriesData.push({
                                "name":"饼图标例1",
                                "type":"pie",
                                "radius" : '55%',   //饼图半径大小
                                "center": ['50%', '60%'],//饼图圆心位置x,y
                                "data":function(){
                                    var t_data=[];
                                    for(var i=0,len=data["series"].length;i<len;i++){
                                        t_data.push({
                                            "name":legendData[i],
                                            "value":data["series"][i]                                        
                                        });
                                    }
                                    return t_data;                                    
                                }()
                            });
                        }
                        option.legend.data=legendData;

                        myChart.setOption(option);
                        myChart.setSeries(seriesData);
                    },
                    error:function(){
                        var legendData=[''];
                        var seriesData = [
                                {
                                "name":"饼图标例1",
                                "type":"pie",
                                "radius" : '55%',   //饼图半径大小
                                "center": ['50%', '60%'],//饼图圆心位置x,y
                                    data: [0]
                                }
                        ];                    
                        option.legend.data=legendData;                        
                        myChart.setOption(option);
                        myChart.setSeries(seriesData);
                    
                    },
                    complete:function(){                    
                        //停止动画载入提示                    
                        myChart.hideLoading(); 
                    }
                });
            }
        ); 

    
    </script>


</body>

    
</html>