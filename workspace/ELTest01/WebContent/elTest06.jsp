<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>EL Cookie 객체</h3>
쿠키 객체 출력: ${cookie }<br>
쿠리 객체의 name  출력: ${cookie.cookieName }<br>
쿠키 객체의 value 출력1: ${cookie.cookieName.value } <br>
쿠키 객체의 value 출력2: ${cookie.cookieName['value'] } <br>
쿠키 객체의 value 출력3: ${cookie['cookieName'].value } <br>
쿠키 객체의 value 출력4: ${cookie['cookieName']['value'] } <br>

</body>
</html>