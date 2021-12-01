<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보처리</title>
</head>
<body>

<h2>입력 정보 확인 - 세션 속성 설정 페이지</h2>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

// 세션 설정하는 방법
session.setAttribute("id", id); // 이름과 값의 형태로 사용
session.setAttribute("pwd", pwd);
%>	
<!-- id와 pwd를 세션으로 설정하였습니다. -->

<!-- // 세션 가져오는 방법 -->
id 속성의 값 : <%=session.getAttribute("id") %><br>
pwd 속성의 값 : <%=session.getAttribute("pwd") %><br>
</body>
</html>