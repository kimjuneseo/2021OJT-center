<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out 내장 객체</title>
</head>
<body>

<%
/*
out 내장 객체
- jsp 페이지의 생성 결과를 웹브라우저로 정송하여 출력하는 객체

- isAutoFlush(): 출력버퍼가 다 찼을 때 처리 여부를 결정, 자동 플러시일 때는 true, 아닐 때는 false를 리턴
- getBufferSize(): 출력버퍼의 전체크리를 리턴
- getRemaining(): 현재 남아있는 출력버퍼의 크기를 리턴
- clearBuffer(): 출력버퍼에 있는 내용을 전송하지 않고, 비움
- fluh(): 현재 출력버퍼에 있는 내용을 전송하고, 비움
- close(): 현재 출력버퍼에 있는 내용을 전속하고, 출력스트임을 닫음

- print(): 주어진 문자열을 웹브라우저로 전송하는 기능
*/
%>

<h2>out  내장객체1</h2>
<%
String name = "BTS";
%>

<!-- 자바코드의 문자열을 출력하느 방법 -->
<!-- 1번: http 영역에서 표현식을 사용하는 방법  -->
출력되는 내용은: <%=name %>입니다. <br>

<%
// 2번: 자바의 영역에서 출력하는 방법 - out 내장객체를 사용
out.print("출려되는 내용은:" + name + "입니다.");
%> 

<h2>out 내장객체2</h2>
작동 플러시 기능 사용여부 : <%= out.isAutoFlush() %><br>
출력 버퍼의 크기: <%=out.getBufferSize() %>KB<br>
남아있는 출력 버퍼의 크기: <%=out.getRemaining() %>KB
</body>
</html>