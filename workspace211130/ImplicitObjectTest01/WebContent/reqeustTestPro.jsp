<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 처리</title>
<style >
table {width: 400px; border: 1px solide block; borderc}
</style>
</head>

<body>
<%
request.setCharacterEncoding("utf-8");
String num = request.getParameter("num");
String name = request.getParameter("name");
String grade = request.getParameter("grade");
String subject = request.getParameter("subject");
%>
<h2>학생 정보 확인</h2>
<table>
	<tr>
		<th>학번</th>
		<th><%= num %></th>
	</tr>
	<tr>
		<th>이름</th>
		<th><%=name %></th>
	</tr>
		<tr>
		<th>학년</th>
		<th><%=grade %></th>
	</tr>
		<tr>
		<th>학번</th>
		<th><%=subject %></th>
	</tr>
		<tr>
		<th>학번</th>
		<th></th>
	</tr>
	
</table>
</body>
</html>