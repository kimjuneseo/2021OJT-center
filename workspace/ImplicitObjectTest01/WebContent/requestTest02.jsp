<%@page import="java.util.Enumeration"%>
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
request 내장객체의 주요 메소드
- getProtocol(): 웹서버의 사용 프로토골을 리턴함
- getSerberName(): 웹서버의 도메인 이름을 리턴함
- getMethod(): 웹서의 요청방식을 리턴함. ex) get, post
- getQuesyString(): 웹서버의 요청시에 사용된 쿼리문을 리턴
- getRemoteHost(): 웹브라우저의 포스트명을 리턴
- getRemoteAddr(): 웹브라우저의 IP주소를 리턴함
- getServerPort(): 웹서버의 port번호를 리턴
- getHeader(): 웹서서버의 요청시에 http 요청 헤더 name에 해당하는 속성값
- getHeaderName(): 웹서버의 htto요청에 있는 헤더 이름을 리턴함

<reqeust 객체를 상숑하여 경로는 확인하는 방법>
- getContextPath() : 웹에플리케이션의 컨섹스트 경로로 리턴, 사용하는 프로젝트 리턴
- getRequestURI(): 웹요청에 사용된 URI을 리턴, 프로젝트에서부터 사용된 파일명까지 리턴
- getRequestURL(): 웹요청에 사용된 URL을 리턴, http부터 파일명까지의 전체 경로를 리턴

	*/
%>
<%
String[] names = {"프로토콜", "서버이름", "메소드방식", "접속 IP", "컨텍스트 경로"};
String[] values = {request.getProtocol(), request.getServerName(), request.getMethod(), request.getRemoteAddr(), 
		request.getContextPath()};
Enumeration<String> en = request.getHeaderNames();
String headerName = "";
String headerValue= "";
%>
<h2>웹브라우저와 웹서버의 정보 표시</h2>
<h3>request 내장객체 활용</h3>
<% 
for(int i=0; i < names.length; i++){
	out.print(names[i] + " : " + values[i] + "<br>");
}
out.print("URL : " + request.getRequestURL()); 
%>

<h2>http header 정보</h2>
<%
while(en.hasMoreElements()){
	headerName = en.nextElement();
	headerValue = request.getHeader(headerName);
	out.print(headerName + " : " + headerValue + "<br>");
}
%>
</body>
</html>