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
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

session.setAttribute("userId", id);
session.setAttribute("userPwd", pwd);
%>

<h2>EL session 내장객제 사용</h2>
아이디 :  ${sessionScope.userId }<br>
비밀번호 : ${sessionScope.userPwd }	<br>

<hr>
아이디 :  ${sessionScope.userId }<br>
비밀번호 : ${sessionScope.userPwd }	<br>

</body>
</html>