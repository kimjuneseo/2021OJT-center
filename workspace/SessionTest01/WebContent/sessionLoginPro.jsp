<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
<!-- 세션을 처리하는 페이지 -->
<!-- DB 테이블에 아이디와 비밀번호가 각각 holybang과 1234로 설정되었다고 가정 -->

<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

session.setAttribute("id", id); // 세션 생성
response.sendRedirect("sessionMain.jsp");
%>
</body>
</html>