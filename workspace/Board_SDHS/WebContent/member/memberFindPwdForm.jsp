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
	input { height: 45px; border: none; border-bottom: 1px solid #000; }
	input[name="email"]{ margin-bottom: 30px;  }
	.t_input{ width: 100%; margin: 0 auto; }
	.table__sin{justify-content: space-around;}
	.find_id { border: none; background: #585555; color:#fff; }
</style>
</head>
<body>
		<div id="container">
			<div id="m_title">Street Women Fighter</div>
			<div id="s_title">비밀번호 찾기</div>
			<form action="memberFindPwdPro.jsp" method="post" name="loginForm">
				<table>
					<tr>
						<td ><input type="text" name="id" class="t_input" placeholder="아이디를 입력해주세요."></td>
					</tr>
					<tr>
						<td ><input type="text" name="tel" class="t_input" placeholder="전화번호를 입력해주세요."></td>
					</tr>
					<tr>
						<td ><input type="email" name="email" class="t_input" placeholder="이메일을 입력해주세요."></td>
					</tr>
					<tr><td ><input type="submit" class="t_input find_id" value="비밀번호 찾기" id="btn_login"></td></tr>
					<tr><td ><input type="button" onclick="location = 'memberLoginForm.jsp'" class="t_input find_id" value="돌아가기" id="btn_login"></td></tr>
				</table>
			</form>
		</div>
</body>
</html>