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
		String id = request.getParameter("id");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String pwd = member.findMemberPwd(id, tel, email);
		out.print("<script>");
		if(pwd == ""){
		out.print("alert('회원정보가 없습니다.\\n다시 입력해주세요'); location = 'memberFindPwdForm.jsp';");
		}else{
		out.print("alert('비밀번호는 "+pwd+" 입니다.'); location = 'memberFindPwdForm.jsp';");
		}
		out.print("</script>");
	%>
</body>
</html>