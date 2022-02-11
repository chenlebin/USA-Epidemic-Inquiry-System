<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>美国疫情资讯</title>
<!--日历插件-->
<script type="text/javascript" src="jedate-6.5.0/src/jedate.js"></script>
<link href="css/jedate.css">
<link href="css/jeDate-test.css"> 

<!--开源部分：Echarts地图插件（本网页中是USA.json的地图）-->

<script src="js/echarts.min.js"></script>
<script src="js/jquery-2.2.4.js"></script>

<!--开源部分：bootstrap的css样式，用于轮播图-->
<link rel="stylesheet"
 href="css/bootstrap.min.css">
 
<!--团队编写：专用于本网页的yiing.css样式插件-->
<link rel="stylesheet"
 href="css/yiqing.css">

<!--团队编写的一些用的多的样式插件，为了方便使用所以整合在了一个插件（目前写的还很少，日后找时间在完善）-->

<link href="css/clb.css" rel="stylesheet" type="text/css">

 <script  language="javascript" src="js/bootstrap.min.js"></script>
 
 <meta name="viewport" content="width=device-width,initial-scaiel=1"
 >
 
 </head>
<!--写入css-->
<!--开源部分：jeDate插件，写入日历的js内容-->
<script type="text/javascript">
    $(function () {
        jeDate("#date1",{
			skinCell:"jedateblue",  
            format:"YYYY-MM-DD",
            minDate:"2020-01-01 ",
			maxDate:"2022-12-31 ", 
			onClose:false,		     
        })
    });
    function showDiv(obj){
        document.getElementById(obj).style.display="";
        //alert('已经显示');
    }
    function hideDiv(obj){
        document.getElementById(obj).style.display = "none";
        //alert('已经隐藏');
    }
</script>

<body onLoad="showDiv('div1');hideDiv('div2');hideDiv('div3');hideDiv('div4')">
<form action="pai?flag=query" method="post">
<div class="zhengti">



<div class="neirong">


<!--让整个导航条位于顶部-->
<nav class="navbar navbar-default navbar-fixed-top">

<div id="dhwz">
      <ul>
        <li><a href="#gnyq" style="">美国疫情</a></li>
        <li><a href="#yqzx" style="">疫情资讯</a></li>
        <li><a href="#qzfbdt" style="">确诊分布地图</a></li>
        <li><a href="#sjph" style="">州级排行</a></li>
        <li><a href="#yqqs" style="">疫情趋势及预测曲线</a></li>
        <li><a href="#fhyp" style="">防护用品</a></li>
        <li><a href="#gywm" style="">关于我们</a></li>
        <li><a href="用户界面.jsp" style="">返回主页</a></li>
 
      </ul>
    
    </div>   
    <div class="qingchu"></div>

</nav>



<!--用来留白：-->
<div class="zhanyongding"></div>


<div>
<!--全国疫情-->
<img src="duomeiti/QQ图片20210419214829.jpg" width="100%">

<!--站内跳转，按导航条跳转到疫情查询-->
<a name="gnyq"></a>
<div id="mouguozixun">

<h2 style="padding:10px 70px 0 0">疫情查询：
  <label for="select"></label>
  <select name="select"  class="danxuan" id="select">
