<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - core 라이브러리</title>
</head>
<body>

<h2>JSTL core 라이브러리 - 조건문, 반복문</h2>
<%-- 
1. 조건문: if, choose, when, otherwise 
1-1. if 태크의 속성
- test : 검사 조건
- var : 검사 조건의 계산 결과값을 저장할 변수
- scope : 검사을 저장할 EL 변수의 영역
--%>

<c:set var="number" value="10"></c:set>

<!-- 1번, number가 양수인지 음수인지를 판별하시오 -->
<!-- 1번 방법 -->
<c:if test="${number > 0 }">
	${number }는 양수입니다.<br>
</c:if>

<c:if test="${number < 0 }">
	${number }는 음수입니다.<br>
</c:if>

<!-- 2번 방법 -->
<c:choose>
	<c:when test="${number > 0 }">
		${number }는 양수입니다.
	</c:when>
	<c:otherwise>
		${number }는 음수입니다.
	</c:otherwise>
</c:choose>

<!-- 
조건 : JSP 스크립트 요소를 사용하지 않고, El과 JSTL을 사용하여 문제를 해결하시오
문제1)Member 클래스의 객체를 만들어서 정보를 확인하고 성년인지 미성년인지 판별하시요 
- 20세 이상은 성년, 20세 미만은 미성년
ex) 김성실님은 21세로 성년입니다. 최미소님은 18세로 미성년입니다.

문제2) 월을 파라미터로 받아서 계절을 판별하는 프로그램을 작성하시오.
- 봄: 3,4,5 여름: 6,7,8 가을: 9,10,11 겨울: 12,1,2
ex) 7월은 여름입니다. 12월은 겨울입니다.

문제3) 상품의 가격을 파라미터로 받아서 상품의 세금을 더해서 출력하는 프로그램을 계산하시오.
- 조건 : 100000만원 미만의 상품은 세금을 10%로 적용하고, 1000000이상인 상품은 세금을 15%로 적용하시오.
- 상품 가격: 10000, 세금 10%, 판매 가격 11000


-->
<br><hr>
1번 문제
<br>
<jsp:useBean id="m" class="member.Member"/>
<c:set target="${m}" property="id" value="ygx"></c:set>
<c:set target="${m}" property="pwd" value="1234"></c:set>
<c:set target="${m}" property="name" value="김성실"></c:set>
<c:set target="${m}" property="tel" value="010-1234-1234"></c:set>
<c:set target="${m}" property="addr" value="서울시 용상구 신용산로"></c:set>
<c:set target="${m}" property="age" value="40"></c:set>

<c:choose>
	<c:when test="${m.age >= 20 }">
		${m.name }는 성년입니다.
	</c:when>
	<c:otherwise>
		${m.name}는 미성년입니다.
	</c:otherwise>
</c:choose>

<br><hr>
2번 문제
<br>
<c:choose>
	<c:when test="${param.season <= 2 || param.season == 12}">
		${param.season }는 겨울입니다
	</c:when>
		<c:when test="${param.season >= 3 && param.season <= 5}">
		${param.season }는 봄입니다
	</c:when>
	<c:when test="${param.season >= 6 && param.season <= 8}">
		${param.season }는 여름입니다
	</c:when>
	<c:when test="${param.season >= 9 && param.season <= 11}">
		${param.season }는 가을입니다
	</c:when>
</c:choose>


<br><hr>
3번 문제
<br>
<c:set var="price" value="${ param.price}"></c:set>
<c:choose>
	<c:when test="${param.price < 100000}">
		<c:set var="tax" value="${price * 0.1 }"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="tax" value="${price * 0.15 }"></c:set>
	</c:otherwise>
</c:choose>
<c:set var="total" value="${price + tax }"></c:set>

상품가격: ${total }원

</body>
</html>