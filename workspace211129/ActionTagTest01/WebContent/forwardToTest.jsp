<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포워드 처리되는 페이지</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String hobby = request.getParameter("hobby");
%>
포워딩되는 페이지 forwardToTest.jsp입니다.<br>
<b><%=id %></b>님의 취미는 <b><%=hobby %></b>입니다.

</body>
</html>