<%--<option value="USA">USA</option>--%>
<option value="Alabama">Alabama</option>
<option value="Alaska">Alaska</option>
<option value="Arizona">Arizona</option>
<option value="Arkansas">Arkansas</option>
<option value="California">California</option>
<option value="Colorado">Colorado</option>
<option value="Connecticut">Connecticut</option>
<option value="Delaware">Delaware</option>
<option value="District of Columbia">District of Columbia</option>
<option value="Florida">Florida</option>
<option value="Georgia">Georgia</option>
<option value="Hawaii">Hawaii</option>
<option value="Idaho">Idaho</option>
<option value="Illinois">Illinois</option>
<option value="Indiana">Indiana</option>
<option value="Iowa">Iowa</option>
<option value="Kansas">Kansas</option>
<option value="Kentucky">Kentucky</option>
<option value="Louisiana">Louisiana</option>
<option value="Maine">Maine</option>
<option value="Maryland">Maryland</option>
<option value="Massachusetts">Massachusetts</option>
<option value="Michigan">Michigan</option>
<option value="Minnesota">Minnesota</option>
<option value="Mississippi">Mississippi</option>
<option value="Missouri">Missouri</option>
<option value="Montana">Montana</option>
<option value="Nebraska">Nebraska</option>
<option value="Nevada">Nevada</option>
<option value="New Hampshire">New Hampshire</option>
<option value="New Jersey">New Jersey</option>
<option value="New Mexico">New Mexico</option>
<option value="New York">New York</option>
<option value="North Carolina">North Carolina</option>
<option value="North Dakota">North Dakota</option>
<option value="Ohio">Ohio</option>
<option value="Oklahom">Oklahom</option>
<option value="Oregon">Oregon</option>
<option value="Pennsylvania">Pennsylvania</option>
<option value="Rhode Island">Rhode Island</option>
<option value="South Carolina">South Carolina</option>
<option value="South Dakota">South Dakota</option>
<option value="Tennessee">Tennessee</option>
<option value="Texas">Texas</option>
<option value="Utah">Utah</option>
<option value="Vermont">Vermont</option>
<option value="Virginia">Virginia</option>
<option value="Washington">Washington</option>
<option value="West Virginia">West Virginia</option>
<option value="Wisconsin">Wisconsin</option>
<option value="Wyoming">Wyoming</option>
  </select>
</h2>

<!--让表格中的内容层居中-->

<div class="juzhong_2_wai">

<div class="juzhong_2_li">
<table border="0"  width="100%">
<tr style="background-color:#F0F0F0; ">
	<td style="text-align:center "><p style=" font-size:36px;  ">累计确诊</p></td>

    <td style="text-align:center "><p style=" font-size:36px;  ">累计死亡</p></td>
    <td style="text-align:center "><p style=" font-size:36px;  ">死亡率</p></td>
</tr>
<c:forEach items="${zixundata}" var="zd" end="0">
<tr>
  <td style="text-align:center "><p style=" font-size:36px;  color:#B1F18B">${zd.cases}</p></td>

  <td style="text-align:center "><p style=" font-size:36px;  color:#FBCB3C">${zd.deaths}</p></td>

  <td style="text-align:center "><p style=" font-size:36px;  color:#D70000">${zd.dr}</p></td>
</tr>
</c:forEach>

</table>


<input id="date1"  name ="jzrq1" type="text"   placeholder="截止日期" style=" margin:30px 100px 0 0;border:0.5px #A1A1A1 solid; border-radius:12%">

<input type="submit" style=" margin:30px 100px 0 0;border:0.5px #A1A1A1 solid; border-radius:22%; background-color:#FFFFD7; width:72px; height:30px"  value="疫情查询">


</div>

</div>
</div>


<!--站内跳转，按导航条跳转到疫情资讯-->
<a name="yqzx"></a>
<div class="qingchu"></div>
<!--用来留白：-->
<div class="zhanyong"></div>

<div class="yqzx">
<!-- 开源部分：轮播图 -->
<!--疫情资讯-->
<div class="row">
   <div id="carousel-example-generic" class="carousel slide">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active" align="center">
    <a href="https://www.sohu.com/a/464949497_222256" target="_blank">
      <img src="duomeiti/lunbo5.png"></a>
      <div class="carousel-caption">
      </div>
    </div>


    <div class="item " align="center">
    <a href="http://www.wenming.cn/djw/djw2016sy/djw2016yw/202004/t20200407_5513936.shtml" target="_blank">
       <img src="duomeiti/lunbo1.png"></a>
      <div class="carousel-caption">
      </div>
    </div>

    <div class="item " align="center">
    <a href="https://www.chinanews.com/gj/2021/04-30/9468119.shtml?qq-pf-to=pcqq.c2c" target="_blank">
       <img src="duomeiti/lunbo2.png"></a>
      <div class="carousel-caption">
      </div>
    </div>

    <div class="item " align="center">
    <a href="https://www.who.int/zh/emergencies/diseases/novel-coronavirus-2019/covid-19-vaccines" target="_blank">
       <img src="duomeiti/lunbo6.png"></a>
      <div class="carousel-caption">
      </div>
    </div>


  </div>

  <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div>
  </div>

