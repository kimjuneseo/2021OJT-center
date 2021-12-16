<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>JSP 첫수업</h1>
<p>JDP 프로그램을 설치하였습니다.</p>
<%-- JSP의 주석 웹페이지에서 소스보기 했을때 안보임--%>
<!-- HTML 주석 -->

<!-- 선언문은 전역변수라 참조가능  -->
<%=c + d %>

<%! //1.선언문(declaration): 전역변수, 프로그램 전체에서 사용하는 함수, 많이는 사용하지 않은
String name = "모니카";
int c = 30; 
int d = 40;
%>

<% //2.스크립틀릿(scriptlet): 지역변수, 지역함수 등 자바 JSP에서 자바 문법이 필요한 곳에 많이 사용함
// JSP의 스크립트 3요소 - 선언문(declaration), 스크립틀릿(scriptlet), 표현식(expression)
int a = 10;
int b = 20;

%>

<% //3.표현식%>
<%= a+b %>

</body>
</html>