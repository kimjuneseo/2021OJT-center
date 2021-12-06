<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 폼</title>
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
#btn_find { width: 400px; height: 55px; border: 0; background: #495057; color: #fff; 
font-size: 1.2em; font-weight: bold; cursor:pointer;}
</style>
<script>
window.onload = function() {
	var form = document.findIdForm;
	
	// 아이디 찾기 버튼 처리
	var btn_find = document.querySelector("#btn_find");
	btn_find.addEventListener("click", function() {
		// 아이디 찾기 폼의 유효성 검사
		if(!form.name.value) {
			alert("이름을 입력해주세요.");
			form.name.focus();
			return;
		}
		if(!form.tel.value) {
			alert("전화번호를 입력해주세요.");
			form.tel.focus();
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
	<div id="s_title">아이디 찾기 폼</div>
	<form action="memberFindIdPro.jsp" method="post" name="findIdForm">
		<table>
			<tr>
				<td><input type="text" name="name" class="t_input" placeholder="이름"></td>
			</tr>
			<tr>
				<td><input type="text" name="tel" class="t_input" placeholder="전화번호"></td>
			</tr>
			<tr>
				<td><input type="button" value="아이디 찾기" id="btn_find"></td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>