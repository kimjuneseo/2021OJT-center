<%@page import="board.BoardDataBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
// 글등록시에 필요한 정보 : 글정보(sequence), 작성자, 글제목, 글내용, 등록일자(default), 조회수(default), 이미지파일이름
// 글등록에 꼭 필요한 4가지 정보 획득 : 작성자(id), 글제목, 글내용, 이미지파일명
// 파일 업로드를 처리를 위해 MultipartRequest 클래스를 사용(request)
// MultipartRequest 생성시에 들어가는 5가지 정보: request
MultipartRequest imageUp = null;
String realFolder = "d:/1sdhs2021김준서/board_images"; // 업로드된 이미지 저장 폴더
int maxSize = 1024 * 1024 * 5; // 파일 최대크기, 5MB
String encType = "utf-8"; // 인코딩 방식
String fileName = ""; // 파일 이름


// 업로드 파일 처리
try{
	imageUp = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	Enumeration<?> files = imageUp.getFileNames();
	
	while(files.hasMoreElements()){
		String name = (String)files.nextElement();
		fileName = imageUp.getFilesystemName(name); // 업로드된 파일이름
	}
}catch(Exception e){
	e.printStackTrace();
}

// 폼에서 넘어오는 3개 데이터를 MultipartRequest 객체를 통해서 처리
// MultipartRequest는 useBean 액션태그를 사용할 수 없음
/* <jsp:useBean id="board" class="board.BoardDataBean">
<jsp:setProperty name="board" property="*"/>
</jsp:useBean> */

String subject = imageUp.getParameter("subject");
String content = imageUp.getParameter("content");

String id = (String)session.getAttribute("memberId");


BoardDataBean board = new BoardDataBean();
board.setWriter(id); //세션에서 획득
board.setSubject(subject); // 폼에서 획득
board.setContent(content); // 폼에서 획득
board.setImagfile(fileName); // 폼에서 획득, 폼에서 입력한 것이 없다면 테이블의 디폴트값을 사용

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