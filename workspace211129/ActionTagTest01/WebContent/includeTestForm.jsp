<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인클루드 액션태그 폼</title>
</head>
<body>
<%--
액션태그(action tag) - 웹에서 태그형식으로 사용하여 페이지의 이동과 데이터의 전송을 하도록 하는 태그
- include, forward, useBean, setProperty, getProperty, plug-in(자바 애플릿을 사용, 사용하지 않음)
1. include 액션 태그
- 다른 페이지의 처리 결과를 현재 페이지에 포함하는 기능
- 조각코드를 삽입할 때, 페이지를 모듈화할 때 사용

--%>

<h2>include 액션태그 폼</h2>

<form action="includeTest.jsp" method="post">
	이름 : <input type="text" name="name"><br>
	페이지이름 : <input type="text" name="pageName" value="includedTest"><br>
	<input type="submit" value="입력완료">
</form>


</body>
</html>