</div>

<!--用来留白：-->
<div class="zhanyong"></div>
<div class="qingchu"></div>


<!--站内跳转，按导航条跳转到疫情地图-->
<a name="qzfbdt"></a>
<div>


<!--开源部分疫情地图：-->
<div>
<div id="USAMap" style="width:100%;height:390px;"></div>
<!--开源部分：USA疫情地图-->
<script>
    // 美国地图
    USAMap();

    function USAMap() {
        var myChart = echarts.init(document.getElementById("USAMap"));
        // 开启加载loading的动画

        // jquery读取json文件
        $.get('json/usa.json', function (usaJson) {
            // 隐藏loading的动画

            echarts.registerMap('USA', usaJson, {
                // 把阿拉斯加移到美国主大陆左下方
                Alaska: {
                    left: -131,
                    top: 25,
                    width: 15
                },
                // 夏威夷
                Hawaii: {
                    left: -110,
                    top: 28,
                    width: 5
                },
                // 波多黎各（因为名字有空格，所以写为字符串的形式）
                'Puerto Rico': {
                    left: -76,
                    top: 26,
                    width: 2
                }
            });
            option = {
                title: {
                    text: '美国疫情地图',
                    left: 'right',
                    color:'#a70d0d'
                },
                // 提示框组件
                tooltip: {
                    trigger: 'item',
                    // 浮层显示的延迟
                    showDelay: 0,
                    // 提示框浮层的移动动画过渡时间
                    transitionDuration: 0.2,
                    // 按要求的格式显示提示框
                    formatter: function (params) {
                        var value = (params.value + '').split('.');
                        value = value[0].replace(/(\d{1,3})(?=(?:\d{3})+(?!\d))/g, '$1,');
                        return params.seriesName + '<br/>' + params.name + ': ' + value;
                    }
                },
                // 可视映射
                <!--todo 接收从servlet传递过来的字典数据进行处理-->
                <%
                HashMap<String,Integer> xx=(HashMap<String,Integer>)request.getAttribute("stateMap");
                %>
                visualMap: {
                    left: 'right',
                    //todo 从Servlet获取的数据中动态调整疫情地图的上限值
                    min: 0,
                    max: <%=xx.get("New York")*1.2%>,
                    // 颜色区间
                    inRange: {
                        color: ['#313695', '#4575b4', '#74add1', '#abd9e9', '#e0f3f8', '#ffffbf', '#fee090', '#fdae61', '#f46d43', '#d73027', '#a50026']
                    },
                    // 文本，默认为数值文本
                    text: ['High', 'Low'],
                    // 显示拖拽用的手柄
                    calculable: true
                },
                // 工具盒
                toolbox: {
                    show: true,
                    //orient: 'vertical',
                    left: 'left',
                    top: 'top',
                    feature: {
                        // 数据视图
                        dataView: {readOnly: false},
                        // 还原
                        restore: {},
                        // 保存为图片
                        saveAsImage: {}
                    }
                },
                series: [
                    {
                        name: 'USA PopEstimates',
                        type: 'map',
                        // 开启鼠标缩放和平移漫游
                        roam: true,
                        map: 'USA',
                        // 显示标签
                        emphasis: {
                            label: {
                                show: true
                            }
                        },
                        // 文本位置修正
                        textFixed: {
                            Alaska: [20, -20]
                        },
                        data: [
                            {name: 'Alabama', value: <%=xx.get("Alabama")%>},
                            {name: 'Alaska', value: <%=xx.get("Alaska")%>},
                            {name: 'Arizona', value: <%=xx.get("Arizona")%>},
                            {name: 'Arkansas', value: <%=xx.get("Arkansas")%>},
                            {name: 'California', value: <%=xx.get("California")%>},
                            {name: 'Colorado', value: <%=xx.get("Colorado")%>},
                            {name: 'Connecticut', value: <%=xx.get("Connecticut")%>},
                            {name: 'Delaware', value: <%=xx.get("Delaware")%>},
                            {name: 'District of Columbia', value: <%=xx.get("District of Columbia")%>},
                            {name: 'Florida', value: <%=xx.get("Florida")%>},
                            {name: 'Georgia', value: <%=xx.get("Georgia")%>},
                            {name: 'Hawaii', value: <%=xx.get("Hawaii")%>},
                            {name: 'Idaho', value: <%=xx.get("Idaho")%>},
                            {name: 'Illinois', value: <%=xx.get("Illinois")%>},
                            {name: 'Indiana', value: <%=xx.get("Indiana")%>},
                            {name: 'Iowa', value: <%=xx.get("Iowa")%>},
                            {name: 'Kansas', value: <%=xx.get("Kansas")%>},
                            {name: 'Kentucky', value: <%=xx.get("Kentucky")%>},
                            {name: 'Louisiana', value: <%=xx.get("Louisiana")%>},
                            {name: 'Maine', value: <%=xx.get("Maine")%>},
                            {name: 'Maryland', value: <%=xx.get("Maryland")%>},
                            {name: 'Massachusetts', value: <%=xx.get("Massachusetts")%>},
                            {name: 'Michigan', value: <%=xx.get("Michigan")%>},
                            {name: 'Minnesota', value: <%=xx.get("Minnesota")%>},
                            {name: 'Mississippi', value: <%=xx.get("Mississippi")%>},
                            {name: 'Missouri', value: <%=xx.get("Missouri")%>},
                            {name: 'Montana', value: <%=xx.get("Montana")%>},
                            {name: 'Nebraska', value: <%=xx.get("Nebraska")%>},
                            {name: 'Nevada', value: <%=xx.get("Nevada")%>},
                            {name: 'New Hampshire', value: <%=xx.get("New Hampshire")%>},
                            {name: 'New Jersey', value: <%=xx.get("New Jersey")%>},
                            {name: 'New Mexico', value: <%=xx.get("New Mexico")%>},
                            {name: 'New York', value: <%=xx.get("New York")%>},
                            {name: 'North Carolina', value: <%=xx.get("North Carolina")%>},
                            {name: 'North Dakota', value: <%=xx.get("North Dakota")%>},
                            {name: 'Ohio', value: <%=xx.get("Ohio")%>},
                            {name: 'Oklahoma', value: <%=xx.get("Oklahoma")%>},
                            {name: 'Oregon', value: <%=xx.get("Oregon")%>},
                            {name: 'Pennsylvania', value: <%=xx.get("Pennsylvania")%>},
                            {name: 'Rhode Island', value: <%=xx.get("Rhode Island")%>},
                            {name: 'South Carolina', value: <%=xx.get("South Carolina")%>},
                            {name: 'South Dakota', value: <%=xx.get("South Dakota")%>},
                            {name: 'Tennessee', value: <%=xx.get("Tennessee")%>},
                            {name: 'Texas', value: <%=xx.get("Texas")%>},
                            {name: 'Utah', value: <%=xx.get("Utah")%>},
                            {name: 'Vermont', value: <%=xx.get("Vermont")%>},
                            {name: 'Virginia', value: <%=xx.get("Virginia")%>},
                            {name: 'Washington', value: <%=xx.get("Washington")%>},
                            {name: 'West Virginia', value: <%=xx.get("West Virginia")%>},
                            {name: 'Wisconsin', value: <%=xx.get("Wisconsin")%>},
                            {name: 'Wyoming', value: <%=xx.get("Wyoming")%>},
                            {name: 'Puerto Rico', value: <%=xx.get("Puerto Rico")%>}
                        ]
                    }
                ]
            };

            myChart.setOption(option);
        });
    }

