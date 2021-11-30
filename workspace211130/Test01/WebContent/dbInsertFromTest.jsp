<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 입력 폼</title>
</head>
<body>
	<h2>회원 정보 입력 폼</h2>
	<form action="dbInsertProTest.jsp" method="post">
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="password" name="pwd"><br>
		이름 : <input type="text" name="name"><br>
		전화번호 : <input type="tel" name="tel"><br>
		도로명 주소 : <input type="text" name="address1"><br>
		상세주소 : <input type="text" name="address2"><br>
		이메일 : <input type="text" name="email"><br>
		<button type="submit">전송</button>
	</form>
</body>
</html>