<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포워드 처리하는 페이지</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
%>
포워드하는 페이지의 내용은 나타나지 않습니다.<br>

<jsp:forward page="forwardToTest.jsp"/>

forwardTest.jsp 페이지의 내용은 절대로 표시되지 않습니다.

</body>
</html>