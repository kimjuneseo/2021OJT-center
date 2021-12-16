<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDataBean, member.MemberDBBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>

<%-- // 1번 방법 - request 내장객체 사용
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String tel = request.getParameter("tel");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String email = request.getParameter("email");

MemberDataBean member = new MemberDataBean();
member.setId(id);
member.setPwd(pwd);
member.setName(name);
member.setTel(tel);
member.setAddress1(address1);
member.setAddress2(address2);
member.setEmail(email);
--%>

<%-- 2번 방법 : 액션태그 사용 : 변수값을 하나씩 받는 방법 --%>
<jsp:useBean id="member" class="member.MemberDataBean">
	<jsp:setProperty name="member" property="id"/>
	<jsp:setProperty name="member" property="pwd"/>
	<jsp:setProperty name="member" property="name"/>
	<jsp:setProperty name="member" property="tel"/>
	<jsp:setProperty name="member" property="address1"/>
	<jsp:setProperty name="member" property="address2"/>
	<jsp:setProperty name="member" property="email"/>
</jsp:useBean>

<!-- 3번 방법 : 액션태그 사용 : 변수값을 한꺼번에 받는 방법 - 에러발생 : 폼의 날짜가 문자열로 넘어와서 db 테이블의 날짜와 타입이 호환되지 않음 -->
<%-- <jsp:useBean id="member" class="member.MemberDataBean">
	<jsp:setProperty name="member" property="*"/>
</jsp:useBean> --%>

<%
MemberDBBean memberPro = MemberDBBean.getInstance();
int check = memberPro.updateMember(member);

out.print("<script>");
if(check == 1) {        // 수정 성공
	out.print("alert('회원정보 수정에 성공하였습니다.');");
} else if(check == 0) { // 수정 실패
	out.print("alert('회원정보 수정에 실패하였습니다.');");
}
out.print("history.back();");
out.print("</script>");
%>

</body>
</html>