<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 업로드 폼</title>
</head>
<body>

<h3>이미지 업로드 라이브러리를 이용한 파일 업로드 구현</h3>
<form action="imageUploadPro.jsp" method="post" enctype="multupart/form-data">
올린이 : <input type="text" name="name"><br>
파일명 : <input type="file" name="fileName"><br>
<input type="submit" value="업로드">

</form>
</body>
</html>