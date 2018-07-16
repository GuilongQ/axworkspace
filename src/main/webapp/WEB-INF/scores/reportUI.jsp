<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Highcharts Example</title>

		<style type="text/css">

		</style>
	</head>
	<body>
<script src="${initParam.p }/assets/highcharts/highcharts.js"></script>
<script src="${initParam.p }/assets/highcharts/exporting.js"></script>
<script src="${initParam.p }/assets/highcharts/export-data.js"></script>

<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>



		<script type="text/javascript">

Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: '${title}成绩报表'
    },
    subtitle: {
        text: ''
    },
    xAxis: {
        categories: [
        	<c:forEach items="${courseList }" var="c">
	        	'${c.cname }', 
	        </c:forEach>         
        ],
        crosshair: true
    },
    yAxis: {
        min: 0,
        title: {
            text: '分数'
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [
    	<c:forEach items="${map }" var="e">
	    	{
	    		name:'${e.key }',
	    		data:${e.value }
	    	},
	    </c:forEach>
	]
});
		</script>
	</body>
</html>























