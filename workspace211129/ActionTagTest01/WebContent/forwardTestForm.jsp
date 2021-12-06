<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력폼</title>
</head>
<body>

<h2>forword 액션태그</h2>
<form action="forwardTest.jsp" method="post">
	아이디 : <input type="text" name="id"><br>
	<select name="hobby">
		<option value="운동">운동</option>
		<option value="등산">등산</option>
		<option value="수영">수영</option>
		<option value="요가">요가</option>
	</select><br>
	<input type="submit" value="입력완료">
</form>

</body>
</html>