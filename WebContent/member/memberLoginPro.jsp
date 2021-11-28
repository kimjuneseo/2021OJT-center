<%@page import="member.MemberDBBean"%>
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

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	MemberDBBean member = MemberDBBean.getInstance();
	out.print("<script>");
		if(id == "admin" && pwd == "1234"){
			out.print("location = 'memberAdminLoginForm.jsp';");
		}else{
			out.print("location = 'memberAdminLoginForm.jsp';");
		}
	out.print("</script>");
		%>
</body>
</html>