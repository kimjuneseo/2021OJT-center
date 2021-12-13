<%@page import="com.sun.jmx.snmp.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
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
	<h2>회원 정보 입력 처리</h2>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>비번</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소1</th>
			<th>주소2</th>
			<th>이메일</th>
			<th>가입날짜</th>
		</tr>
		<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{ //실행구문
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbId = "sdhs2111";
			String dbPwd = "1234";
			
			Class.forName("oracle.jdbc.driver.OracleDriver"); //oracle 드라이버 연결
			conn = DriverManager.getConnection(url, dbId, dbPwd);
			String sql = "select * from member";
			pstmt = conn.prepareStatement(sql);	
			rs = pstmt.executeQuery();
			while(rs.next()){
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String tel = rs.getString("tel");
				String address1 = rs.getString("address1");
				String address2 = rs.getString("address2");
				String email = rs.getString("email");
				Timestamp regdate = rs.getTimestamp("regdate");
				%>
				<tr>
					<td><%=id%></td>
					<td><%=pwd%></td>
					<td><%=name%></td>
					<td><%=tel%></td>
					<td><%=address1%></td>
					<td><%=address2%></td>
					<td><%=email%></td>
					<td><%=regdate%></td>
				</tr>
				<%
					}
				%>
			</table>
			<%
		} catch(Exception e){ // 에러발생시 실행할 구문
			e.printStackTrace();
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