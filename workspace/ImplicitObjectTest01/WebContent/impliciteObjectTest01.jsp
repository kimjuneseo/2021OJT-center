<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체의 개념</title>
</head>
<body>

<%
/*
내장객체(Implicit Object) 
- 1. JSP에서 필수적으로 사용하는 9개의 객체를 객체의 생성없이 바로 사용할 수 있도록 제공하는 객체
- 2. request, response, out, session, application, pageContext, page, config, excetion
- 3. 이 중에서 많이 사용되는 내장객체 - request, reponse, out, session

영역객체 
- 1. 웹페이지에서 데이터의 연결을 유지하는 영역(범위)을 가지는 객체
- 2. page, request, session, application
- page 객체: 웹브라우저의 요청에 대해서 1개의 페이지만 대응하는 범위를 가지는 객체
- request 객체: 웹브라우저의 요청에 대해서 응답이 이루어질 떄까지 범위를 가지는 객체, 범위는 1페이지 또는 그 이상이 될수도 있다.
- session 객체: 세션이 헤제될때까지 범위를 가지는 객체
- application 객체: 하나의 웹프로그램이 실행되는 동안 범위를 가지는 객체




*/
%>

</body>
</html>