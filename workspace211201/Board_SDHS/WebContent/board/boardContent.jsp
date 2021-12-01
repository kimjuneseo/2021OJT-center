<%@page import="java.util.List"%>
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
*{box-sizing: border-box; margin: 0; padding: 0;}
a{text-decoration: none; color:#99424f;}
h2{text-align: center;}
.btn { padding:10px; background: #b4baba; border: none; border-radius: 5px; font-family: 'Noto Sans KR', sans-serif; color: #; cursor: pinter; }
.btn:hover { background: #585555; color: #fff; transition: .5s}
.grid{display: grid;}
.flex{display: flex;}
#container{ width: 1500px; margin: 20px auto;}

.content{grid-template-columns: 30%  minmax(70%, auto); grid-template-rows: 50px 300px 50px 50px ; }
.content div{ border: 3px solid #000; border-bottom: none; border-right: none;}
.content div:nth-of-type(7), .content div:nth-of-type(8){border-bottom: 3px solid #000;}
.content div:nth-of-type(2), .content div:nth-of-type(4), .content div:nth-of-type(6),.content div:nth-of-type(8){border-right: 3px solid #000;}
.content .grid{ background: #b4baba; align-items: center; }
.m_item{  padding-bottom: 20px; justify-content: right ; }
/* 제목 */
#m_title {  margin-bottom: 10px; font-size: 3em; text-align: center; font-family: 'Permanent Marker', cursive; }
#s_title { margin-bottom: 40px; font-size: 1.75em; font-weight: 900; font-family: 'Noto Sans KR', sans-serif; text-align: center;}
.d_login { grid-template-columns: 80px 80px; justify-content: right ; text-align: right;}
.big{width: 100%; grid-template-columns: 30% 70%; justify-content: center;}
#num{display: none;}
</style>
<script type="text/javascript">
window.onload = function() {
	let form = document.boardForm;
	document
	let update_btn = document.querySelector("#update");
	let delete_btn = document.querySelector("#delete");
	
	update_btn.addEventListener("click", () => {
		if(!form.subject.value) {
			alert("제목 입력해주세요.");
			form.subject.focus();
			return;
		};
		if(!form.content.value) {
			alert("내용 입력해주세요.");
			form.content.focus();
			return;
		};
		form.action = "boardUpdatePro.jsp";
		form.submit(); 
	});
	delete_btn.addEventListener("click", () => {
		form.action = "boardDeletePro.jsp";
		form.submit();
	});
};
</script>
</head>
<body>

<%
	BoardDBBean boardPro = BoardDBBean.getInstance();
	List<BoardDataBean> boardList = boardPro.getBoardList(); 
	int cnt = boardList.size(); 
	String id = (String)session.getAttribute("memberId");
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDataBean board = boardPro.getBoard(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>

<div id="container">
		<div id="m_title">Street Woman Fighter</div>
		<div id="s_title">글 상세보기</div>
		<div class="m_item grid">
			<div class="d_login grid">
				<div id="d_id"><%=id %>님</div>
				<div id="btn_logout"><a href="../member/memberLogout.jsp">로그아웃</a></div>
			</div>
			<div class="btns ">
				<button class="btn" id="update">글수정</button>
				<button class="btn" id="delete">글삭제</button>
				<button class="btn" onclick="boardList.jsp">돌아가기</button>
			</div>
		</div>
	<div class="big grid">
		 <div>
			<%
			for(BoardDataBean boards : boardList) {
			%>
				<div class="flex">
					<div><%=cnt--  %></div>
					<div><a href="boardContent.jsp?num=<%=boards.getNum()%>"><%=board.getSubject() %></a></div>
					<div><%=boards.getWriter() %></div>
					<div><%=sdf.format(boards.getRegdate()) %></div>
					<div><%=boards.getReadcount() %></div>
				</div>
				<%
				}
				%>
		</div>
		<form action="boardUpdatePro.jsp" method="post" name="boardForm">
			<div class="grid content">
				<div class="grid"><h2>제목</h2></div>
				<div><input type="text" name="subject" value="<%=board.getSubject() %>"></div>
				<div class="grid"><h2>내용</h2></div>
				<div><input type="text" name="content" value="<%=board.getContent() %>"></div>
				<div class="grid"><h2>작성자</h2></div>
				<div><%=board.getWriter() %></div>
				<div class="grid"><h2>작성일자</h2></div>
				<div><%=sdf.format(board.getRegdate()) %></div> 
				<input type="hidden" name="num" value="<%=board.getNum() %>">
			</div>
		</form>
	</div>
</div>
</body>
</html>