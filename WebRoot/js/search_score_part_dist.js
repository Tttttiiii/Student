// AJAX异步查询成绩
$(function () {
    $("#search_score").click(
        function () {
            if ($("#search_type").val() != "stu_all"
                && $.trim($("#value").val()) == "")
                alert("请输入关键字。");
            else {
                showData();
            }
        });
});

// 整体调用函数
function show() {
    showData();
}

// 根据条件查询数据
function showData() {
    var url = "";
    url += "/Student/SearchScorePartDistServlet?search_type=" + $("#search_type").val();
    url += "&value=" + encodeURI(encodeURI($("#value").val()));
    $.post(url, null, function (rs) {
        var data = rs;
		var dom = document.getElementById("container");
		var myChart = echarts.init(dom);
		var option;
		option = {
			
			tooltip: {
			        trigger: 'item',
			        formatter: '{a} <br/>{b} : {c} ({d}%)'
			    },
			    series: [
			        {
			            name: '成绩分布',
			            type: 'pie',
			            radius: '55%',
			            center: ['50%', '60%'],
			            label:{
			                show:true,
			                position:'inner',
			                formatter:'{d}%'
			            },
			            data: data,
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

		if (option && typeof option === 'object') {
			myChart.setOption(option);
		}
    }, "json");
}


