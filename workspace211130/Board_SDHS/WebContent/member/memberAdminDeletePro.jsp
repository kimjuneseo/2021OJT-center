<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDataBean, member.MemberDBBean, java.util.List, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 강퇴 처리</title>
</head>
<body>

<%
String choice_arr = request.getParameter("choice_arr");
System.out.println("choice_arr : " + choice_arr);

String[] deleteMemberArr = choice_arr.split(",");
//for(String m : deleteMemberArr) { 
//	System.out.println(m);
//}

MemberDBBean memberPro = MemberDBBean.getInstance();
memberPro.deleteChoiceMember(deleteMemberArr);
response.sendRedirect("memberInfoAllForm.jsp");
%>

</body>
</html>