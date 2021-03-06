<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 폼</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap');
	/*전체영역*/
	a{text-decoration: none; color: #000;}
	.flex{display: flex}
	#container{ width: 400px; margin: 20px auto;}
	.btn { padding:10px; background: #b4baba; border: none; border-radius: 5px; font-family: 'Noto Sans KR', sans-serif; color: #; cursor: pinter; transition: .5s }
	.btn:hover { background: #585555; transition: .5s}
	/* 제목 */
	#m_title { margin-bottom: 10px; font-size: 3em; text-align: center; color:#ad7ca4; font-family: 'Permanent Marker', cursive; }
	#s_title { margin-bottom: 10px; font-size: 1.75em; color:#ad7ca4; font-weight: 900; font-family: 'Noto Sans KR', sans-serif; text-align: center;}
/* 테이블 */
table { width: 100%;}
td { }
tr { height: 50px;}
input { height: 45px;}
.t_input { width: 380px; padding-left: 10px;}
#btn_login { width: 400px; height: 55px; border: 0; background: #ad7ca4; color: #fff; 
font-size: 1.2em; font-weight: bold; cursor:pointer;}
</style>
<script>
window.onload = function() {
	var form = document.loginForm;
	
	// 로그인 버튼 처리
	var btn_login = document.querySelector("#btn_login");
	btn_login.addEventListener("click", function() {
		// 로그인폼의 유효성 검사
		if(!form.id.value) {
			alert("아이디를 입력해주세요.");
			form.id.focus();
			return;
		}
		if(!form.pwd.value) {
			alert("비밀번호를 입력해주세요.");
			form.pwd.focus();
			return;
		}
		form.submit();
	})	
}
</script>
</head>
<body>

<div id="container">
	<div id="m_title">Street Woman Fighter</div>
	<div id="s_title">관리자 로그인</div>
	<form action="memberInfoAllForm.jsp" method="post" name="loginForm">
		<table>
			<tr>
				<td><input type="text" name="id" class="t_input" placeholder="아이디"></td>
			</tr>
			<tr>
				<td><input type="password" name="pwd" class="t_input" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td><input type="button" value="관리자 로그인" id="btn_login"></td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>