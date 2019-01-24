<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Student"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/CSS/attendingschool.css"
	rel="stylesheet" type="text/css">
<title>attending school</title>
</head>

<body onLoad="timeOut()">
	<%
		request.setCharacterEncoding("UTF-8");
		Student sdt = (Student) request.getAttribute("studentData");
		String time = (String) request.getAttribute("time");
	%>
	<script>
		function timeOut() {
			setTimeout(function() {
				window.location.href = '/Attendance_management_system/Menu';
			}, 10 * 1000);
		}
	</script>
	<center>
		<header>
			<a><%=sdt.getS_number()%></a><br>
			<a><%=sdt.getS_name()%></a>
		</header>

		<div class="a">
			<p>【<%=time %>の出席情報登録は完了しています】</p>
		</div>

		<div class="b">
			<p>※この画面は3秒後にメニューに戻ります</p>
		</div>
</body>
</html>
