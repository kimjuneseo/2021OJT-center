<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDBBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
</head>
<body>

<h1>아이디 중복 체크</h1>
<%
String id = request.getParameter("id");
//out.print("아이디 : " + id);

MemberDBBean memberPro = MemberDBBean.getInstance();
int x = memberPro.confirmId(id);

// x가 0일 때 : 입력한 아이디가 존재하지 않을 때
// x가 1일 때 : 입력한 아이디가 존재할 때
out.print("<script>");
if(x == 0) {
	out.print("alert('" + id + "는 사용가능한 아이디입니다.');");	
} else if(x == 1) {
	out.println("alert('이미 사용중인 아이디가 있습니다.\\n다른 아이디를 입력해주세요.');");
}
out.print("history.back();"); // history.go(-1)
out.print("</script>");
%>

</body>
</html>