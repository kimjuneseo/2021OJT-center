<%@page import="review.ReviewDBBean"%>
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
%>
<jsp:useBean id="review" class="review.ReviewDataBean">
<jsp:setProperty name="review" property="*"/>
</jsp:useBean>
<%
ReviewDBBean reviewPro = ReviewDBBean.getInstance();
// 원글 번호
int num = review.getRef();
int chk = reviewPro.insertReview(review);
out.print(num);
out.print("<script>");

if(chk == 0 ){
	out.print("alert('내용을 입력해주세요'); ");	
	
} 
out.print("location= '../board/boardContent.jsp?num="+ num +"';");
out.print("</script>");
%>
</body>
</html>