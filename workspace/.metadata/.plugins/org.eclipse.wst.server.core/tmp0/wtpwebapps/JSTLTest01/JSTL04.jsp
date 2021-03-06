<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>JSTL 반복문</h2>
<!-- 
1. forEach
- 배열, 컬렉션에 사용, 자바의 for, while과 같은 역활,
- forEach 태그이 속성
- var : 반복문을 제어하는 변수의 이름
- items : 실제로 반복 처리할 데이터를 지정

- index : 루프 실행에서 현재의 인덱스
- count : 루프 실행 횟수
- begin : 루프의 시작값
- end : 루프의 끝값
- step : 루프의 증감값
- first : 현재의 실행이 첫번쨰인 경우 true
- last : 현재의 실행이 마지막인 경우 true
- current : 컬렉션 중에서 현재 루프에서 사용할 객체

2. forTokens

 -->
 <h3>1부터 10까지 1씩 증가하는 값의 합</h3>
 <c:set var="sum" value="0"></c:set>
 <c:forEach var="i" begin="1" end="10" step="1">
 	<c:out value="${i }"/>
	 <c:set var="sum" value="${sum+i }"></c:set>
 </c:forEach>
 합계: ${sum }<br>
 <hr>
 
 <h3>1부터 10까지 중에서 홀수의 합</h3>
 <c:set var="sum" value="0"></c:set>
 <c:forEach var="i" begin="1" end="10" step="2">
 	<c:out value="${i }"/>
 	<c:set var="sum" value="${sum + i }"/>
 </c:forEach>
  합계: ${sum }<br>
 <hr>
 
 <h3>1부터 10까지 홀수의 합 : if 태그 사용</h3>
  <c:set var="sum" value="0"></c:set>
  <c:forEach var="i" begin="1" end="10" step="2">
  	<c:if test="${i % 2 == 1 }">
 		<c:out value="${i }"/>
		<c:set var="sum" value="${sum+i }"/>
	</c:if>
 </c:forEach>
   합계: ${sum }<br>
 <hr>
 
 <h3>forEach 태그를 사용하여 배열을 처리하는 방법</h3>
 <!-- varStatus 속성: 인덱스의 특성을 사용하는 속성, index: 배열의 인덱스, count: 배열의 회전수 -->
 <c:set var="sum" value="0"></c:set>
 <c:set var="intArray" value="<%=new int[]{10, 20, 30, 40, 50} %>"></c:set>
 <c:forEach var="i" items="${intArray }" varStatus="status">
 		[${status.index }], [${status.count }번 회전]<c:out value="${i }"></c:out><br>
 		<c:set var="sum" value="${sum+i }"></c:set>
 </c:forEach>
    합계: ${sum }<br>
 <hr>
 
 <h3>forEach 태그를 사용한 배열 처리</h3>
 <c:set var="score" value="<%=new int[] {55, 66, 77, 88, 99} %>"/>
 <c:forEach var="i" items="${score }" begin="1" end="3" varStatus="status">
 	<c:if test="${status.first }">
 		${status.begin }번 인덱스부터 반복을 시작합니다.<br>
 	</c:if>
 	현재 인덱싀 ${status.index }, 현재 실행 횟수:${status.count }, 현재 배열의 값 : ${i}<br>
 	<c:if test="${status.last }">
 		${status.end }번 인덱스가 반복을 종료합니다.
 	</c:if>
 </c:forEach>
 
 
 <!-- forEach 태그 활용 문제 
 조건 : EL과 JSTL을 활용하는 문제입니다,
 문제1번) 파라미터로 구구단을 단을 입력받아서 해당하는 단을 출력하는 프로그램을 작성하시오.
 
 문제2번) 구구단 2단부터 9단까지를 table을 사용하여 출력하는 프로그램을 작성하시오.
 -->
 문제 1번
<c:set var="num" value="${param.num }"/>
<c:forEach var="i" begin="0" end="9">
 	${num }* ${i } = ${num * i }<br>
 </c:forEach>
 <hr>
 문제 2번
<table border="1px">
	<c:forEach var="i2" begin="1" end="9">
	    <tr>
		<c:forEach var="j" begin="1" end="9">
	    <td>
			${i2 }* ${j } = ${i2 * j }	<br>
		</td>
		</c:forEach>
	</tr>
	</c:forEach> 
</table>
		
		
 
 
</body>
</html>