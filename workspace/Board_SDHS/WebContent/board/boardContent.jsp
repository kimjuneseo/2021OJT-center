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

:root { 
		--line_color: #2c3e7e; 
		--back_color: #f2f4fb;
		
		/* z-index  */
		--on_index: 100;
		--under_index:10;
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
	background: var(--line_color);
	border: none;
	font-family: 'Noto Sans KR', sans-serif;
	color: #fff;
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
	border-top: 3px solid var(--line_color);
	border-bottom: 3px solid var(--line_color);	
	
}


.form>.small {
	height: 50px; 
	border : 1px solid #999;
	border-right: hidden;
	border-left: hidden;
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
	background: var(--back_color);
	align-items: center;
	margin-right: 10px;
}

.form p{
	line-height: 40px;
}

.form h2 {
	color: var(--line_color);
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
	top: 10px;
	left: 1%
}

.big__board>div {
	border-top: 2px solid var(--line_color);
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
	padding-bottom: 10px;
	justify-content: flex-end;
	gap: 20px;
	border-bottom: 4px solid var(--line_color);
}

.content___ {
	height: 400px;
	padding: 20px
}

.s_re{  color: red; font-weight: 900; font-size: .9rem;}
.d_sc{ width: 75%; margin: 0 auto; color: var(--line_color); text-align: left; font-weight: 900;}
.content___>textarea{ max-width:100%; max-height:100%; width: 100%; height: 100%; border: none;}

/* 댓글 작성  */
.reviewForm {padding: 10px 0px; }
.reviewForm__reviewitems{grid-template-columns:90% 10%; align-items: center;}
.reviewForm textarea{max-width:100%; max-height: 100px; height: 100px; border: none;}

/* 댓글 리스트 */
.review__item {width: 100%; position:relative; z-index: var(--under_index); border-top:3px solid var(--line_color)}

