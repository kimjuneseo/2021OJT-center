<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
#container{ max-width: 1500px; margin: 20px auto;}
/* 제목 */
#m_title {  margin-bottom: 10px; font-size: 3em; text-align: center; font-family: 'Permanent Marker', cursive; }
#s_title { margin-bottom: 40px; font-size: 1.75em; font-weight: 900; font-family: 'Noto Sans KR', sans-serif; text-align: center;}
.d_login { grid-template-columns: 80px 80px; justify-content: right ; text-align: right;}

.content{grid-template-columns: 30%  minmax(70%, auto); grid-template-rows: 100px 200px; }
.content div{  border-bottom: none; border-right: none;}
.content .grid{align-items: center; }
.m_item{  padding-bottom: 20px; justify-content: right ; }

</style>
</head>
<body>
<%
String id = (String)session.getAttribute("memberId");
%>
<div id="container">
		<div id="m_title">Street Woman Fighter</div>
		<div id="s_title">글 상세보기</div>
		<div class="m_item grid">
			<div class="d_login grid">
				<div id="d_id"><a href="..member.member/Infoform.jspD"><%=id %>님</a></div>
				<div id="btn_logout"><a href="../member/memberLogout.jsp">로그아웃</a></div>
			</div>
			<div class="btns ">
				<button class="btn" id="btn_insert" ><a href="boardInsertForm.jsp">글쓰기</a></button>
				<button class="btn" id="btn_update">글수정</button>
				<button class="btn" id="btn_delete">글삭제</button>
				<button class="btn"><a href="boardList.jsp">돌아가기</a></button>
			</div>
		</div>
	<div class="big grid">
		<form action="boardInsertPro.jsp" method="post" name="boardForm">
			<div class="grid content">
				<div class="grid"><h2>제목</h2></div>
				<div><input type="text" name="subject" ></div>
				<div class="grid"><h2>내용</h2></div>
				<div><input type="text" name="content" ></div>
				<input type="hidden" name="writer" value="<%=id %>">
			</div>
			<input type="submit" value="전송" class="btn">
		</form>
	</div>
	</div>
	
</div>
</body>
</html>