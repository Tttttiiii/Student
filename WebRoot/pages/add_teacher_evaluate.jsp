<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>regist page</title>
		<link href="../css/regist.css" rel="stylesheet" type="text/css" />
		<script language="javascript" type="text/javascript"
			src="../js/My97DatePicker/WdatePicker.js">
</script>
		<script src="../js/jquery-1.8.3.min.js">

</script>
		<script src="../js/search.js">
</script>
	</head>

	<body>
		<center>
			<form action="/Student/AddTeacherEvaluateServlet" method="post">
				<c:if test="${sessionScope.message!=null}">
					<input type="hidden" value="${sessionScope.message}" id="message" />
				</c:if>
				<c:remove var="message" scope="session" />
				<div class="window" align="left">
					<div class="tit">
						添加教师评价
					</div>
					<div align="left">
						选择教师：
						<select name="tec_id">
							<c:forEach items="${sessionScope.list_teacher}" var="teacher">
								<option value="${teacher.id}">
										${teacher.name}
								</option>
							</c:forEach>
						</select>
					</div>
					<div align="left">
						表达能力：
						<input type="text" name="score1"  />
					</div>
					<div align="left">
						专业素养：
						<input type="text" name="score2"  />
					</div>
					<div align="left">
						课堂纪律：
						<input type="text" name="score3"  />
					</div>
					
						<div align="left">
							教师评语：
                            <textarea rows="5" cols="60" name="evaluate"></textarea>
						</div>

						<br />
						<div align="right">
							<input type="submit" value="添加"
								style="width: 65px; height: 35px; line-height: 35px; overflow: hidden; text-align: center; float: left; margin-left: 270px;" />
						</div>
					
				</div>
			</form>
		</center>
	</body>
</html>