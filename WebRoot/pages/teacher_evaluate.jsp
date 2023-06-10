<%@ page contentType="text/html; charset=utf-8" language="java"
         import="java.sql.*" errorPage="" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>regist page</title>
    <link href="../css/regist.css" rel="stylesheet" type="text/css"/>
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
            <input type="hidden" value="${sessionScope.message}" id="message"/>
        </c:if>
        <c:remove var="message" scope="session"/>
        <div class="window" align="left">
            <div class="tit">
                查看教师评价
            </div>
			<div align="left">
				教评ID：
				${sessionScope.evaluate.teacher.id}
			</div>
			<div align="left">
				教师姓名：
				${sessionScope.evaluate.teacher.name}
			</div>
			<div align="left">
				学生ID：
				${sessionScope.evaluate.student.id}
			</div>
			<div align="left">
				学生姓名：
				${sessionScope.evaluate.student.name}
			</div>
            <div align="left">
                表达能力：
                ${sessionScope.evaluate.score1}
            </div>
            <div align="left">
                专业素养：
                ${sessionScope.evaluate.score2}
            </div>
            <div align="left">
                课堂纪律：
                ${sessionScope.evaluate.score2}
            </div>

            <div align="left">
                教师评语：
                ${sessionScope.evaluate.evaluate}
            </div>


        </div>
    </form>
</center>
</body>
</html>