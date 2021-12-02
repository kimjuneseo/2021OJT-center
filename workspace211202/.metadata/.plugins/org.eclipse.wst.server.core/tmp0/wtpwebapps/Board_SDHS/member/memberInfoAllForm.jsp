<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDBBean, member.MemberDataBean, java.util.List, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 목록</title>
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
#s_text { text-align: center; color: #99424f;}
#d_btn { text-align: right; margin-bottom: 10px;}
#btn_choice { width: 120px; height: 30px; background: #495057; color: #fff; font-weight: bold; 
border: 0; cursor: pointer;}
#btn_choice:hover { background: #dee2e6; color: #495057; border: 1px solid #495057;}
table{ width: 100%; border: 1px solid #495057; border-collapse: collapse;}
th, td { border: 1px solid #495057;}
th { background: #ced4da;}
tr { height: 25px;}
</style>
<script>
// 1번 방법 - 배열에 선택한 회원을 넣고, 해제한 회원을 빼는 방법
/*
var choice_arr = [];        // 체크박스의 인덱스값을 저장하는 배열
window.onload = function() {
	var btn_choice = document.getElementById("btn_choice");
	btn_choice.addEventListener("click", function() {
		location = "memberAdminDeletePro.jsp?choice_arr=" + choice_arr;
	})
}

function choice_chk(e) {
	if(e.checked == true) { // 체크박스가 선택되었을 때 체크박스의 값(회원아이디)을 배열에 저장
		choice_arr.push(e.value);
	} else {                // 체크박스가 해제되었을 때 체크박스의 값(회원아이디)을 배열에서 삭제
		var idx = choice_arr.indexOf(e.value);
		if(idx != -1) choice_arr.splice(idx, 1); // 체크가 해제된 것을 배열에서 삭제
	}
	console.log(choice_arr);
}
*/

// 2번 방법 - 실행버튼을 누를 때 체크박스에 선택한 값을 저장하는 방법, 권장하는 방법
window.onload = function() {
	var chk_choice = document.getElementsByClassName("chk_choice");
	var btn_choice = document.getElementById("btn_choice");

	btn_choice.addEventListener("click", function() {
		var choice_arr = [];
		for(var i=0; i<chk_choice.length; i++) {
			if(chk_choice[i].checked) choice_arr.push(chk_choice[i].value);
		}
		console.log(choice_arr);
		location = "memberAdminDeletePro.jsp?choice_arr=" + choice_arr;
	})	
}

</script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

// DB 연동, 쿼리 실행
// check가 1이면 성공, 0이면 실패
MemberDBBean memberPro = MemberDBBean.getInstance();
int check = memberPro.checkAdmin(id, pwd);

// check가 0인 경우, 관리자 아이디, 비밀번호 체크에 실패하면 관리자 로그인 페이지로 돌아감
if(check == 0){
	out.print("<script>alert('관리자가 아닙니다. 다시 로그인 해주세요.');");
	out.print("location='memberAdminLoginForm.jsp';</script>");
}

// check가 1인 경우, 관리자 로그인에 성공했을 때
List<MemberDataBean> memberList = memberPro.getMemberList();
%>
<div id="container">
	<div id="m_title">Street Woman Fighter</div>
	<div id="s_title">전체 회원 목록</div>
	<div id="s_text">관리자는 커뮤니티 규정을 위반한 회원을 강제로 탈퇴할 수 있습니다.(ex. 욕설, 음란, 광고, 비방 ...)</div>
	<div id="d_btn"><input type="button" value="선택 회원 강퇴" id="btn_choice"></div>
	<table>
		<tr>
			<th width="3%">선택</th>
			<th width="9%">아이디</th>
			<th width="9%">비밀번호</th>
			<th width="6%">이름</th>
			<th width="10%">전화번호</th>
			<th width="33%">주소</th>
			<th width="15%">이메일</th>
			<th width="15%">가입일자</th>
		</tr>
		<%for(MemberDataBean m : memberList) {%>
		<tr>
			<%-- <td align="center"><input type="checkbox" onchange="choice_chk(this)" value="<%=m.getId()%>"></td> --%>
			<td align="center"><input type="checkbox" class="chk_choice" value="<%=m.getId()%>"></td>
			<td align="center"><%=m.getId() %></td>
			<td align="center"><%=m.getPwd() %></td>
			<td align="center"><%=m.getName() %></td>
			<td align="center"><%=m.getTel() %></td>
			<td><%=m.getAddress1() %> <%=m.getAddress2() %></td>
			<td align="center"><%=m.getEmail() %></td>
			<td align="center"><%=m.getRegdate() %></td>
		</tr>
		<%} %>
	</table>
</div>

</body>
</html>