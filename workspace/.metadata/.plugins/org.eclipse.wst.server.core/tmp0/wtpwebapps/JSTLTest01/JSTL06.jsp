<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
fmt라이브러리
- 숫자와 날짜를 사용자가 원하는 형식으로 변환하여 사용하도록 하는 기능, 
- 숫자, 날짜, 문자열을 변환하는 기능
- 국제화 태그 기능, 특정 지역에 따라 알맞은 언어로 메세지를 출력하도록 하는 기능
--%>

<c:set var="price">1000000</c:set>
${price / 3 }<br>

패턴 : <fmt:formatNumber value="${price / 3 }" pattern="#,###,###.##"></fmt:formatNumber><br>
통화단위: <fmt:formatNumber value="${price }" type="currency" currencySymbol="$"></fmt:formatNumber><br>
퍼센트 출력: <fmt:formatNumber value="${price}" type="percent" groupingUsed="false"></fmt:formatNumber><br>
<br><hr>

<h3>날짜 포매팅</h3>
<c:set var="now" value="<%=new java.util.Date() %>"></c:set>
<fmt:formatDate value="${now }" type="date" dateStyle="full"/><br>
<fmt:formatDate value="${now }" type="date" dateStyle="short"/><br>
<fmt:formatDate value="${now }" type="time" /><br>
<fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full" /><br>
<fmt:formatDate value="${now }" pattern="z a h:mm"/><br>
<fmt:formatDate value="${now }" type="date" pattern="yyyy/MM/dd"/><br>
<fmt:formatDate value="${now }" type="time" pattern="HH:mm:ss"/><br>
<fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full"/><br>
<h3>타임존을 캐나다으로 변경하여 날짜와 시간</h3>
<fmt:setTimeZone value="America/Los_Angeles"></fmt:setTimeZone>
<fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full"/><br>
<hr>

<h3>문자열로 표시된 날짜와 시간을 날짜로 파싱하는 방법</h3>
<c:set var="date" value="2022-03-24 13:55:55"></c:set>
<fmt:parseDate var="day" value="${date }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
날짜: ${day }<br>
<hr>


<!-- 
fmt:setLocale : 국제화 태그를 사용할 로케일을 지정, 기본값은en ex) ko, cn, jp, fr
fmt:budle : 태그 몸체에서 사용할 리소스의 번들을 지정, message 묶음으로 저장되어 있는 파일의 위치
fmt:message : 설정한 메세지를 출력
fmt:param : message에서 파라미터로 전달할 값을 지정

 -->


<h3>다국어 처리</h3>
<fmt:setLocale value="en_US"/>
<fmt:bundle basename="resource.test">
	<fmt:message key="name"></fmt:message>
	<fmt:message key="say"></fmt:message>
	<fmt:message key="say2"></fmt:message>
	<fmt:param value="허니제이"></fmt:param>
</fmt:bundle>




</body>
</html>