.review__item>div{border: 1px solid #666; border-left: hidden;border-right: hidden; border-bottom: hidden;}
.review__subtitle{background: var(--back_color); text-align: center;}

.review__num { height:50px; grid-template-columns: 15% 85%; }
.review__num div{width:100%; height:100%; line-height: 40px}
.review__writer{ height:50px;grid-template-columns: 15% 42.4% 15% 25.5%}
.review__content{height: 100px; padding: 10px; border: none;}

.review__btns {position: absolute; top: 10px; right: 0; z-index: var(--on_index); gap:10px}

/* 페이징 영역 */
#paging { padding-top:10px; display: flex; gap:15px; justify-content: center;}
#paging div{width:17px; border-bottom: 1px solid #000; text-align: center;}
</style>
<script type="text/javascript">
window.onload = function() {
	let board_form = document.boardForm;
	let update_btn = document.querySelector("#btn_update");
	let delete_btn = document.querySelector("#btn_delete");
	let insert_btn = document.querySelector("#btn_insert");
	if(update_btn){
	update_btn.addEventListener("click", () => {
		if(!board_form.subject.value) {
			alert("제목 입력해주세요.");
			board_form.subject.focus();
			return;
		};
		if(!board_form.content.value) {
			alert("내용 입력해주세요.");
			board_form.content.focus();
			return;
		};
		board_form.action = "boardUpdatePro.jsp";
		board_form.submit(); 
	});
	
	delete_btn.addEventListener("click", () => {
		board_form.action = "boardDeletePro.jsp";
		board_form.submit();
	});
	}
	let review_form = document.reviewForm;
	let reviewdelete_btn = document.querySelectorAll(".review__btn--delete");
	let review_update_btn = document.querySelectorAll(".review__btn--update");
	
	reviewdelete_btn.forEach(e => {
		e.addEventListener("click", ({target}) => {
			form = target.closest("form");
			console.log(form);
			form.action = '../review/ReviewDeletePro.jsp'
			form.submit();
		})
	})
	
	review_update_btn.forEach(e => {
		e.addEventListener("click", ({target}) => {
			form = target.closest("form");
			console.log(form);
			form.action = '../review/ReviewUpdatePro.jsp'
			form.submit();
		})
	})
	
	
};
</script>
</head>
<body>

	<%
		BoardDBBean boardPro = BoardDBBean.getInstance();
	List<BoardDataBean> boardList = boardPro.getBoardList(2, 10);

	int cnt = boardList.size();
	String id = (String) session.getAttribute("memberId");

	// 원글에 대한 댓글 리스트의 페이징 처리 변수 (5건씩 1페이지 노출, 페이지 블럭은 5개)
	int pageSize = 5; //1페이지 5건의 댓글을 노출
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) pageNum = "1";
	
	// 댓글의 현재 페이지, 댓글의 첫번째 행, 댓글의 마지막 행
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1 )* pageSize + 1;
	int endRow = currentPage * pageSize;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	int num = Integer.parseInt(request.getParameter("num"));
	boardPro.readCountOnePlus(num);
	BoardDataBean board = boardPro.getBoard(num);
	// review 테이블 연동, 쿼리 실행
	ReviewDBBean reviewPro = ReviewDBBean.getInstance();
	int count = reviewPro.getReviewCount(num);
	List<ReviewDataBean> reviewList = reviewPro.getReview(num, currentPage, 5);
	
	int number = count - (currentPage-1)*pageSize;
	%>


	<div id="container">
		<div id="m_title">Street Woman Fighter</div>
		<div id="s_title">글 상세보기</div>
		<div class="m_item grid">
			<div class="d_login grid">
				<div id="d_id">
					<a href="../member/memberInfoform.jsp"><%=id%>님</a>
				</div>
				<div id="btn_logout">
					<a href="../member/memberLogout.jsp">로그아웃</a>
				</div>
				<button class="btn">
					<a href="boardList.jsp">전체 게시판</a>
				</button>
			</div>
		</div>
		<div class="d_sc">현재 게시글의 번호(<span><%=num %></span>)</div>


		<div class="right">
			<form action="boardUpdatePro.jsp" method="post" name="boardForm">
				<div class="form">
					<div class="grid content small">
						<div class="grid">
							<h2>제목</h2>
						</div>
						<div>
							<input type="text" name="subject"
								value="<%=board.getSubject()%>">
						</div>
					</div>
					<div class="content_grid grid small">
						<div class="grid">
							<h2>등록일자</h2>
						</div>
						<div>
							<input type="text" value="<%=sdf.format(board.getRegdate())%>">
						</div>
						<div class="grid">
							<h2>작성자</h2>
						</div>
						<p><%=board.getWriter()%></p>
					</div>
					<div class="content___">
						<textarea name="content"><%=board.getContent()%></textarea>
					</div>
					<div>
						<img alt="img" src="/board_images/<%=board.getImagfile()%>">
					</div>
					<div class="read_count grid small">
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
				<% if(id.equals(board.getWriter())){ %>
				<button class="btn" id="btn_update">글수정</button>
				<button class="btn" id="btn_delete">글삭제</button>
				<%} %>
			</div>
			<form class="reviewForm" method="post" action="../review/reviewInsertPro.jsp">
				<div class="reviewForm__reviewitems grid">
					<textarea rows="" cols="" name="content"></textarea>
					<button class="btn" id="btn_insert" type="submit">댓글작성</button>
				</div>
				<input type="hidden" name="writer" value="<%=id %>">
				<input type="hidden" name="ref" value="<%=num %>">
			</form>
			<div class="reviews">
			<div>댓글 리스트(댓글 갯수 : <span class="s_re"><%=count %></span>)</div>
			<%if(count == 0){ %>
				<div>댓글이 없습니다.</div>
			<% }else{
				 for(ReviewDataBean reviews : reviewList){%>
				<div class="review__item grid">
					<div class="review__num grid">
						<div class="review__subtitle">번호</div>
						<div><%=number-- %></div>
					</div>
					<div class="review__writer grid">
						<div class="review__subtitle">작성자</div>
						<div><%=reviews.getWriter() %></div>
						<div class="review__subtitle">작성일자</div>
						<div><%=reviews.getRegdate() %></div>
					</div>
				<% if(id.equals(reviews.getWriter())){ %>
				<form action="../review/ReviewDeletePro.jsp" method="post"  name="reviewForm">
					<input name="content" class="review__content grid" value="<%=reviews.getContent() %>">
					
					<input type="hidden" value="<%=reviews.getRenum() %>"  name="renum">
					<input type="hidden" value="<%=reviews.getRef() %>"  name="ref">
				<div class="review__btns flex">
					<input class="btn review__btn--delete" value="삭제" type="button">
					<input class="btn review__btn--update" value="수정" type="button">
				</div>
				</form>
				<%}else{%>
				<div class="review__content grid">
						<div><%=reviews.getContent() %></div> 
				</div>
				<%} %>
				</div>
				<%}
			}
				%>
				<!-- 페이징 처리 영역 -->
			<div id="paging">
			<%
			if(count > 0){
				// 전체페이지 수 : ex) 81건을 한 페이지의 5개의 댓글을 노출한다면  17ro
				int pageCount = count / pageSize + (currentPage%pageSize == 0 ? 0 : 1);
				int startPage = 1; // 시작 페이지 번호
				int pageBlock = 5; // 페이징 갯수
				
				// 시작 페이지 설정
				if(currentPage % 5 != 0)startPage = (currentPage/5)*5+1;
				else startPage = (currentPage/5-1)*5+1;
				
				// 끝 페이지 설정
				int endPage = startPage + pageBlock - 1;
				if(endPage > pageCount) endPage = pageCount;
				
				// 이전 페이징 처리
				if(startPage > 5){
					out.print("<a href='boardContent.jsp?num="+num+"&pageNum="+(startPage-5)+"'><div>"+ "◀"+"</div><a>");
				}
				
				// 페이징 블럭 처리
				for(int i=startPage; i<=endPage; i++){
					out.print("<a href='boardContent.jsp?num="+num+"&pageNum="+i+"'><div>"+i+"</div><a>");
				}
				
				// 다음 페이징 처리
				if(endPage < pageCount){
					out.print("<a href='boardContent.jsp?num="+num+"&pageNum="+(startPage+5)+"'><div>"+ "▶"+"</div><a>");
				}
			}
			
			%>
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
	</div>
	
</body>
</html>