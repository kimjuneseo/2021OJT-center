<%@page import="member.MemberDBBean"%>
<%@page import="member.MemberDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	MemberDBBean memberPro = MemberDBBean.getInstance();
	String id =  request.getParameter("id");
	int member = memberPro.deleteMember(id);
	
	if(member == 1){
		out.print("<script>");
		out.print("alert('삭제되었습니다.'); location = 'memberLoginForm.jsp';");
		out.print("</script>");
	}else{
		out.print("<script>");
		out.print("alert('삭제에 실패하였습니다.'); location = 'memberLoginForm.jsp';");
		out.print("</script>");
	}
%>
</body>
</html>