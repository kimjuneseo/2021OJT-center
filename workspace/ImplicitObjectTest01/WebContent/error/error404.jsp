<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404에러 처리</title>
</head>
<body>
<%-- 에러 발생에 대해서 응답하는 페이지 --%>
<%response.setStatus(HttpServletResponse.SC_OK);%>
<h2>404 에러 발생</h2>
<p>요청한 페이지는 존재하지 않습니다.</p>
</body>
</html>