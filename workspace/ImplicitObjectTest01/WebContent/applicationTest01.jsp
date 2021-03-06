<%@page import="javafx.application.Application"%>
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
application 내장 객체: WAS(tomcat) 서버가 켜져있는 동안
- 웹 애플리케이션이 실행되고 있는 동안의 서버 설정 정보, 자원 정보를 확인할 때 사용하는 객체
- 웹 애플리케이션이 실행되고 있는 동안 발생하는 여러 이번트 로그 정보와 관력된 기능을 제공
- 웹 애플리케이션 당 1개의 객체가 생성되고, 공유하는 변수로 사용
- 웹사이트의 방문자 기록의 카운트를 할 때 사용

- getServlet(): 웹서버의 이름과 버전을 리턴
- getMineType(): 지정한 파일의 MIME 타입을 리턴
- RealPath(): 지정한 경로로 웹상의 경로 비교
- log(): 로그파일에 message를 기록할 때 사용
*/
%>

<h2>application 내장객체</h2>
<%
String info = application.getServerInfo();
String path = application.getRealPath("/");
application.log("로그기록: ");

%>
웹 컨테이너의 이름과 버전 : <%=info %><br>
웹 애플리케이션의 폴더와 로컬 호스트: <%=path %>

</body>
</html>