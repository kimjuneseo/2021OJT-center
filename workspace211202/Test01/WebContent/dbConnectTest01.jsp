<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%-- 지시문(directive) --%>
<%@page import="java.sql.Connection"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 드라이버 테스트</title>
</head>
<body>

<h2>JDBC 드라이버 테스트</h2>
<%-- Java DateBase Connectivity --%>

<%
Connection conn = null;

try{ //실행구문
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbId = "sdhs2111";
	String dbPwd = "1234";
	
	Class.forName("oracle.jdbc.driver.OracleDriver"); //oracle 드라이버 연결
	conn = DriverManager.getConnection(url, dbId, dbPwd);
	out.print("드라이버 연결에 성공하였습니다.");
} catch(Exception e){ // 에러발생시 실행할 구문
	e.printStackTrace();
	out.print("드라이버 연결에 실패하였습니다.");
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