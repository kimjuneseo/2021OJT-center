<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 1번, 2번 테스트에 사용 --%>
	<!-- <form action="beanTestPro.jsp" method="post">
		이름 : <input type="text" name="name"><br>
		전화번호 : <input type="text" name="tel"><br>
		이메일 : <input type="email" name="email">
		<input type="submit" value="확인"> 
	</form> -->
	
<%-- 3번테스트에 사용, 빈의 멤버변수와 폼의 named의 이름이 다를 때 --%>
<form action="beanTestPro.jsp" method="post">
		이름 : <input type="text" name="name"><br>
		전화번호 : <input type="text" name="phone"><br>
		이메일 : <input type="email" name="email">
		<input type="submit" value="확인">
</form>
</body>
</html>