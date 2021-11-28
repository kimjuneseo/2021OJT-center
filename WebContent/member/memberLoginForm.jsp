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
		
		let btn_login = document.querySelector("#btn_login");
		btn_login.addEventListener("click", () => {
				if(!form.id.value){
					alert("아이디를 입력해주세요.");
					form.id.focus();
					return;
				}
				if(!form.pwd.value){
					alert("비밀번호를 입력해주세요");
					form.pwd.focus();
					return;
				}
				form.action = "memberLoginPro.jsp"
				form.submit();
		});
	
	let btn_member = document.querySelector("#btn_member");
	btn_member.addEventListener("click", () => {
		if(!form.id.value){
			alert("아이디를 입력해주세요.");
			form.id.focus();
			return;
		}
		if(!form.pwd.value){
			alert("비밀번호를 입력해주세요");
			form.pwd.focus();
			return;
		}
		form.action = "memberInfoForm.jsp"
		form.submit();
	});
	}
</script>
</head>
<body>
	<div id="container">
		<div id="m_title">Street Women Fighter</div>
		<div id="s_title">LOGIN</div>
		<form action="memberLoginPro.jsp" method="post" name="loginForm">
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
				<tr><td ><input type="button" class="t_input login" value="로그인" id="btn_login"></td></tr>
				<tr class="flex table__sin">
					<td><a href="memberFindIdForm.jsp">아이디 찾기</a></td>
					<td><a href="memberFindPwdForm.jsp">비밀번호 찾기</a></td>
					<td><span id="btn_member">가입정보 확인</span></td>
					<td><a href="memberJoinForm.jsp">회원가입</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>