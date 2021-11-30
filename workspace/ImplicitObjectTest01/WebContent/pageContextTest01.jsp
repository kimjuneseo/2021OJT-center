<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageContext 내장객체</title>
</head>
<body>
<%
/* 
pageContext 내장체
- 현재 JSP 페이지의 컨텍스트 정보를 볼 때 사용
- 주로 다른 내장객체를 구할 때 사용, 페이지의 흐름제어, 에러 데이터 파악 등에 사용

- getRequest(); reqeust 내장객체를 리턴
- getResponese(): response 내장객체를 리턴
- getOut(): out 내장객체를 구현
- getSession(): session 내장객체를 리턴
- geServletContext(): application 내장객체를 리턴
- getPage(): page 내장객체를 리턴
- getServletConfig(): config 내장객체를 리턴 
- getExecption(): exception내장객체를 리턴

*/
%>
</body>
</html>