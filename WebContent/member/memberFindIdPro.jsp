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
		
		MemberDBBean member = MemberDBBean.getInstance();
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String id =  member.findMemberId(name, tel);
			out.print("<script>");
		if(id == ""){
			out.print("alert('회원정보가 없습니다.\\n다시 입력해주세요');");
		}else{
			out.print("alert('"+ id+ "입니다.');");
		}
			out.print("location= 'memberFindIdForm.jsp';");
			out.print("</script>");
	%>
</body>
</html>