</script>
</div>


<!--用来留白：-->
<div class="zhanyong"></div>
<div class="qingchu"></div>


<!--站内跳转，按导航条跳转到省级排行-->
<a name="sjph"></a>
<!--省级排行-->
<div class="yuanxingbiankuang">

<!--让表格中的内容层居中-->
<div class="juzhong_2_wai">

<div class="juzhong_2_li">
<div class="juzhong_1"><h3 style=" color:#535353">美国疫情（州）排行榜</h3></div>
<table border="0"  width="100%" >
<tr style="background-color:#F0F0F0;  padding:10px 30px">

	<td style="text-align:center "><p style=" font-size:16px; width:50% "> 地区（州）</p></td>

	<td style="text-align:center "><p style=" font-size:16px;  color:#B1F18B">累计确诊</p></td>

    <td style="text-align:center "><p style=" font-size:16px;  color:#FBCB3C">累计死亡</p></td>

    <td style="text-align:center "><p style=" font-size:16px;  color:#D70000">死亡率</p></td>
</tr>
 <c:forEach items="${pdata}" var="pd" end="19">
<tr>
  <td style="text-align:center "><p style=" font-size:18px; width:50%">${pd.state}</p></td>

  <td style="text-align:center "><p style=" font-size:18px; ">${pd.cases}</p></td>

  <td style="text-align:center "><p style=" font-size:18px; ">${pd.deaths}</p></td>

  <td style="text-align:center "><p style=" font-size:18px; ">${pd.dr}</p></td>
