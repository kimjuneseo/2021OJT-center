<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardDBBean"%>
<%@page import="board.BoardDataBean"%>
<%@page import="java.util.List, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Monoton&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap');
/*전체영역*/
a{text-decoration: none; color:#99424f;}
#container{ width: 900px; margin: 20px auto;}
.btn { padding:10px; background: #b4baba; border: none; border-radius: 5px; font-family: 'Noto Sans KR', sans-serif; color: #; cursor: pinter; }
.btn:hover { background: #585555; transition: .5s}
/* 제목 */
#m_title { margin-bottom: 10px; font-size: 3em; text-align: center; font-family: 'Permanent Marker', cursive; }
#s_title { margin-bottom: 10px; font-size: 1.75em; font-weight: 900; font-family: 'Noto Sans KR', sans-serif; text-align: center;}
/* 로그인, 로그아웃 */
#d_login {display: flex; justify-content: right; gap:20px}
#d_id{color: #705e7b; cursor: pointer;}
#btn_logout{color:#99424f; cursor:pinter;}

/* 검색  */
#d_search { text-align: center; margin-bottom: 10px }
#s_search { width: 100px; height: 25px; }
#i_search { width: 350px; height: 25px; }
#btn_search { width: 100px; height: 25px; background: #add5bd; border: 0;}
/* 테이블 */
table { width: 100%; border: 1px solid #000; board-collapse: collapse;}
td { border: 1px solid #000; }
tr { height: 50px; }
th,td { text-align: center; }
</style>
</head>
<body>


<%
// 로그인을 했을 때 생성한 세션을 확인
String id = (String)session.getAttribute("memberId");
if(id == null){
	out.print("<script>alert('로그인을 해주세요'); location = '../member/memberLoginForm.jsp'</script>");
}

//DB 연동, 쿼리 실행
BoardDBBean boardPro = BoardDBBean.getInstance();
List<BoardDataBean> boardList = boardPro.getBoardList();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
/* int cnt = boardPro.getBoardListCount(); */
int cnt = boardList.size();
%>

<div id="container">
	<div id="m_title">Street Woman Fighter</div>
	<div id="s_title">커뮤니티 게시판</div>
	<div id="d_login">
		<div id="d_id"><%=id %>님</div>
		<div id="btn_logout"><a href="../member/memberLogout.jsp">로그아웃</a></div>
	</div>
	<div id="d_search">
		<select name="s_search" id="s_search">
			<option>제목</option>
			<option>내용</option>
			<option>작성자</option>
		</select>
		<input type="search" id="i_search">
		<input type="button" value="검색" id="btn_search">
	</div>
	<table>
		<tr>
			<th width="6%">번호</th>
			<th width="58%">제목</th>
			<th width="15%">작성자</th>
			<th width="15%">작성일</th>
			<th width="6%">조회수</th>
		</tr>
		<%
		for(BoardDataBean board : boardList){
		%>
		<tr>
			<td><%=cnt--  %></td>
			<td><a href="boardContent.jsp?num=<%=board.getNum()%>"><%=board.getSubject() %></a></td>
			<td><%=board.getWriter() %></td>
			<td><%=sdf.format(board.getRegdate()) %></td>
			<td><%=board.getReadcount() %></td>
		</tr>
		<%
		}
		%>
	</table>
</div>

</body>
</html>