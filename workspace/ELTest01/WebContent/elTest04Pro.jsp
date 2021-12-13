<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8"); %>
	
	<h3>El 요청 파라미터의 데이터를 사용</h3>
	문제) EL을 사용하여 파라미터의 값을 출력하시오.<br>
	
	이름 : ${param.name }<br>
	사용언어:
	${paramValues.language[0] }&nbsp;
	${paramValues.language[1] }&nbsp;
	${paramValues.language[2] }&nbsp;
	${paramValues.language[3] }&nbsp;
	${paramValues.language[4] }&nbsp;
	
<!--
EL의 장점
 - paramValues에 해당하는 값이 없어도 에러가 발생하지 않음, null로 처리
 - request 내장 객체를 상요하지 않고, param, paramValues 객체를 사용하여 요청한 파라미터의 값을 바로처리
 
-->
	
</body>
</html>