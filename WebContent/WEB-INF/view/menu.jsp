<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/CSS/menu.css"
	rel="stylesheet" type="text/css">
<title>menu</title>
</head>
<header>登校の場合はバーコードをかざしてください。</header>
<body onLoad="focusText()">
	<center>
		<script>
			function focusText() {
				document.getElementById('focus').focus();
			}
		</script>
		<div class="display-none">
			<form action="/Attendance_management_system/AttendingSchool"
				method="get">
				<input type="text" name="barcodeData" id="focus">
			</form>
		</div>
		<div id="bottom">
			<form action="/Attendance_management_system/BarcodeReading"
				method="get">
				<button type="submit" name="action" value=1>早退</button>
				<br>
				<button type="submit" name="action" value=2>公欠申請</button>
				<br>
				<button type="submit" name="action" value=3>公欠申請状況</button>
				<br>
			</form>
		</div>
</body>
</html>