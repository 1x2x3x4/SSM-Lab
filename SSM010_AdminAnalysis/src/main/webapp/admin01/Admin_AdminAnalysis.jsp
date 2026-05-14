<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>客户后台管理系统</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/admin01/css/pintuer.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/admin01/css/admin.css">
    <script src="${pageContext.request.contextPath}/admin01/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/admin01/js/analysis.js"></script>
</head>
<body>

<div class="panel admin-panel">
    <div class="panel-head" >
        <strong class="icon-reorder"> 客户统计</strong>
    </div>
    <div class="panel-head" id="main" style="width: 100%;  height:520px;">
        <div>
            <p>男性人数：<span>${sexCount['男']}&nbsp;&nbsp;人</span></p>
            <p>女性人数：<span>${sexCount['女']}&nbsp;&nbsp;人</span></p>
        </div>
        <div id="pieChart" style="width: 100%;height:350px;"></div>
    </div>
</div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('pieChart'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '客户性别比例',
            left: 'center'
        },
        tooltip: {
            trigger: 'item'
        },
        legend: {
            orient: 'vertical',
            left: 'left',
        },
        series: [
            {
                name: '性别',
                type: 'pie',
                radius: '55%',
                data: [
                    {value: ${sexCount['男']}, name: '男性'},
                    {value: ${sexCount['女']}, name: '女性'}
                ],
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>

</body>
</html>
