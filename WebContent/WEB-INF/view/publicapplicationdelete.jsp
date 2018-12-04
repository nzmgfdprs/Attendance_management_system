<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.PublicStatus" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>public application status</title>
</head>
<%
int deleteID = 0;
ArrayList<PublicStatus> deletePublic = (ArrayList<PublicStatus>) request.getAttribute("deletePublic");
%>
<header> こちらの情報を削除しますか？ </header>
<body>
	<center>
		<table border="1" class="table">
			<tr>
				<th class="th1">申請日</th>
				<th class="th2">理由</th>
				<th class="th3">場所</th>
				<th class="th4">期間</th>
			</tr>
				<%
					for (PublicStatus ps : deletePublic) {
						deleteID = ps.getPublicId();
				%>

				<tr>
					<th><%=ps.getPublicDate()%></th>
					<th><%=ps.getReason()%></th>
					<th><%=ps.getPlace()%></th>
					<th><%=ps.getPeriod()%></th>

				</tr>

				<%
					}
				%>
		</table>
</body>
<footer>
	<div id="bottom">
		<form action="/Attendance_management_system/Menu"
			method="get" name='form-back'>
			<input type="submit" value="メニューへ">
		</form>
		<form action="/Attendance_management_system/DeletePublic"
			method="post">
			<input type="hidden" name="deleteId" value=<%=deleteID %>>
			<input type="submit" value="削除" >
		</form>
	</div>
</footer>
</html>