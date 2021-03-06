<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

// DB 연동, 쿼리문 실행 - 로그인 확인
MemberDBBean memberPro = MemberDBBean.getInstance();
int idCheck = memberPro.userCheck(id, pwd);

out.print("<script>");
	switch (idCheck){ 
		case 1 : // 아이디와 비밀번호 모두 일치 -> 로그인 성공, id를 세션으로 설정, 게시판 목록 페이지로 이동 
			session.setAttribute("memberId", id);
			session.setAttribute("memverPwd",pwd);
			session.setMaxInactiveInterval(7200); //세션의 유지시간 설정, 기본값: 1800(30분), ex) 7200(2시간), 60*60*24(1일)
			out.print("alert('" + id +" 님 환영합니다.'); location='../board/boardList.jsp'; ");
			break;
		case 0 : // 아이디 일치, 비밀번로 불일치 -> 로그인 실패 
			out.print("alert('비밀번호가 일치하지 않습니다.'); history.back();");
			break;
		case -1 :  // 아이디 불일치 -> 로그인 실패
			out.print("alert('아이디가 존재하지 않습니다'); history.back();");
			break;
	}
out.print("</script>");
%>
</body>
</html>