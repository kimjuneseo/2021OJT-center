<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDBBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 삭제(탈퇴)</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>

<%
String id = request.getParameter("id");

MemberDBBean memberPro = MemberDBBean.getInstance();
int check = memberPro.deleteMember(id);

out.print("<script>");
if(check == 1) {        // 삭제 성공
	out.print("alert('회원 탈퇴에 성공하였습니다.');");
	out.print("location='memberLoginForm.jsp';");
} else if(check == 0) { // 삭제 실패 
	out.print("alert('회원 탈퇴에 실패하였습니다.');");
	out.print("history.back();");
}
out.print("</script>");
%>


</body>
</html>