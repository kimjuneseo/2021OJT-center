<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 처리</title>
</head>
<body>
<!-- 로그아웃 처리하는 방법: 모든 세션 로그아웃, 선택한 세션만 로그아웃 -->

<%
// session.invalidate(); // 모든 세션 무효
 session.removeAttribute("id"); // 해당 세션만 무효한다
 
%>

</body>
</html>