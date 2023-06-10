<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>search page</title>
<link href="../css/search.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="../js/search_teacher_evaluate.js" type="text/javascript"></script>
<script src="../js/search.js" type="text/javascript"></script>
<style type="text/css">

 #pl{
        width: 200px;
        overflow:hidden;
        text-overflow:ellipsis;
        white-space: nowrap;/*加宽度width属来兼容部分浏览*/
    }
</style>
</head>

<body>
	<center>
		<div class="window">
			<div class="searchbox tit">
				查找教评： <select id="search_type">
					<option value="all">查找全部</option>
					<option value="tec_name">教师名称</option>
				</select> <input id="value" type="text" style="width: 200px; height: 20px;"
					name="value" /> <input id="search_teacher" type="button"
					value="  查询  " />
			</div>
			<center id="center">
				<table id="table" width="850px" border="1px" cellspacing="0"
					cellpadding="5" bordercolor="#999999">
					<tr align="center">
						<td width="50px">编号</td>
						<td width="50px">教评ID</td>
						<td width="80px">教师姓名</td>
<%--						<td width="100px">学生</td>--%>
						<td width="80px">表达能力</td>
						<td width="80px">专业素养</td>
						<td width="80px">课堂纪律</td>
						<td width="200px;">教师评语</td>
						<td width="100px">操作</td>
					</tr>
				</table>
			</center>
		</div>
	</center>
</body>
</html>