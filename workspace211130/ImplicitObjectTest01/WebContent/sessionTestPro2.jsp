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
String id = request.getParameter("id");
session.setAttribute("sessionId2", id);
%>

sessionId1 = <%=session.getAttribute("sessionId1") %><br>
sessionId2 = <%=session.getAttribute("sessionId2") %>
<a href="sessionRemove2.jsp">세션2 삭제</a>&ensp;
<a href="sessionRemoveAll.jsp">모든 세션 삭제</a>
</body>
</html>