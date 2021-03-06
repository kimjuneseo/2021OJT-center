<%@page import="review.ReviewDBBean"%>
<%@page import="review.ReviewDataBean"%>
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
:root { 
		--line_color: #2c3e7e; 
		--back_color: #f2f4fb;
}
a{text-decoration: none; color: var(--line_color); transition: .3s}
a:hover{ color:#99424f; transition: .3s}
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
table { width: 100%; border: 4px solid var(--line_color); border-collapse: collapse; border-left: hidden; border-right: hidden; color:var(--line_color)}
table .header{background: var(--back_color);}
td { border: 1px solid #000; }
tr { height: 50px; }
th,td { text-align: center; }
/* 페이징 처리 */
#paging { padding-top:10px; display: flex; gap:15px; justify-content: center;}
#paging div{width:17px; border-bottom: 1px solid #000; text-align: center;}
</style>
<script type="text/javascript">
window.onload = function() {
let btn_search = document.querySelector("#btn_search");
/* btn_search.addEventListener("click", () => {
	let s_search = document.querySelector("#s_search").value;  // 선택 상자
	let i_search = document.querySelector("#i_search").value;  // 입력 상자
	location = 'boardSearchPro.jsp?s_search='+ s_search + "&i_search=" + i_search;
}); */
}
</script>
</head>
<body>


<%
request.setCharacterEncoding("utf-8");


// 로그인을 했을 때 생성한 세션을 확인
String id = (String)session.getAttribute("memberId");
String pwd = (String)session.getAttribute("memberpwd");

if(id == null){
	out.print("<script>alert('로그인을 해주세요'); location = '../member/memberLoginForm.jsp'</script>");
}

// 페이지(pageing)처리 코드
int pageSize = 10; // 1개의 페이지에 10건의 게시글을 보여주는 변수
String pageNum = request.getParameter("pageNum");	// 페이지 번호를 클릭하여 이동할때 사용하는 변수 
if(pageNum == null) pageNum = "1"; 					// 페이지 번호가 없을 때, 로그인하여 게시글 페이지로 이동할 때

//DB 연동, 쿼리 실행
BoardDBBean boardPro = BoardDBBean.getInstance();

// 댓글 순서
int cnt = boardPro.getBoardListCount();

// 현재 페이지, 현재 페이지의 첫번째 행, 현재 페이지의 마지막 행
// 2페이지에서 10건, 11번부터 20번까지
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * pageSize + 1; // (2-1)*10 + 1 = 11 
int endRow = startRow + pageSize - 1;	// currentPage * pageSize, 11+10 == 20, 2*10 == 20

//날짜 포멧 설정
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

String s_search = request.getParameter("s_search");
String content = request.getParameter("content");

/* List<BoardDataBean> boardList = boardPro.getBoardList(); */
List<BoardDataBean> boardList = null; 
if(cnt > 0){
	boardList = boardPro.getBoardList(currentPage, 10, s_search, content); // 클릭한 페이지의 데이터를 10개 가져온느 메소드 
}
// 각 페이지에 해당ㄹ하는 글의 역순 번호
// 전체가 167개, 2페이지에서는 157번부터 148번까지
int number = cnt - (currentPage - 1) * pageSize; 

// 검색 기능
int search_cnt = boardPro.getBoardSearchListCount(s_search, content);
%>

<div id="container">
	<div id="m_title">Street Woman Fighter</div>
	<div id="s_title">커뮤니티 게시판</div>
	<div id="d_login">
		<div id="d_id"><a href=".."><%=id %>님</a></div>
		<div id="btn_logout"><a href="../member/memberLogout.jsp">로그아웃</a></div>
	</div>
	<form action="boardList.jsp" method="post" id="d_search">
		<select name="s_search" id="s_search">
			<option value="subject">제목</option>
			<option value="content">내용</option>
			<option value="writer">작성자</option>
		</select>
		<input type="search" id="i_search" name="content">
		<input type="submit" value="검색" id="btn_search">
	</form>
	<table>
		<tr class="header">
			<th width="6%">번호</th>
			<th width="58%">제목</th>
			<th width="15%">작성자</th>
			<th width="15%">작성일</th>
			<th width="6%">조회수</th>
		</tr>
<!-- 등록된 글이 없을 때  -->
<%if(cnt == 0){ %>	
		<tr><th colspan="5">등록된 들이 없습니다.</th></tr>
<!-- 등록된 글이 있을때  -->
<%} else { 	
		for(BoardDataBean board : boardList){ %>
		<tr>
			<td><%=number--  %></td>
			<td><a href="boardContent.jsp?num=<%=board.getNum()%>"><%=board.getSubject() %></a></td>
			<td><%=board.getWriter() %></td>
			<td><%=sdf.format(board.getRegdate()) %></td>
			<td><%=board.getReadcount() %></td>
		</tr>
		<%}
	} %>
	</table>
	<!-- 페이지 처리 영역 -->
	<div id="paging">
	<%
	if(cnt > 0){
		int startPage = 1;  // 시작페이지 번호
		int pageBlock = 10; // 노출하는 페이지 갯수
		// ex) 167건 데이터를 10건씩 보여주면 전체 페이지 객수 17개 , 160 -> 16개, 161~169까지는 17개
		int pageCount;
		if(content == null  || content.length() == 0){
			pageCount = cnt / pageSize + (cnt%pageSize == 0 ? 0 : 1); // 전체 페이지의 갯수
		}else{
			pageCount = search_cnt / pageSize + (cnt%pageSize == 0 ? 0 : 1); // 전체 페이지의 갯수
		}
		// 시작 페이지 설정
		if(currentPage % 10 !=0) startPage = (currentPage/10) * 10 + 1;
		else startPage = (currentPage/10-1)*10;
		
		// 끝 페이지 설정
		int endPage  = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		//이전 페이지 처리
		if(startPage>10){
			out.print("<div><a href='boardList.jsp?pageNum="+(startPage-10)+"&s_search="+s_search+"&content="+content+"'>◀</a></div>");
		}
		
		// 페이징 블럭 처리
		for(int i=startPage; i<=endPage; i++){
			out.print("<div><a href='boardList.jsp?pageNum="+i+"&s_search="+s_search+"&content="+content+"'>"+ i +"</a></div>");
		}
		
		// 다음 페이지 처리
		if(endPage < pageCount){
			out.print("<div><a href='boardList.jsp?pageNum="+(startPage+10)+"&s_search="+s_search+"&content="+content+"'>▶</a></div>");
		}
	}
	%>
	</div>
</div> 

</body>
</html>