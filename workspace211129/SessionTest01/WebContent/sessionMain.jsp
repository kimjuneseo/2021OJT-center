<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>

<%
// 세션의 값을 획득
String id = (String)session.getAttribute("id");

// 세션의 값을 확인
if(id == null) { // 세션의 값이 없을 때 - 로그인폼으로 이동
	response.sendRedirect("sessionLoginForm.jsp");
}
// 세션의 값이 있을 떄 - 세션의 값을 출력하여 확인
%>

<h2>세션을 확인하는 페이지</h2>
<p><%=id %>님이 로그인하였습니다.</p>

<form action="sessionLogout.jsp" method="post">
	<input type="submit" value="로그아웃">
</form>
</body>
</html>