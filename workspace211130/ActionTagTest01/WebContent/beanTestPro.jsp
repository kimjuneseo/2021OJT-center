<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
/*
< 폼에서 넘어오는 값을 받는 여러 가지 방법 >
1. request 내장객체를 사용하는 방법
2. useBean 액션태그를 사용하는 방법 - 자바빈을 사용하는 방법(자바 클래스를 활용하는 방법) 
- 많은 양의 데이터를 효율적으로 처리하는 방법
*/		

// 1번
/* String name = request.getParameter("name");
String tel = request.getParameter("tel");
String email = request.getParameter("email");
 */
 
request.setCharacterEncoding("utf-8");

%>
<%-- 2번 방법 --%> 
<%-- class: 패키지를 포함한 클래스의 이름, id: 클래스의 빈이름(인스턴스) --%> 
<%-- setProperty, getProperty의 속성, name: userBean의 id, property: useBean의 멤버변수(프로퍼티) --%>
<%-- <jsp:useBean id="user" class="users.User">
	<jsp:setProperty name="user" property="name"/>
	<jsp:setProperty name="user" property="tel"/>
	<jsp:setProperty name="user" property="email"/>
</jsp:useBean> --%>

<%-- 3번 방법: 빈(클래스)의 멤버변수와 폼의 name이 일치할 때, 간결하게 사용하는 방법 --%>
<%-- 문제 발생: 빈의 멤버변수의 이름과 폼의 name이 다를 때는 정보를 받지 못하는 문제가 발생 --%>
<%-- setPhone() 메소드를 찾게됨 --%>
<%-- <jsp:useBean id="user" class="users.User">
	<jsp:setProperty name="user" property="*"/>
</jsp:useBean> --%>
 
<%-- 4번 방법: 3번의 문제점을 해결-빈의 프로퍼티와 폼의 파라미터 값이 일치하지 않을 때 사용하는 방법ㄴ --%>
<jsp:useBean id="user" class="users.User">
	<jsp:setProperty name="user" property="*"/>
	<jsp:setProperty name="user" property="tel" param="phone"/>
</jsp:useBean>

<%-- userBean의 값을 출력하는 방법 --%>
이름: <jsp:getProperty property="name" name="user"/><br>
전화번호: <jsp:getProperty property="tel" name="user"/><br>
이메일: <jsp:getProperty property="email" name="user"/>

</body>
</html>