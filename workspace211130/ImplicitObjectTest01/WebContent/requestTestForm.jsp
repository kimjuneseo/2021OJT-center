<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 폼</title>
</head>
<body>

<h2>학생 정보 일력</h2>
<form action="reqeustTestPro.jsp" method="post">
	학번: <input type="text" name="num"><br>
	이름: <input type="text" name="name"><br>
	학년: 
	<input type="radio" name="grade" value="1">1학년&ensp; 
	<input type="radio" name="grade" value="2">2학년&ensp; 
	<input type="radio" name="grade" value="3">3학년&ensp; 
	<input type="radio" name="grade" value="4"\>4학년&ensp; 
	선택과목:
	<select name=subject">
		<option value="Java">Java</option>
		<option value="Jsp">Jsp</option>
		<option value="Oralce">Oralce</option>
		<option value="Python">Oralce</option>
	</select><br>
	<input type="submit" value="입력완료">
</form>
</body>
</html>