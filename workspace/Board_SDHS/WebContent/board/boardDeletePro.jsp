<%@page import="board.BoardDBBean"%>
<%@page import="board.BoardDataBean"%>
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

BoardDataBean board = new BoardDataBean();
board.setSubject(subject);
board.setContent(content);
board.setNum(num);

BoardDBBean boardPro = BoardDBBean.getInstance();
int chk = boardPro.boardDelete(num);
out.print("<script>");
if(chk == 0) {        
	out.println("alert('삭제에 실패하였습니다.\\n다시 입력해 주세요.');");
	out.print("history.back();");
} else { 
	out.println("alert('삭제에 성공하였습니다.');");
	out.print("location='boardList.jsp'");
}
out.print("</script>"); 
%>
</body>
</html>