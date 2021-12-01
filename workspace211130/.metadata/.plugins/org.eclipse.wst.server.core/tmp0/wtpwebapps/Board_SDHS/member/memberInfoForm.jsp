<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 확인</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Monoton&display=swap" rel="stylesheet">
<style>
/* 전체 영역 */
#container { width: 500px; margin: 20px auto;}
/* 제목 */
#m_title { font-size: 2.5em; text-align: center; margin-bottom: 10px; font-family: 'Monoton', cursive;}
#s_title { font-size: 2.2em; text-align: center; margin-bottom: 10px; font-family: 'Jua', sans-serif;}
/* 테이블 */
table { width: 100%; border: 1px solid black; border-collapse: collapse;}
th, td { border: 1px solid black;}
th { background: #dee2e6;}
td { padding-left: 10px;}
tr { height: 60px;}
#chk_pwd, #chk_pwd2, #chk_email, #chk_id, #chk_regdate { font-size: 0.7em;}
#chk_id, #chk_regdate { color: red;}
.t_id, .t_regdate { background: #dee2e6;}
/* 하단 버튼 */
#btns { text-align: center; margin-top: 20px;}
#btns > input { width: 110px; height: 35px; background:#495057; color:#fff; border:0; cursor: pointer; 
font-size: 0.9em; font-weight: bold;}
#btns > input:hover { background: #dee2e6; color: #495057; border: 1px solid #495057;}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
// 입력 유효성 검사
window.onload = function() {
	var form = document.infoForm;
	
	// 회원정보 수정 버튼
	var btn_update = document.getElementById("btn_update");
	btn_update.addEventListener("click", function() {
		// 회원 수정 내용에 대한 유효성 검사 - 내용이 없을 때
		if(form.pwd.value.length == 0) {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		if(form.pwd2.value.length == 0) {
			alert("비밀번호 확인을 입력해주세요.");
			return;
		}
		if(form.name.value.length == 0) {
			alert("이름을 입력해주세요.");
			return;
		}
		if(form.tel.value.length == 0) {
			alert("전화번호를 입력해주세요.");
			return;
		}
		if(form.address1.value.length == 0) {
			alert("도로명 주소를 입력해주세요.");
			return;
		}
		if(form.address2.value.length == 0) {
			alert("상세주소를 입력해주세요.");
			return;
		}
		if(form.email.value.length == 0) {
			alert("이메일을 입력해주세요.");
			return;
		}
		form.action = "memberUpdatePro.jsp";
		form.submit();
	})
	
	// 회원정보 삭제 버튼
	var btn_delete = document.getElementById("btn_delete");
	btn_delete.addEventListener("click", function() {
		if(form.pwd.value.length == 0) {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		if(form.pwd2.value.length == 0) {
			alert("비밀번호 확인을 입력해주세요.");
			return;
		}
		form.action = "memberDeletePro.jsp";
		form.submit();
	})
	
	// 비밀번호에 대한 유효성 검사 - 비밀번호 자릿수에 대한 유효성 검사
	// 비밀번호는 4자리 이상 입력하도록 검사
	// focus 이벤트 : 포커스(커서)를 가졌을 때 발생하는 이벤트
	// blur 이벤트 : 포커스(커서)를 잃었을 때 발생하는 이벤트
	var pwd = form.pwd;
	var pwd2 = form.pwd2;
	var chk_pwd = document.getElementById("chk_pwd");
	var chk_pwd2 = document.getElementById("chk_pwd2");
	pwd.addEventListener("blur", function() {
		if(pwd.value.length < 4) {
			chk_pwd.innerHTML = "비밀번호는 4자리 이상이어야 합니다.";
			chk_pwd.style.color = "red";
			pwd.value = "";
			pwd.focus();
		} else {
			chk_pwd.innerHTML = "사용가능한 비밀번호입니다."
			chk_pwd.style.color = "blue";
		}
	})
	// 비밀번호 확인에 대한 유효성 검사 - 비밀번호 확인은 비밀번호 같은 내용이어야함.
	pwd2.addEventListener("blur", function() {
		if(pwd.value != pwd2.value) {
			chk_pwd2.innerHTML = "비밀번호가 일치하지 않습니다.";
			chk_pwd2.style.color = "red";
			pwd2.value = "";
			pwd2.focus();
		} else {
			chk_pwd2.innerHTML = "비밀번호가 일치합니다.";
			chk_pwd2.style.color = "blue";
		}
	})
	
	// 주소 라이브러리 사용
	var address1 = form.address1;
	var btn_address = document.getElementById("btn_address");
	btn_address.addEventListener("click", function() {
		new daum.Postcode({
	       oncomplete: function(data) {
	           address1.value = data.address;
	       }
	    }).open();
	})
    
	
	// 이메일에 대한 유효성 검사 - '@' 문자를 포함하는지에 관한 유효성 검사
	var email = form.email;
	var chk_email = document.getElementById("chk_email");
	email.addEventListener("blur", function() {
		var idx = email.value.indexOf("@");
		if(idx == -1) { // 해당 문자를 찾지 못하면 -1을 리턴
			chk_email.innerHTML = "사용가능한 이메일을 입력해주세요.";
			chk_email.style.color = "red";
		} else {
			chk_email.innerHTML = "사용가능한 이메일입니다.";
			chk_email.style.color = "blue";
		}
	})
}
</script>
</head>
<body>
<%
// 로그인폼에서 넘어오는 데이터 획득
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
//System.out.println("id = " + id);
//System.out.println("pwd = " + pwd);

// DB 연동, 쿼리문 실행
MemberDBBean memberPro = MemberDBBean.getInstance();
MemberDataBean member = memberPro.getMember(id, pwd);

// 검색한 결과가 없을 때
if(member.getId() == null) {
	out.print("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.');location='memberLoginForm.jsp';</script>");
}
// 검색한 결과 있을 때 - 아래의 내용 처리
%>
<div id="container">
	<div id="m_title">Street Women Fighter</div>
	<div id="s_title">회원 정보 확인</div>
	<form action="memberUpdatePro.jsp" method="post" name="infoForm">
	<table>
		<tr>
			<th width="25%">아이디</th>
			<td width="75%">
				<input type="text" name="id" size="15" readonly value="<%=member.getId()%>" class="t_id">&ensp;
				<span id="chk_id">아이디는 변경할 수 없습니다.</span>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="text" name="pwd" size="15" value="<%=member.getPwd()%>">&ensp;
				<span id="chk_pwd"></span>
			</td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td>
				<input type="text" name="pwd2" size="15">&ensp;
				<span id="chk_pwd2"></span>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" size="15" value="<%=member.getName()%>"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="tel" size="15" value="<%=member.getTel()%>"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="button" value="주소 찾기" id="btn_address" class="btn_chk"><br>
				<input type="text" name="address1" size="45" value="<%=member.getAddress1()%>"><br>
				<input type="text" name="address2" size="45" value="<%=member.getAddress2()%>">
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" name="email" size="18" value="<%=member.getEmail()%>">&ensp;
				<span id="chk_email"></span>
			</td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td>
				<input type="text" name="regdate" size="18" readonly value="<%=member.getRegdate()%>" class="t_regdate">&ensp;
				<span id="chk_regdate">가입일자는 수정할 수 없습니다.</span>
			</td>
		</tr>
	</table>
	<div id="btns">
		<input type="button" value="수정" id="btn_update">&emsp;&emsp;
		<input type="button" value="탈퇴" id="btn_delete">&emsp;&emsp;
		<input type="button" value="돌아가기" onclick="location='memberLoginForm.jsp'">
	</div>
	</form>
</div>

</body>
</html>