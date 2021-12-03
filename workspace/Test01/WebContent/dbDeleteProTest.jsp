<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 </title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); //한글처리 %>
	<h2>회원 정보 입력 처리</h2>
	<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	%>
	아이디: <%=id %><br>
	비밀번호: <%=pwd %><br>
	<%
Connection conn = null;
PreparedStatement pstmt = null;
	
try{ //실행구문
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbId = "sdhs2111";
	String dbPwd = "1234";
	
	Class.forName("oracle.jdbc.driver.OracleDriver"); //oracle 드라이버 연결
	conn = DriverManager.getConnection(url, dbId, dbPwd);
	String sql = "DELETE FROM member WHERE id = ? and pwd = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pwd);	
	pstmt.executeUpdate();
	
	out.print("회원 수정에 성공하였습니다.");
} catch(Exception e){ // 에러발생시 실행할 구문
	e.printStackTrace();
	out.print("회원 수정에 실패하였습니다.");
} finally { //예외 발상 유뮤와 상관없이 반드시 실행하야할 구문
	if(conn != null){
		try{
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		};
	}
};
%>
</body>
</html>