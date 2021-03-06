<%@page import="java.util.HashMap"%>
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
<h2>JSTL - core 라이브러리</h2>
<%-- 
1.<c:set></c:set>
- EL 변수의 값이나 EL 변수의 프로퍼티의 값을 지정할 때 사용

int x = 10;
1번. EL 변수를 생성
<c:set var="" value="" [scope="영역"]></c:set>
- var : 값을 저장할 EL 변수의 이름을 지정
- value : EL 변수가 가지는 값
- scope : EL 변수를 저장할 영역을 지정, page, reqeust, session, application, 기본값은 page

1-2. 프로퍼티를 생성
<c:set target="" property="" value=""></c:set>
- target : 프로퍼티의 값을 설정할 대상 객체를 지정, 표현식이나, EL 변수를 사용, 사용 대상은 자바빈 객체 또는 Map 객체이어야 함 
- property : 설정할 프로퍼티의 이름을 지정, target인 자바빈의 경우 프로퍼티 이름에 해당하는 setter 메소드가 있어야 함
- Map인 경우는 map.put(프로처티 이름, 값)을 이용하여 설정함.
- value : 프로퍼티의 값을 지정

2. <c:remove><c:remove>
-- set 태크로 지정한 변수를 삭제할 떄 사용.
<c:remove var="" [scope="영역"]<c:remove>

--%>

<!-- 변수 생성 1번 방법: 좀 더 선호 -->
<c:set var="name" value="홍길동"> </c:set>
사용자의 이름은 ${name}입니다.
<!-- 변수 생성 2번 방법ㄴ -->
<c:set var="id" value="holybang"></c:set>
당신의 아이디는 ${id }입니다.

<!-- 프로퍼티 생성1번 방법 -->
<%-- <% member.Member m = new member.Member(); %> --%>
 <jsp:useBean id="m" class="member.Member"/>
<c:set target="${m}" property="id" value="ygx"></c:set>
<c:set target="${m}" property="pwd" value="1234"></c:set>
<c:set target="${m}" property="name" value="리정"></c:set>
<c:set target="${m}" property="tel" value="010-1234-1234"></c:set>
<c:set target="${m}" property="addr" value="서울시 용상구 신용산로"></c:set>
<c:set target="${m}" property="age" value="24"></c:set>

아이디: ${m.id }<br>
비밀번호: ${m.pwd }<br>
이름: ${m.name }<br>
전화번호: ${m.tel }<br>
주소: ${m.addr }<br>
나이: ${m.age }<br> 
모든 정보 출력 :${m } <br>
<hr>

<%-- 프로퍼티 생성2번 - Map을 다루는 방법 --%>
<%-- key: 아이디, value: 이름 --%>
<% java.util.Map<String, String> map = new HashMap<String, String>(); %>
<%-- <% map.put("wayb", "노제"); %> --%>
<c:set target="<%=map %>" property="wayb" value="노제"></c:set>
이름: <%=map.get("wayb") %> <br>
<hr>

<!-- 변수 삭제 : remove -->
이름 : ${name } <br>
<c:remove var="name"/>
이름: ${name }<br>
<hr>

<!-- 변수의 이름은 같지만 사용 영역이 다를 때의 변수 삭제 -->
<c:set var="name" value="이익준" scope="request"></c:set>
<c:set var="name" value="채송화" scope="session"></c:set>
이름 ${name }<br>

<!-- reqeust 영역과, session영역에 존재하는 모든 name변수 삭제 -->
<%-- 동일한 이름으로 저장된 영역의 변수를 삭제 --%>
<%-- <c:remove var= "name"/> --%>

<%-- 세션 영역에 있는 변수 name만 삭제하고 싶다 --%>
<c:remove var="name" scope="request"/>
이름: ${name }<br>
이름: <c:out value="${name }"></c:out><br>

<!-- JSTL을 사용한 예외처리 방법 -->
 <c:catch var="err">
 <%=10/0 %>
 
 </c:catch>
 예외발생: ${err }<br>
 
 <!-- url 태그 사용 방법 -->
 <c:url var="daumSearch" value="http://search.daum.net/search">
 	<c:param name="w" value="blog"></c:param>
 	<c:param name="q" value="3차접종"></c:param>
 </c:url>
searchUrl : <a href="${daumSeach }">다음3차접종</a>
 searchUrl : ${daumSearch }<br>
 <c:url value="/jstlTest02.jsp"></c:url><br>
 <c:url value="./jstlTest02.jsp"></c:url><br>
 
 
 <!-- redirect 태그 사용 방법 -->
 <!-- response.sendRedirect()와 동일한 가능 -->
 <%-- <c:redirect url="HelloJSTL.jsp"></c:redirect> --%>
 
<%--  <c:redirect url="http://search.daum.net.search">
 	<c:param name="w" value="blog"></c:param>
 	<c:param name="q" value="코로나"></c:param>
 </c:redirect> --%>
 
 
 
</body>
</html>