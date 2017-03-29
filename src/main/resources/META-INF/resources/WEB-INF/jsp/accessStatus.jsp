<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %><%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");

%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>

<c:set var="ctx" value="${pageContext['request'].contextPath}"/>

<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <!-- 引入 echarts.js -->
    <script src="/js/echarts.min.js" ></script>
    <script src="/js/china.js"></script>

    <link rel="stylesheet" href="/css/all.css" />
</head>
<body>
    <script src="/js/canvas-nest.min.js" count="200" zindex="-2" opacity="0.5" color="47,135,193" type="text/javascript"></script>

    <!--------------------header begin-------------------->
    <!---------------logo beign---------->
    <div class="box logoBar2 cf">
        <div class="logoBarLeft">
            此处略去logo
        </div>
    </div>
    <!---------------logo end------------->
    <!---------------导航 beign--------->
    <div class="box navList2">
        <div id="lava"></div>
        <ul id="ulNav">
            <li class="liNav firstLiNav shortNav"><a href="/" class="aNav aNavSel">a</a></li>
            <li class="liNav longNav"><a href="/" class="aNav">b</a></li>
        </ul>
    </div>
    <!---------------导航 end----------->
    <!--------------------header end---------------------->

    <!-----------------内页  begin------------------>
    <div class="contentBk nyBk">
        <div class="box mb25">
           <span style="font-weight:bold;">q</span>： <a href=/>q</a> || <a href=/>w</a> || <a href=/>r</a>
        </div>
        <div class="box"><p> </p></div>
        <div class="box mb25"></div>
        <div class="box" style="width: 100%;height:12px;"></div>

        <div class="box mb25">
            <div class = "box" style="width: 100%; height:450px">
                <div style="width: 26%;float: left;height:450px;"></div>
                <div id="div_ts" style="width: 48%;float: left;height:450px;"></div>
           </div>
        </div>

       <div class="box" style="width: 100%;height:15px;"></div>

       </div>
    </div>
    <!-----------------内页  end------------------>

    <script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('div_ts'));
        var context  = eval('${data.result}');
        //名称数组
        var nameArray = new Array();
        //数据
        var valueArray= new Array();

        //进行数据处理
        for (var i=context.length; i>0; i--) {
            nameArray.push(context[i-1].name)
            valueArray.push(context[i-1].value)
        }
        option = {
            title: {
                text: '用户地域排行榜Top',
                subtext: ' --数据来自头条请求日志'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            toolbox: {
                show: true,
                feature: {
                    restore: {},
                    dataView: {readOnly: false},
                    saveAsImage: {}
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'value',
                boundaryGap: [0, 0.01]
            },
            yAxis: {
                type: 'category',
                data: nameArray
            },
            series: [
                {
                    name: '请求人数',
                    type: 'bar',
                    data: valueArray
                }
            ]
        };
       // 使用刚指定的配置项和数据显示图表。
       myChart.setOption(option);
   </script>


</body>
</html>