<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기 페이지</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap');
/*전체영역*/
a{text-decoration: none; color:#99424f;}
.grid{display: grid;}
#container{ width: 900px; margin: 20px auto;}
.content{grid-template-columns: 30% 70%; grid-template-rows: 200px 300px;}
.btn { padding:10px; background: #b4baba; border: none; border-radius: 5px; font-family: 'Noto Sans KR', sans-serif; color: #; cursor: pinter; }
.btn:hover { background: #585555; transition: .5s}
/* 제목 */
#m_title { margin-bottom: 10px; font-size: 3em; text-align: center; font-family: 'Permanent Marker', cursive; }
#s_title { margin-bottom: 10px; font-size: 1.75em; font-weight: 900; font-family: 'Noto Sans KR', sans-serif; text-align: center;}
</style>
</head>
<body>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDBBean boardPro = BoardDBBean.getInstance();
	BoardDataBean board =  boardPro.getBoard(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>

<div id="container">
	<div id="m_title">Street Woman Fighter</div>
	<div id="s_title">글 상세보기</div>
	<div class="grid content">
		<div>제목</div>
		<div><%=board.getSubject() %></div>
		<div>내용</div>
		<div><%=board.getContent() %></div>
		<div><%=board.getWriter() %></div>
		<div><%=sdf.format(board.getRegdate()) %></div>
	</div>
</div>
</body>
</html>