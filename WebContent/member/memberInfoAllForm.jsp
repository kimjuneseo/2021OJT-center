<%@page import="java.sql.Timestamp"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="member.MemberDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style >
@import url('https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap');
	*{padding: 0; margin: 0; box-sizing: border-box;}
	ul,li{list-style: none;}
	
	
	.container{width:1300px; margin:0 auto; }
	.flex{display: flex;}
	.grid{display: grid;}
	table{width: 100%;}
	
	#m_title { margin-bottom: 10px; font-size: 3em; text-align: center; font-family: 'Permanent Marker', cursive; }
	#s_title { margin-bottom: 10px; font-size: 1.75em; font-weight: 900; font-family: 'Noto Sans KR', sans-serif; text-align: center;}
	
	li{height: 70px}
	.memberList__container{flex-direction: column;}
	.memberList__menu, .memberList__content { width: 100%; grid-template-columns: repeat(7, 1fr); align-items:center; text-align: center;} 
	.memberList__menu li{ background: #585555; }
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	MemberDBBean member = MemberDBBean.getInstance();
	ArrayList<MemberDataBean> memberList = member.getAllMembers(id, pwd);
	
	out.print("<script>");
		if(id == "admin" && pwd == "1234"){
		}else{
			/* out.print("location = 'memberAdminLoginForm.jsp';"); */
		}
	out.print("</script>");
%>
	<div class="container">
		<div id="m_title">Street Women Fighter</div>
		<h2 id="s_title">회원전체조회</h2>
		<div border="1" class="memberList__container flex">
			<ul class="grid memberList__menu">
				<li>아이디</li>
				<li>비번</li>
				<li>이름</li>
				<li>전화번호</li>
				<li>주소</li>
				<li>이메일</li>
				<li>가입날짜</li>
			</ul>
<%
		for(MemberDataBean memberData : memberList){
			String ids = memberData.getId();
			String pwds = memberData.getPwd();
			String name = memberData.getName();
			String tel = memberData.getTel();
			String address1 = memberData.getAddress1();
			String address2 = memberData.getAddress2();
			String email = memberData.getEmail();
			Timestamp regdate = memberData.getRegdate();		
		
%>
				<ul class="grid memberList__content">
					<li><%=ids%></li>
					<li><%=pwds%></li>
					<li><%=name%></li>
					<li><%=tel%></li>
					<li><%=address1%> &nbsp; <%=address2%></li>
					<li><%=email%></li>
					<li><%=regdate%></li>
				</ul>
				
<%
		}
%>
			</div>
	</div>
	
</body>
</html>