<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.MemberDBBean"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복체크</title>
</head>
<body>
	<h2>어쩔</h2>
	<%
	String id = request.getParameter("id");
	
	MemberDBBean memberPro = MemberDBBean.getInstance();
	int x = memberPro.confirmId(id);
	
	out.print("<script>");
		if(x == 0) {
			out.print("alert('" + id + "는 사용가능한 아이디입니다.');");
		}else{
			out.print("alert('이미 사용중인 아이디입니다\\n 다른 아이디를 입력해주세요.');");
		}
			out.print("history.back();"); // history.go(-1)
	out.print("</script>");
	%>
</body>
</html>