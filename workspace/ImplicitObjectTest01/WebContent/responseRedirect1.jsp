<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>response 내장 객체 = 리다이렉트 연습</h2>
현재 페이지는 reponseRedirect1.jsp페이지입니다.<br>

<%
response.sendRedirect("responseRedirect2.jsp");
%>

</body>
</html>