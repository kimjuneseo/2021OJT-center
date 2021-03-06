<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.MultipartFilter"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="javax.swing.DefaultFocusManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {border 1px solid black; border-collapse: collapse;}
	th, td{border 1px solid black; }
</style>
</head>
<body>
<h3>파일 업로드 라이브러리를 이용해 파일 업로드 구현</h3>
<%
request.setCharacterEncoding("utf-8");

String originFileName = ""; // 파일 이름- 업로드 전의 원본 파일 이름
String realFolder = ""; // 웹 애플리케이션의 절대 경로
String fileName = ""; //파일 이름 -  업로드 후에 저장된 파일 이름
long fileSize = 0; // 업로드된 파일 크기


MultipartRequest imageUp = null;	// 파일 업로드 클래스
String saveFolder = "/imageFile"; // 파일 업로드되는 폴더명
String encType = "utf-8";		  // 인코딩 방식
int maxSize = 5 * 1024 *1024; // 최대 업로드 파일 크키, 바이트 단위, 5MB

// 현재 jsp 페이지의 웹 애플리케이션의 절대경로를 구함
ServletContext context = getServletContext();
realFolder = context.getRealPath(saveFolder);

try{
	// MultipartRequest 클래스 생성자의 매개변수
	// request, 파일이 저장되는 경로, 파일 업로드 최대크기, 인코등방식, 붕복파일이름 명
	 imageUp = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	// 전송한 파일 정보를 가져옴
	Enumeration<?> files = imageUp.getFileNames();
	
	while(files.hasMoreElements()){
		String name = (String)files.nextElement();  //files name 속성값
		fileName = imageUp.getFilesystemName(name); //서버에 저장된 파일 이름
		originFileName = imageUp.getOriginalFileName(name);
		/* fileSize = imageUp.getOriginalFileName(originFileName); */
	}
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<table>
	<tr>
		<th>올린이</th>
		<th><%=imageUp.getParameter("name") %></th>
	<tr>
	<tr>
		<th>저장 폴더</th>
		<th><%=realFolder %></th>
	<tr>
	<tr>
		<th>파일명</th>
		<th><%=fileName %></th>
	<tr>
	<tr>
		<th>파일길이</th>
		<th><%=fileName.length() %></th>
	<tr>
	<tr>
		<th>원본 파일명</th>
		<th><%=originFileName%></th>
	<tr>
</table>
</body>
</html>