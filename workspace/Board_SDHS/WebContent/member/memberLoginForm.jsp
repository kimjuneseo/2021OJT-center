<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Monoton&display=swap" rel="stylesheet">
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
table { width: 100%;}
td { }
tr { height: 50px;}
input { height: 45px;}
.t_input { width: 380px; padding-left: 10px;}
.td_chk { display: flex; align-items: center; font-size: 0.9em;}
#btn_login { width: 400px; height: 55px; border: 0; background: #495057; color: #fff; 
font-size: 1.2em; font-weight: bold; cursor:pointer;}
.td_end { text-align: center; font-size: 0.9em;}
a { text-decoration: none; color: black;}
#btn_member { cursor: pointer;}
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
		form.action = "memberLoginPro.jsp";
		form.submit();
	})
	
	// 가입정보 확인 버튼 처리
	var btn_member = document.querySelector("#btn_member");
	btn_member.addEventListener("click", function() {
		// get 방식 : 아이디와 비밀번호가 노출되어 권장되지 않는 방법
		//location = "memberInfoForm.jsp?id=" + form.id.value + "&pwd=" + form.pwd.value;
	
		// post 방식 : 아이디와 비밀번호를 내부에 숨겨 전달되므로 안전하여 권장되는 방법
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
		form.action = "memberInfoForm.jsp"; // 액션 변경
		form.submit();
	})
	
	/* 
	< http와 session의 차이점 >
	HTTP : HyperText Transter Protocol(하이퍼텍스트 전송 규약), 
	- stateless 속성을 가짐
	- 연결상태를 유지하지 않음(페이지를 이동하여 연결을 끊음), 장점: 서버의 부하가 걸리지 않음, 
	- 연결상태를 계속유지해야만 하는 곳에서는 문제가 발생, ex) 로그인, 장바구니, 결제처리 ...
	
	Session : 웹페이지에서 연결상태를 계속 유지하도록 하는 특성
	- state 속성을 가짐
	- 로그인, 장바구니, 결제처리 ... 에서는 session 속성을 사용해야만 함
	
	연결상태를 유지하는 특성 2가지 : session, cookie
	< session과 cookie의 차이점 >
	session - 연결상태의 정보를 서버에 저장하고 있음. 보안이 효율적임.
	cookie - 연결상태의 정보를 사용자 측에 저장하고 있음. 보안이 취약함.
	
	*/
	
	// 쿠키를 확인
	if(document.cookie.length > 0) { // 쿠키가 있을 때
		// name이 'cookieId'인 쿠키의 값을 추출
		var searchId = "cookieId=";
		var idx = document.cookie.indexOf(searchId);
		if(idx != -1) { // 쿠키가 존재한다면 
			idx += searchId.length;
			var end = document.cookie.indexOf(";", idx);
			if(end == -1) {
				end = document.cookie.length;
			}
			form.id.value = document.cookie.substring(idx, end);
			form.t_chk.checked = true;
		}
	}
	
	// 쿠키를 생성
	// 아이디 저장 : 자바스크립의 쿠키 기능을 사용
	// document.cookie -> 자바스크립트에서 사용하는 쿠키
	// 쿠키를 만들 때 반드시 설정해야 값 : 이름, 값, 유지시간
	// escape() 함수 : *, -, _, +, ., / 를 제외한 모든 문자를 16진수로 변환하는 함수
	// - 쉼표, 세미콜론 등과 같은 문자가 쿠키에서 사용되는 문자열과의 충돌을 방지하기 위해서 사용
	var t_chk = document.getElementById("t_chk");
	t_chk.addEventListener("click", function() {
		var now = new Date();      // 오늘 날짜
		var name = "cookieId";     // 쿠키 이름
		var value = form.id.value; // 쿠키 값
		
		if(form.t_chk.checked == true) { // 체크되었다면 쿠키를 생성
			now.setDate(now.getDate() + 7); // 쿠키를 유지하는 시간, 7일 동안 쿠키를 유지
			document.cookie = name + "=" + escape(value) + ";path=/;expires=" + now.toGMTString() + ";";
			console.log(document.cookie);
		} else {                         // 해제되었다면 쿠키를 사용 만료
			now.setDate(now.getDate() + 0); // 쿠키를 삭제, 유지시간을 0으로 설정
			document.cookie = name + "=" + escape(value) + ";path=/;expires=" + now.toGMTString() + ";";
		}
		
	})
}
</script>
</head>
<body>

<div id="container">
	<div id="m_title">Street Woman Fighter</div>
	<div id="s_title">로그인</div>
	<form action="memberLoginPro.jsp" method="post" name="loginForm">
		<table>
			<tr>
				<td><input type="text" name="id" class="t_input" placeholder="아이디"></td>
			</tr>
			<tr>
				<td><input type="password" name="pwd" class="t_input" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td class="td_chk">
					<input type="checkbox" name="save_id" id="t_chk">&ensp;
					<label for="t_chk">아이디 저장</label>
				</td>
			</tr>
			<tr>
				<td><input type="button" value="로그인" id="btn_login"></td>
			</tr>
			<tr>
				<td class="td_end">
					<a href="memberFindIdForm.jsp">아이디 찾기</a> | 
					<a href="memberFindPwdForm.jsp">비밀번호 찾기</a> | 
					<span id="btn_member">가입정보 확인</span> | 
					<a href="memberJoinForm.jsp">회원가입</a>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>