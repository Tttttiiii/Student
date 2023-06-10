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
    url += "/Student/SearchScorePartCountServlet?search_type=" + $("#search_type").val();
    url += "&value=" + encodeURI(encodeURI($("#value").val()));
    $.post(url, null, function (rs) {
        var part = rs.partList;
        var count = rs.countList;
		var dom = document.getElementById("container");
		var myChart = echarts.init(dom);
		var app = {};
		var option;
		option = {
			xAxis: {
				type: 'category',
				data: part
			},
			yAxis: {
				type: 'value'
			},
			series: [
				{
					data: count,
					type: 'bar'
				}
			]
		};

		if (option && typeof option === 'object') {
			myChart.setOption(option);
		}
    }, "json");
}


