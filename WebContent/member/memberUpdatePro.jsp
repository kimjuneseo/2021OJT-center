<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
	 <jsp:useBean id="member" class="member.MemberDataBean">
	 	<jsp:setProperty name="member" property="*"/>
	 </jsp:useBean>
<% 
	MemberDBBean memberPro = MemberDBBean.getInstance();
	int members = memberPro.updateMember(member);
	out.print("<script>");
		if(members == 1){
			out.print("alert('수정되었습니다.');");
		}else{
			out.print("alert('수정에 실패하였습니다.'); ");
		}
	out.print("location = 'memberInfoForm.jsp';");
	out.print("</script>");
%>
</body>
</html>