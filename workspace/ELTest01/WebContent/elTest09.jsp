<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
EL에서 사용하는 연산자
1. 산술 연산자 : +, -, *, /(몫, div), %(나머지, mod)
2. 논리 연산자 : &&(and), ||(or), !(not)
 -->
 
 <h2>EL 산술 연산자</h2>
 5 + 7 = ${5+7 }<br>
 8 - 3 = ${8-3 }<br>
 6 * 3 = ${6*3 }<br>
 10 / 3 = ${10/3 }<br><!--3.3333333333333335  -->
 10 % 3 = ${10%3 }<br>
 10 div 3 = ${10 div 3 }<br>
 10 mod = ${10 mod 3 }<br>
 
</body>
</html>