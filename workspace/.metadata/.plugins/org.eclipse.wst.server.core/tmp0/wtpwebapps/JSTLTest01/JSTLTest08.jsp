<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>JSTL - fn 라이브러리</h2>
<c:set var="s1" value="JSTL을 공부하고 있습니다."></c:set>
<c:set var="s2" value="JSTL"></c:set>
<c:set var="s3" value="공부"></c:set>
<c:set var="s4" value="lion,hnyean,cheetah,giraffe,zebra,hippo,elephant,leopard"></c:set>

<h3>fn 라이브러리를 사용하여 문자열 처리</h3>
s1의 길이: ${fn:length(s1) }<br>
대문자 : ${fn:toUpperCase(s1) }<br>
소문자 : ${fn:toLowerCase(s1) }<br>
문자열 추출 : ${fn:substring(s1, 0, 4) }<br>
문자열 추출(뒤쪽) : ${fn:substringAfter(s1, s3) }<br>
문자열 추출(앞쪽) : ${fn:substringBefore(s1, s3) }<br>
문자열 트림 : "${fn:trim(s1) }"<br>
문자열 변경 : ${fn:replace(s4, ',', '-') }<br>
인덱스 조회 : ${fn:indexOf(s1,s3) }<br>
문자열 포함 여부(맨 앞) : ${fn:startsWith(s1, s2) }<br>
문자열 포함 여부(맨 뒤) : ${fn:endsWith(s1, s3) }<br>
문자열 포함 여부(어디에나) : ${fn:contains(s1, "JAVA") }<br>



</body>
</html>