<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠기를 만드는 페이지</title>
</head>
<body>

<%
// 웹에서 페이지를 연결을 유지하는 2가지 속성: cookie, session
// cookie(쿠키):  연결정보가 사용자 측에 저장됨, 안전이 보장되지 않음
// session(세션): 연결정보다 서버 측에 저장됨, 안정이 보장
%>

<%
// 쿠기생성
String cookieName = "cookieId";
Cookie cookie = new Cookie(cookieName, "holybang"); // 1단계: 쿠키생성
cookie.setMaxAge(1*60); 	// 2단계: 만료시간 설정, 초 단위의 시간, 10분, ex) 1주일의 만료시간 설정: 60*60*24*7
response.addCookie(cookie); // 3단계 : 생성한 쿠키를 사용자 컴퓨터에 보냄. 
%>

<h2>쿠키를 만드는 페이지</h2>
"<%=cookieName %>" 쿠키가 생성되었습니다.<br>
<form action="useCookie.jsp" method="post">
	<input type="submit" value="생성된 쿠키 확인">
</form>
</body>
</html>