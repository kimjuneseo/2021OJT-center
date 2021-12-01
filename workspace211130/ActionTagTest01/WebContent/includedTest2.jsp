<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String pageName = request.getParameter("pageName");
%>
파라미터값을 전달받아 실행되는 포함되는 페이지 <%=pageName %>입니다.<br>
<b><%=name %></b>님이 입장하였습니다.
<hr>

</body>
</html>