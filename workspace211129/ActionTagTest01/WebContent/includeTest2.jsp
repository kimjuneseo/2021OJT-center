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
String name = "전지현";
String pageName = "includedTest2.jsp";
%>
포함하는 페이지 includeTest2.jsp입니다.<br>
포함하는 페이지에 파라미터값을 전달합니다.<br>
<hr>

<jsp:include page="includedTest2.jsp">
	<jsp:param value="<%=name %>" name="name"/>
	<jsp:param value="<%=pageName %>" name="pageName"/>
</jsp:include>

</body>
</html>