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

</body>
</html>