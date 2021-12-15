<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인클루드되는 페이지</title>
</head>
<body>

<%
String name = request.getParameter("name");
%>
포함하는 페이지 includedTest.jsp입니다.<p>
<b><%=name %></b>님이 입장하였습니다.
<hr>

</body>
</html>