</tr>
</c:forEach>

</table>
<!--居中li-->
</div>
<!--居中wai-->
</div>
<!--yuanxingbiankuang-->
</div>


<!--用来留白：-->
<div class="zhanyong"></div>
<div class="qingchu"></div>

<!--站内跳转，按导航条跳转到疫情曲线及趋势预测-->
<a name="yqqs"></a>
<div>
<!--疫情趋势-->

<div id="father" style="position: relative;margin-bottom: 300px;">
   <div id="mychart" style="width: 100%;height: 490px; position: relative;left:50%;top:50%;transform: translate(-50%,20%);"></div>
   <script>
   		var chart=echarts.init(document.getElementById('mychart'),"dark");
   		var option;

   		option={
   			title:{
   				text:'疫情趋势预测',
				textStyle:{fontSize:'28'},
   				x:'center',
   				y:'top',
   				textAlign:'center',
   			},
   			tooltip:{
   				trigger:'axis',
   				show:true,
   			},
   			legend:{
   				orient:'vertical',
   				top:'10%',
   				right:'0%',
   				backgroundColor:'rgb(176,224,230)',
   				data:['确诊人数','死亡人数']
   			},
   			grid:{
   				left:'3%',
   				right:'13%',
   				bottom:'3%',
   				containLabel:true
   			},
   			toolbox:{
   			},
   			xAxis:{
   				name:'日期/天',
   				type:'category',
   				axisLine:{
   					symbol:['none','triangle'],
   					symbolOffset:8,
   					symbolSize:[8,10],
   					lineStyle:{
   						color:'#d5cece',
   					},
   				},
   				axisLabel:{
   					showMaxLabel:true,
   					textStyle:{
   						color:'#d5cece',
   						fontSize:12,
   					},
   				},

   				boundaryGap:false,
                //todo 在JavaScript
                <%
                List<String> date = new ArrayList<>();
                List<String> datez = new ArrayList<>();//存放中间字符串序列
                try{
                    date = (List<String>) request.getAttribute("q_date");
                    for(int i = 0; i < date.size(); i++) {
                        datez.add("\""+date.get(i)+"\"");
                    }
                    date.clear();
                    date.addAll(datez);

                }catch (Exception e){
                date.add(String.valueOf(122));
                date.add(String.valueOf(233));
                date.add(String.valueOf(3444));
                date.add(String.valueOf(12222));
                date.add(String.valueOf(22222));
                date.add(String.valueOf(34444));
                date.add(String.valueOf(133333));
                date.add(String.valueOf(133333));
                date.add(String.valueOf(133333));
                date.add(String.valueOf(133333));
                date.add(String.valueOf(133333));
                date.add(String.valueOf(133333));
                date.add(String.valueOf(133333));
                date.add(String.valueOf(133333));
                date.add(String.valueOf(133333));
                date.add(String.valueOf(133333));
                date.add(String.valueOf(133333));
                date.add(String.valueOf(133333));
                date.add(String.valueOf(133333));
                date.add(String.valueOf(133333));
                date.add(String.valueOf(133333));
                date.add(String.valueOf(133333));
                date.add(String.valueOf(133333));
                date.add(String.valueOf(133333));
                }
                %>
                data:<%=date%>,

   			},
   			yAxis:{
   				name:'人数/人',
   				type:'value',
   				axisLine:{
   					show:true,
   					symbol:['none','arrow'],
   					symbolOffset:8,
   					symbolSize:[8,10],
   					lineStyle:{
   						color:'#d5cece',
   					}
   				},
   				axisLabel:{
   					showMaxLabel:true,
   					textStyle:{
   						color:'#d5cece',
   						fontSize:12,
   					},
   				},

   				splitLine:{
   					show:false,
   				},
   				scale:true,
   				boundaryGap:false,

   			},
   			series:[
   			{
   				name:'确诊人数',
   				type:'line',
   				stack:'总量',
   				smooth:true,
                <%
                List cases = new ArrayList<>();
                try{
                cases = (List)(request.getAttribute("q_cases"));
                }catch (Exception e){
                cases.add(122);
                cases.add(233);
                cases.add(3444);
                cases.add(12222);
                cases.add(22222);
                cases.add(34444);
                cases.add(133333);
                cases.add(133333);
                cases.add(133333);
                cases.add(133333);
                cases.add(133333);
                cases.add(133333);
                cases.add(133333);
                cases.add(133333);
                cases.add(133333);
                cases.add(133333);
                cases.add(133333);
                cases.add(133333);
                cases.add(133333);
                cases.add(133333);
                cases.add(133333);
                cases.add(133333);
                cases.add(133333);
                cases.add(133333);
                }
                %>
                data:<%=cases%>,

   			},
   			{
   				name:'死亡人数',
   				type:'line',
   				stack:'总量',
   				itemStyle:{
   					normal:{
   						color:'#ff0000',
   					lineStyle:{
   						color:'#ff0000'
   					}
   				}
   				},
   				smooth:true,
                <%
                List deaths = new ArrayList<>();
                try{
                deaths = (List)(request.getAttribute("q_deaths"));
                }catch (Exception e){
                deaths.add(122);
                deaths.add(233);
                deaths.add(3444);
                deaths.add(12222);
                deaths.add(22222);
                deaths.add(34444);
                deaths.add(133333);
                deaths.add(133333);
                deaths.add(133333);
                deaths.add(133333);
                deaths.add(133333);
                deaths.add(133333);
                deaths.add(133333);
                deaths.add(133333);
                deaths.add(133333);
                deaths.add(133333);
                deaths.add(133333);
                deaths.add(133333);
                deaths.add(133333);
                deaths.add(133333);
                deaths.add(133333);
                deaths.add(133333);
                deaths.add(133333);
                deaths.add(133333);
                }
                %>
                data:<%=deaths%>,
   			}
   		]
   	},
   		loaddata(option);
   		chart.setOption(option);
   		function loaddata(option){
   			$.ajax({
   				type:"post",
   				async:false,
   				url:'echartsjsp',
   				data:{},
   				dataType:'json',
   				success:function(result){
   					if(result){
   						option.xAxis[0].data=[];
   						for(var i=0;i<result.length;i++){
   							option.xAxis[0].data.push(result[i].u_date);
   						}

   						option.series[0].data=[];
   						for(var i=0;i<result.length;i++){
   							option.series[0].data.push(result[i].cases);
   						}

   						option.series[1].data=[];
   						for(var i=0;i<result.length;i++){
   							option.series[1].data.push(result[i].deaths);
   						}
   					}
   				}
   					})
   				}
   		window.onre0size=function(){
   			chart.resize();
   		}
   </script>
   </div>

