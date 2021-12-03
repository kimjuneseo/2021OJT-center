<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDBBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 처리</title>
</head>
<body>
<%-- 아이디를 모를 때 : 이름과 전화번호를 확인하여 alert 창으로 아이디를 알려줌 --%>

<%
request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
String tel = request.getParameter("tel");

// db 연동, 쿼리 실행
MemberDBBean memberPro = MemberDBBean.getInstance();
String id = memberPro.findId(name, tel);

out.print("<script>");
if(id == null) { // 이름과 전화번호에 해당하는 아이디를 찾지 못했을 때
	out.print("alert('아이디를 찾지 못했습니다.');");
	out.print("history.back();");
} else {         // 이름과 전화번호에 해당하는 아이디를 찾았을 때
	out.print("alert('" + name + "님의 아이디는 " + id + "입니다.');");
	out.print("location='memberLoginForm.jsp'");
}
out.print("</script>");
%>

</body>
</html>