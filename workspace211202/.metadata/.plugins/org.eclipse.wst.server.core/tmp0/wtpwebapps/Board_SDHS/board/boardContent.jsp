<%@page import="review.ReviewDataBean"%>
<%@page import="review.ReviewDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기 페이지</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap')
	;

:root { -
	-line_color: #2c3e7e; -
	-back_color: #f2f4fb;
}
/*전체영역*/
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
	color: #000;
	transition: .3s
}

a:hover {
	color: #99424f;
	transition: .3s
}

h2 {
	text-align: center;
}

input {
	width: 100%;
	height: 100%;
	border: hidden;
}

.btn {
	padding: 10px;
	background: #b4baba;
	border: none;
	border-radius: 5px;
	font-family: 'Noto Sans KR', sans-serif;
	color: #;
	cursor: pinter;
}

.btn:hover {
	background: #585555;
	color: #fff;
	transition: .5s
}

.grid {
	display: grid;
}

.flex {
	display: flex;
}

#container {
	width: 1500px;
	margin: 20px auto;
}

.form {
	border-top: 3px solid var(- -line_color);
}

.form>div {
	height: 70px; border : 1px solid #999;
	border-bottom: none;
	border-right: none;
	border-left: none;
	border: 1px solid #999;
}

.content {
	grid-template-columns: 15% 85%;
}

.content div:nth-of-type(7), .content div:nth-of-type(8) {
	border-bottom: 3px solid #000;
}

.content_grid {
	grid-template-columns: 15% 43.5% 15% 43.5%;
}

.form .grid>div {
	background: var(- -back_color);
	align-items: center;
}

.form h2 {
	color: var(- -line_color);
	font-size: 1.4rem
}

.m_item {
	padding-bottom: 20px;
	justify-content: right;
}
/* 제목 */
#m_title {
	margin-bottom: 10px;
	font-size: 3em;
	text-align: center;
	font-family: 'Permanent Marker', cursive;
}

#s_title {
	margin-bottom: 40px;
	font-size: 1.75em;
	font-weight: 900;
	font-family: 'Noto Sans KR', sans-serif;
	text-align: center;
}

.content__text {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1rem;
	color: #000;
	font-weight: 600;
	text-decoration: none;
}

.d_login {
	grid-template-columns: 80px 80px;
	justify-content: right;
	text-align: right;
}

.big__board {
	position: fixed;
	top: 250px;
	left: 1%
}

.big__board>div {
	border-top: 2px solid var(- -line_color);
	padding: 10px
}

.read_count {
	grid-template-columns: 15% 85%;
}

.board__content {
	color: #666;
	width: 250px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.right {
	width: 75%;
	margin: 0 auto;
}

.right>.btns {
	padding-top: 10px;
	justify-content: center;
	gap: 20px;
}

.content___ {
	height: 500px
}
</style>
<script type="text/javascript">
window.onload = function() {
	let form = document.boardForm;
	let update_btn = document.querySelector("#btn_update");
	let delete_btn = document.querySelector("#btn_delete");
	let insert_btn = document.querySelector("#btn_insert");
	
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
	String id = (String) session.getAttribute("memberId");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	int num = Integer.parseInt(request.getParameter("num"));
	boardPro.readCountOnePlus(num);
	BoardDataBean board = boardPro.getBoard(num);

	ReviewDBBean reviewPro = ReviewDBBean.getInstance();
	List<ReviewDataBean> reviewList = reviewPro.getReview(num);
	%>


	<div id="container">
		<div id="m_title">Street Woman Fighter</div>
		<div id="s_title">글 상세보기</div>
		<div class="m_item grid">
			<div class="d_login grid">
				<div id="d_id">
					<a href="../member.memberInfoform.jspD"><%=id%>님</a>
				</div>
				<div id="btn_logout">
					<a href="../member/memberLogout.jsp">로그아웃</a>
				</div>
			</div>
		</div>

		<div class="big__board">
			<%
				for (BoardDataBean boards : boardList) {
			%>
			<div>
				<div class="big__item grid ">
					<div>
						<a class="content__text"
							href="boardContent.jsp?num=<%=boards.getNum()%>"><%=boards.getSubject()%></a>
					</div>
				</div>
				<p class="board__content"><%=boards.getContent()%></p>
				<div class="flex">
					<div>
						작성자:
						<%=boards.getWriter()%></div>
					&ensp;
					<div>
						조회수:
						<%=boards.getReadcount()%></div>
				</div>
			</div>
			<%
				}
			%>
		</div>
		<div class="right ">
			<form action="boardUpdatePro.jsp" method="post" name="boardForm">
				<div class="form">
					<div class="grid content">
						<div class="grid">
							<h2>제목</h2>
						</div>
						<div>
							<input type="text" name="subject"
								value="<%=board.getSubject()%>">
						</div>
					</div>
					<div class="content_grid grid">
						<div class="grid">
							<h2>등록일자</h2>
						</div>
						<div>
							<input type="text" name="content"
								value="<%=sdf.format(board.getRegdate())%>">
						</div>
						<div class="grid">
							<h2>작성자</h2>
						</div>
						<p><%=board.getWriter()%></p>
					</div>
					<div class="content___">
						<div><%=board.getContent()%></div>
					</div>
					<div class="read_count grid">
						<div class="grid">
							<h2>조회수</h2>
						</div>
						<p><%=board.getReadcount()%></p>
					</div>
				</div>
				<input type="hidden" name="num" value="<%=board.getNum()%>">
			</form>
			<div class="btns flex">
				<button class="btn" id="btn_insert">
					<a href="boardInsertForm.jsp">글쓰기</a>
				</button>
				<button class="btn" id="btn_update">글수정</button>
				<button class="btn" id="btn_delete">글삭제</button>
				<button class="btn">
					<a href="boardList.jsp">돌아가기</a>
				</button>
			</div>
			<div class="reviews">
				<% for(ReviewDataBean reviews : reviewList){%>
				<div class="s_review flex">
					<div class="s_writer"><%=reviews.getWriter() %></div>
					<div class="s_content"><%=reviews.getContent() %></div>
				</div>
				<%}%>
			</div>
		</div>

	</div>
</body>
</html>