<%@page import="board.BoardDataBean"%>
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
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	int num = Integer.parseInt(request.getParameter("num"));
	System.out.print(content);
	BoardDataBean board = new BoardDataBean();
	board.setSubject(subject);
	board.setContent(content);
	board.setNum(num);
	
	BoardDBBean boardPro = BoardDBBean.getInstance();
	int chk = boardPro.boardUpdate(board);
	out.print("<script>");

	if(chk == 0 ){
		out.print("alert('삭제에 실패하였습니다'); ");	
		
	} 
	out.print("location= '../board/boardContent.jsp?num="+ num +"';");
	out.print("</script>");
%>
</body>
</html>