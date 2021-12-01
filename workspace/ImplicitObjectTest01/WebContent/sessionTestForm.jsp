<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.onload = function(){
	let form = document.testForm
	let btn_session = document.getElementById("btn_session");
	btn_session.addEventListener("click", () => {
		form.action = "sessionTestPro1.jsp";
		form.submit();
	});
	let btn_session2 = document.getElementById("btn_session2");
	btn_session2.addEventListener("click", () => {
		form.action = "sessionTestPro2.jsp";
		form.submit();
	});
}
</script>
</head>
<body>
<h2>세션테스트</h2>
<form action="sessionTestPro1.jsp" method="post" name="testForm">
	아이디 : <input type="text" name="id"><br>
	<input type="button" value="입력완료" id="btn_session">
	<input type="button" value="입력완료" id="btn_session2">
</form>
</body>
</html>