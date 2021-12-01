<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 에러처리</title>
</head>
<body>

<%
/*  
JSP에서 발생하는 에러 메시지
- 400 : Bad Request, 요청 실패, 서버가 요청 사항을 이해라지 못했을 때
- 401.* : 접근 권한이 없음
- 403.* : 접근 금지, Forbidden
- 404 : Not Found, 요청 페이지를 찾을 수 없을 때, 가장 많이 발생하는 에러, ex) 페이지 일므이 잘못 되었을 때, 경로가 잘못 되었을 때....
- 405 : Method Not Allowed, 해당 메소드를 허용할 수 없음,
- 406 : Not Accepable, 요청을 받아들일 수 없음
- 407 : Proxy Authentication Request, Proxy 인증이 필요함.
- 408 : Request Timeout, 요청시간이 지남;.
- 409 : Confilct, 충돌이 발생,
- 410 : Gome, 영구적으로 사용할 수 없음.
- 411 : Length Reqireed, 페이지가 크키 또는 길이에 인증이 필요함
- 414: Reqhest URI Too large, 페이지

- 500: Internal Server E 
*/
%>

<%
Date date = new Date();
SimpleDateFormat sef = new SimpleDateFormat ("yyyy-MM-dd");
String today = sef.format(date);
%>

<!-- 고의로 에러를 발생시킴 -->
<h2>오늘 날짜는 <%=toda %>입니다</h2>
</body>
</html>