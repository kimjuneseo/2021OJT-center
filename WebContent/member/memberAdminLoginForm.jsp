<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap');
	/*전체영역*/
	a{text-decoration: none; color: #000;}
	.flex{display: flex}
	#container{ width: 400px; margin: 20px auto;}
	.btn { padding:10px; background: #b4baba; border: none; border-radius: 5px; font-family: 'Noto Sans KR', sans-serif; color: #; cursor: pinter; transition: .5s }
	.btn:hover { background: #585555; transition: .5s}
	/* 제목 */
	#m_title { margin-bottom: 10px; font-size: 3em; text-align: center; font-family: 'Permanent Marker', cursive; }
	#s_title { margin-bottom: 10px; font-size: 1.75em; font-weight: 900; font-family: 'Noto Sans KR', sans-serif; text-align: center;}
	/* 테이블 */
	table { width: 100%; }
	td { align-items: center; }
	tr { height: 50px;  }
	input { height: 45px; border: none; border-bottom: 1px solid #000;}
	input[type="text"], input[type="password"]{ width: calc(100% - 1em) padding-left: 1em }
	.t_input{ width: 100%; margin: 0 auto; }
	.table__sin{justify-content: space-around;}
	.login { border: none; background: #585555; color:#fff;}
</style>
<script>
	window.onload = () => {
		let form = document.loginForm;
		// 회원 가입 내용에 대한 유효성 검사 - 내용을 입력
		let btn_insert = document.querySelector("#btn_login");
		btn_insert.addEventListener("click", () => {
			if(form.id.value.length === 0){
				alert("아이디를 입력해주세요.");
				return;
			}
			if(form.pwd.value.length === 0){
				alert("비밀번호를 입력해주세요.");
				return;
			}
			form.submit();
		});
	
	};
</script>
</head>
<body>
	<div id="container">
		<div id="m_title">Street Women Fighter</div>
		<div id="s_title">admin 페이지</div>
		<form action="memberInfoAllForm.jsp" method="post" name="loginForm">
			<table>
				<tr>
					<td ><input type="text" name="id" class="t_input" placeholder="아이디를 입력해주세요."></td>
				</tr>
				<tr>
					<td ><input type="password" name="pwd" class="t_input" placeholder="비빌번호입력해주세요."></td>
				</tr>
				<tr>
					<td class="flex"><input type="checkbox" name="save_id" id="t_chk"><label for="t_chk">아이디 저장</label></td>
				</tr>
				<tr><td ><input type="button" class="t_input login" value="전체회원 조회" id="btn_login"></td></tr>
			</table>
		</form>
	</div>
</body>
</html>