<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - 반복문 태그</title>
</head>
<body>

<h2>JSTL - forTokens 태그 연습</h2>
<%-- <%
// 키: 이름, 값: 전화번호
java.util.Map<String, String> map = new java.util.HashMap<String, String>();
map.put("이익준", "010-1111-1111");
map.put("김준완", "010-2222-2222");
map.put("채송화", "010-3333-3333");
map.put("양석형", "010-4444-4444");
map.put("안정원", "010-5555-5555");
%> --%>

<c:set var="map" value="<%=new java.util.HashMap<String, String>()%>"></c:set>
<c:set target="${map }" property="이익준" value="010-1111-1111"></c:set>
<c:set target="${map }" property="김준완" value="010-2222-2222"></c:set>
<c:set target="${map }" property="채송화" value="010-3333-3333"></c:set>
<c:set target="${map }" property="양석형" value="010-4444-4444"></c:set>
<c:set target="${map }" property="안정원" value="010-5555-5555"></c:set>

<c:forEach var="m" items="${map }">
	${m.key } : ${m.value }<br>
</c:forEach>
<br><hr>

<!-- Integer를 지정하는 ArrayList -->
<c:set var="" value="<%=new java.util.ArrayList<Integer>() %>"></c:set>
<c:set target="${list }" value="55"></c:set>
<c:set target="${list }" value="66"></c:set>
<c:set target="${list }" value="77"></c:set>
<c:set target="${list }" value="88"></c:set>
<c:set target="${list }" value="99"></c:set>
<%
java.util.List<Integer> list = new java.util.ArrayList<Integer>();
list.add(55);
list.add(66);
list.add(77);
list.add(88);
list.add(99);
out.print(list.toString());
%>
<c:forEach var="l" items="${list }">
	${l },
</c:forEach>
<br><hr>
<%-- 
forTokens 태그 : <c:forTokens></c:forTokens>
- 자바의 StringTokenizer 클래스를 사용하여 문자열에 포함된 특정문자를 토큰으로 지정한 후 반복 수행하는 기능과 같은 역활.
- 전화번호, 주민등록번호와 같이 문자열에 구분문자가 포함되어 있는 경우나, 데이터베이스에서 csv 파일을 다루고자 할 때 유용하게 사용할수 있다

forTokens속성
- var : 토큰 문자로 분리된 각 문자열을 저장하는 변수
- items: 토큰으로 지정되 문자열을 포함하는 원래 문자열 
- delims : 구분문자, 여러개 지정할 수 있음
 --%>
 
 
<h3>문자열을 구분문자로 분리하는 방법</h3>
<c:set var="animals">tiget,lion,hippo,elephant,hyena,cheeta,giraffe,leopard,zebra</c:set>

<c:forTokens var="ani" items="${animals}" delims=",">
	<c:out value="${ani }"></c:out><br>
</c:forTokens>
<br><hr>
</body>
</html>