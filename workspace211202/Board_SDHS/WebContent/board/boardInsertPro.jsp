<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("memberId");
%>
<jsp:useBean id="board" class="board.BoardDataBean">
<jsp:setProperty name="board" property="*"/>
</jsp:useBean>
<%
BoardDBBean boardPro = BoardDBBean.getInstance();
int chk = boardPro.insertBoard(board);
out.print(chk);
out.print("<script>");
if(chk != 0 ){
out.print("alert('글쓰기에 성공하였습니다'); location = 'boardList.jsp';");
	
}else{
out.print("alert('글쓰기에 실패하였습니다'); history.back();");
}
out.print("</script>");
%>
</body>
</html>