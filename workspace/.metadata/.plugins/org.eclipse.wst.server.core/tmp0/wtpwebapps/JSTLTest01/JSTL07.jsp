<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h2>JSTL - sql 라이브러리</h2>
<sql:setDataSource var="conn"
driver="oracle.jdbc.driver.OracleDriver"
url="jdbc:oracle:thin:@localhost:1521:xe"
user="sdhs2111"
password="1234"
/>

<!-- ${conn} -->

<!-- 데이터삽입 -->
<%-- <sql:update dataSource="${conn }">
	insert into test01(id, name) values(1, '육치성')
</sql:update>
 --%>
 
 <!-- 100건의 데이터를 한꺼번에 삽입 -->
<%-- <c:forEach var="i" begin="1" end="100">
	<sql:update dataSource="${conn }">
		insert into test01(id, name) values(${i+1 }, concat('허니제이',${i+1 }))
	</sql:update>	
</c:forEach> --%>

<!-- 데이터 수정: id가 2인 데이터의 name을 모니카로 변경 -->
<%-- <sql:update dataSource="${conn }">
	update test01 set name='모니카' where id=2
</sql:update>
 --%>
 
<!-- 데이터 색제 :id가 2인 데이터를 삭제 -->
 <%-- <sql:update dataSource="${conn }">
 	delete from test01 where id=2
 </sql:update> --%>
 
 <!-- 데이터 조회 -->
 <%-- <sql:query var="" dataSource="${conn }">
 	select * from test01
 </sql:query>
 <c:forEach var="data" items="${rs.rows }">
 	아이디 ${data.id }, 이름 ${data.name }<br>
 </c:forEach> --%>
 
 <!-- 데이터 조회: 선택  -->
<%--  <sql:query var="rs" dataSource="${conn }">
 	select * from test01 where id=${param.id }
 </sql:query>
 
 <c:forEach var="data" items="${rs.rows }" >
 	아이디: ${data.id }, 이름: ${data.name } <br> 
 </c:forEach>
 --%> 

<!-- 데이터 조회2번 방법 : 선택 -->
<sql:query var="rs" dataSource="${conn }">
	select * from test01 where id=?
	<sql:param>${param.id }</sql:param>
</sql:query>

<c:forEach var="data" items="${rs.rows }" >
 	아이디: ${data.id }, 이름: ${data.name } <br> 
 </c:forEach>


 
</body>
</html>