</div>


<!--用来留白：-->
<p style="text-align:center; font-size:30px;">
<span onClick="showDiv('div1');hideDiv('div2');hideDiv('div3');hideDiv('div4')">口罩</span>
<span onClick="showDiv('div2');hideDiv('div1');hideDiv('div3');hideDiv('div4')">湿巾</span>
<span onClick="showDiv('div3');hideDiv('div1');hideDiv('div2');hideDiv('div4')">洗手液</span>
<span onClick="showDiv('div4');hideDiv('div1');hideDiv('div2');hideDiv('div3')">其他</span></p>
<div class="zhanyong"></div>
<div class="qingchu"></div>

<!--站内跳转，按导航条跳转到防护用品-->
<a name="fhyp"></a>
    <div id="father" style="position: relative;">
       
        <!--防护用品-->
        <!--左布局-->
        
      
        <!--右布局-->
        <div >
        <div class="clb_cc" style="margin:0 110px;">

            <!--口罩-->
            <div id="div1">

                <div class="left01">
                    <div class="xiaodiv">
                        <a href="https://sijilei.tmall.com/"><img src="duomeiti/kz1.png"></a>
                        <p>四季蕾白色防尘口罩 <a href="https://sijilei.tmall.com/">查看详情</a></p>
                    </div>
                    <div class="xiaodiv">
                        <a href="https://shop429617212.taobao.com/"><img src="duomeiti/kz2.png"></a>
                        <p>卫普盾一次性口罩 <a href="https://shop429617212.taobao.com/">查看详情</a></p>
                    </div>
                </div>

                <div class="left01">
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/100018298698.html"><img src="duomeiti/kz4.png"></a>
                        <p id="ys" align="center">恩惠医用外科口罩 <a href="https://item.jd.com/100018298698.html">查看详情</a></p>
                    </div>
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/100016846106.html#none"><img src="duomeiti/kz5.png"></a>
                        <p>一次性医用口罩 <a href="https://item.jd.com/100016846106.html#none">查看详情</a></p>
                    </div>
                </div>

                <div class="left01">
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/70283449993.html"><img src="duomeiti/kz6.png"></a>
                        <p>泰恩康一次性口罩 <a href="https://item.jd.com/70283449993.html">查看详情</a></p>
                    </div>
                    <div class="xiaodiv">
                        <a href="https://item.taobao.com/item.htm?spm=a230r.1.14.231.3d7327f3suhshC&id=638567774649&ns=1&abbucket=7#detail"><img src="duomeiti/kz3.png"></a>
                        <p>南极人一次性口罩 <a href="https://item.taobao.com/item.htm?spm=a230r.1.14.231.3d7327f3suhshC&id=638567774649&ns=1&abbucket=7#detail">查看详情</a> </p>
                    </div>
                </div>

            </div>


            <!--消毒湿巾 -->
            <div id="div2">

                <div class="left01">
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/100016620232.html"><img src="duomeiti/sj1.png"></a>
                        <p>赛仁 75%酒精湿巾 <a href="https://item.jd.com/100016620232.html">查看详情</a></p>
                    </div>
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/10026514639828.html"><img src="duomeiti/sj2.png"></a>
                        <p>百医卫仕 75％酒精湿巾 <a href="https://item.jd.com/10026514639828.html">查看详情</a></p>
                    </div>
                </div>

                <div class="left01">
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/100011559150.html#none"><img src="duomeiti/sj3.png"></a>
                        <p>安可新 75%酒精湿巾 <a href="https://item.jd.com/100011559150.html#none">查看详情</a></p>
                    </div>
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/100017830706.html#none"><img src="duomeiti/sj4.png"></a>
                        <p>粒米 75%酒精湿巾 <a href="https://item.jd.com/100017830706.html#none">查看详情</a></p>
                    </div>
                </div>

                <div class="left01">
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/68499939241.html"><img src="duomeiti/sj5.png"></a>
                        <p> 清风 餐具酒精湿巾 <a href="https://item.jd.com/68499939241.html">查看详情</a></p>
                    </div>
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/67918414201.html"><img src="duomeiti/sj6.png"></a>
                        <p>德佑 75%酒精消毒湿巾 <a href="https://item.jd.com/67918414201.html">查看详情</a></p>
                    </div>
                </div>

            </div>


            <!--洗手液 -->
            <div id="div3">

                <div class="left01">
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/231023.html#none"><img src="duomeiti/xs1.png"></a>
                        <p>蓝月亮 抑菌洗手液 <a href="https://item.jd.com/231023.html#none">查看详情</a></p>
                    </div>
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/3334330.html"><img src="duomeiti/xs2.png"></a>
                        <p>舒肤佳 抑菌洗手液 <a href="https://item.jd.com/3334330.html">查看详情</a></p>
                    </div>
                </div>

                <div class="left01">
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/100009576105.html#none"><img src="duomeiti/xs3.png"></a>
                        <p>滴露 抑菌洗手液 <a href="https://item.jd.com/100009576105.html#none">查看详情</a></p>
                    </div>
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/2301388.html#none"><img src="duomeiti/xs4.png"></a>
                        <p>狮王 泡沫洗手液 <a href="https://item.jd.com/2301388.html#none">查看详情</a></p>
                    </div>
                </div>

                <div class="left01">
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/100008054089.html#none"><img src="duomeiti/xs5.png"></a>
                        <p>优护优家 抗菌洗手液 <a href="https://item.jd.com/100008054089.html#none">查看详情</a></p>
                    </div>
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/100012726868.html#none"><img src="duomeiti/xs6.png"></a>
                        <p>隆力奇 抑菌洗手液 <a href="https://item.jd.com/100012726868.html#none">查看详情</a></p>
                    </div>
                </div>

            </div>


            <!--其他-->
            <div id="div4">

                <div class="left01">
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/10021861962887.html#none"><img src="duomeiti/hmj1.png"></a>
                        <p>医用护目镜 <a href="https://item.jd.com/10021861962887.html#none">查看详情</a></p>
                    </div>
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/100009686449.html#none"><img src="duomeiti/mxs1.png"></a>
                        <p>博益特 免洗洗手液 <a href="https://item.jd.com/100009686449.html#none">查看详情</a></p>
                    </div>
                </div>

                <div class="left01">
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/66752623309.html#none"><img src="duomeiti/yf1.png"></a>
                        <p>医用防护服隔离衣 <a href="https://item.jd.com/66752623309.html#none">查看详情</a></p>
                    </div>
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/10026442717881.html#none"><img src="duomeiti/st1.png"></a>
                        <p>一次性PVC手套家用防护 <a href="https://item.jd.com/10026442717881.html#none">查看详情</a></p>
                    </div>
                </div>

                <div class="left01">
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/10026372676496.html"><img src="duomeiti/st2.png"></a>
                        <p>奥丝达 一次性手套 <a href="https://item.jd.com/10026372676496.html">查看详情</a></p>
                    </div>
                    <div class="xiaodiv">
                        <a href="https://item.jd.com/100008825421.html#none"><img src="duomeiti/st3.png"></a>
                        <p>茶花 一次性手套 <a href="https://item.jd.com/100008825421.html#none">查看详情</a></p>
                    </div>
                </div>

            </div>


        </div>

	  </div>
    </div>


    <!--用来留白：-->
    <div class="zhanyong"></div>
    <div class="qingchu"></div>


    <!--站内跳转，按导航条跳转到关于我们-->
    <a name="gywm"></a>
    <div id="ziti" style="margin:0 123px;">
        <!--关于我们-->
        <h3>关于我们</h3>
        <div>
            <p>团队地址：<a href="http://map.sogou.com/#city=%u54c8%u5c14%u6ee8%2c%u54c8%u5e02&lq=%u9ed1%u9f99%u6c5f%u4e1c%u65b9%u5b66%u9662&uids=1_D1000148086302&originurltype=PC_VR_Point&c=14099395,5681274,15&page=1,10">黑龙江省哈尔滨市平房区哈南工业新区1号黑龙江东方学院</a></p>

            <p>开发人员：陈乐斌 田建邦 谢志远</p>

            <p>技术支持：<a href="http://www.dfxy.net/">黑龙江东方学院 好风凭借力技术组</a></p>

            <p>指导教师：黑龙江东方学院工程学院教师组</p>
        </div>
    </div>


    <!--用来留白：-->
    <div class="zhanyong"></div>
    <div class="qingchu"></div>



    <!--内容的div结束部分-->
</div>
</div>
</div>
</div>

</form>
</body>
</html>