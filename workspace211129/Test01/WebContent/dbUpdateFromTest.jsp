<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 폼</title>
</head>
<body>
	<form action="dbUpdateProTest.jsp" method="post">
		아이디<input type="text" name="id"> <br>
		비밀번호<input type="password" name="pwd"><br>
		이름<input type="text" name="name"><br>
		<button type="submit">변경</button><br>
	</form>
</body>
</html>