<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입폼</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap');
	/*전체영역*/
	#container{ width: 500px; margin: 20px auto;}
	.btn { padding:10px; background: #b4baba; border: none; border-radius: 5px; font-family: 'Noto Sans KR', sans-serif; color: #; cursor: pinter; }
	.btn:hover { background: #585555; transition: .5s}
	/* 제목 */
	#m_title { margin-bottom: 10px; font-size: 3em; text-align: center; font-family: 'Permanent Marker', cursive; }
	#s_title { margin-bottom: 10px; font-size: 1.75em; font-weight: 900; font-family: 'Noto Sans KR', sans-serif; text-align: center;}
	/*테이블*/
	table {	width:100%; border: 1px solid #000; border-collapse: collapse; font-family: 'Noto Sans KR', sans-serif;}
	th, td { border: 1px solid #000;}
	th { background: #585555; color:#fff}
	td { padding-left:10px;}
	tr { height:60px;}
	/* 하단버튼 */
	#btns { margin-top: 10px; text-align: center; }
	#btns input{width: 100px; border-radius: 0px;}
	#chk_pwd, #chk_pwd2, #chk_email{ color: red; font-size: .5em; }
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	window.onload = () => {
		let form = document.joinForm;
		// 회원 가입 내용에 대한 유효성 검사 - 내용을 입력
		let btn_insert = document.querySelector("#btn_insert");
		btn_insert.addEventListener("click", () => {
			if(form.id.value.length === 0){
				alert("아이디를 입력해주세요.");
				return;
			}
			if(form.pwd.value.length === 0){
				alert("비밀번호를 입력해주세요.");
				return;
			}
			if(form.pwd2.value.length === 0){
				alert("비밀번호가 틀림.");
				return;
			}
			if(form.name.value.length === 0){
				alert("이름를 입력해주세요.");
				return;
			}
			if(form.tel.value.length === 0){
				alert("전화번호를 입력해주세요.");
				return;
			}
			if(form.address1.value.length === 0){
				alert("전화번호를 입력해주세요.");
				return;
			}
			if(form.address2.value.length === 0){
				alert("전화번호를 입력해주세요.");
				return;
			}
			if(form.email.value.length === 0){
				alert("전화번호를 입력해주세요.");
				return;
			}
			form.submit();
		});
		let pwd = form.pwd;
		let pwd2 = form.pwd2;
		let chk_pwd = document.querySelector("#chk_pwd");
		let chk_pwd2 = document.querySelector("#chk_pwd2");
		pwd.addEventListener("blur", () => {
			if(pwd.value.length < 4){
				chk_pwd.innerText = "4자리 이상이어야 합니다.";
				pwd.focus();
			}else{
				chk_pwd.innerText = "사용가능한 비밀번호입니다";
				chk_pwd.style.color = "blue";
			};
		});
		
		pwd2.addEventListener("blur", () => {
				if(pwd.value !== pwd2.value){
					chk_pwd2.innerText = "비밀번호가 일치하지 않습니다.";
					pwd2.focus();
				}else{
					chk_pwd2.innerText = "비밀번호가 일치합니다";
					chk_pwd2.style.color = "blue";
				}
		});
		let address1 = form.address1;
		let btn_address = document.querySelector('#btn_address');
		btn_address.addEventListener("click", () => {
			new daum.Postcode({
				oncomplete: function(data) {
					address1.value = data.address;
			    }
			}).open();	
		});
		

	let email = form.email;
	let chk_email = document.querySelector("#chk_email");
	email.addEventListener("blur", () => {
		if(email.value.indexOf('@') === -1){
			chk_email.innerText = "사용가능한 이메일을 입력해주세요";
			email.focus();
		}else{
			chk_email.innerText = "사용가능한 이메일입니다";
			chk_email.style.color = "blue";
		};
	});

	// 중복 아이디 체크
	let btn_chk_id = document.querySelector('#btn_chk_id');
	btn_chk_id.addEventListener("click", () => {
		if(!form.id.value){
			alert("아이디를 입력해주세요");
			form.id.focus();
		}else{
			location = "memberIdCheck.jsp?id="+form.id.value;
		}
	})
	
	};
</script>
</head>
<body>

	<div id="container">
		<h2 id="m_title">Street Women Fighter</h2>	
		<h3 id="s_title">회원가입</h3>
		<form action="memberJoinPro.jsp" method="post" name="joinForm">
		<table>
			<tr>
				<th width="25%">아이디</th>
				<td width="75%">
					<input type="text" name="id" size="15"> &ensp;
					<input type="button" value="ID 중복 체크" id="btn_chk_id" class="btn_chk btn" >
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pwd" size="15">
					<span id="chk_pwd"></span>
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" name="pwd2" size="15">&ensp;
					<span id="chk_pwd2"></span>					
				</td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" size="15"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel" size="15"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="button" value="주소찾기" id="btn_address" class="btn_chk btn"><br>
					<input type="text" name="address1" size="45"><br>
					<input type="text" name="address2" size="45">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="email" name="email" size="15">&ensp;
					<span id="chk_email"></span>
				</td>
			</tr>
		</table>
		<div id="btns">
			<input type="button" value="가입" id="btn_insert" class="btn"> &emsp;
			<input type="button" value="취소" onclilk="location='memberLoginForm.jsp'" class="btn">
		</div>
		</form>
	</div>
</body>
</html>