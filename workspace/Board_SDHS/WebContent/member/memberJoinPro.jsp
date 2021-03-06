<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDataBean, member.MemberDBBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입처리</title>
</head>
<body>

<%
// 한글 처리
request.setCharacterEncoding("utf-8"); 

// < 폼에서 넘어오는 값을 획득하는 방법 >
// 1번 방법 - request 내장객체 활용하는 방법
/* String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String tel = request.getParameter("tel");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String email = request.getParameter("email"); 

//회원 객체 생성
MemberDataBean member = new MemberDataBean();
member.setId(id);
member.setPwd(pwd);
member.setName(name);
member.setTel(tel);
member.setAddress1(address1);
member.setAddress2(address2);
member.setEmail(email);
*/
%>
<%--
2번 방법 - 액션태그(action tag)를 활용하는 방법
- include 액션태그, forward 액션태그, useBean 액션태그(여기에서 사용)
--%>
<%--
<jsp:useBean id="member" class="member.MemberDataBean">
	<jsp:setProperty name="member" property="id"/>
	<jsp:setProperty name="member" property="pwd"/>
	<jsp:setProperty name="member" property="name"/>
	<jsp:setProperty name="member" property="tel"/>
	<jsp:setProperty name="member" property="address1"/>
	<jsp:setProperty name="member" property="address2"/>
	<jsp:setProperty name="member" property="email"/>
</jsp:useBean>
--%>
<%--
3번 방법 - 액션태그를 활용하는 방법
폼의 name과 자바빈의 멤버변수(property)와 DB 테이블의 필드 이름이 동일할 때 사용 가능
--%>
<jsp:useBean id="member" class="member.MemberDataBean">
	<jsp:setProperty name="member" property="*"/>
</jsp:useBean>

<%
// DB 연동, 쿼리 실행
// 리턴값 - check 변수 사용 : 1(가입 성공), 0(가입 실패)
MemberDBBean memberPro = MemberDBBean.getInstance();
int check = memberPro.insertMember(member);
out.print("<script>");
if(check == 0) {        // 회원 가입 실패
	out.println("alert('회원가입에 실패하였습니다.\\n다시 입력해 주세요.);");
	out.print("history.back();");
} else if(check == 1) { // 회원 가입 성공
	out.println("alert('회원가입에 성공하였습니다.\\n스트릿 우먼 파이터 팬카페에 오신것을 환영합니다.');");
	out.print("location='memberLoginForm.jsp'");
}
out.print("</script>");
%>

</body>
</html>