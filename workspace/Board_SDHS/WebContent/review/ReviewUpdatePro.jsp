<%@page import="review.ReviewDBBean"%>
<%@page import="review.ReviewDataBean"%>
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
<jsp:useBean class="review.ReviewDataBean" id="review">
	<jsp:setProperty name="review" property="*"/>
</jsp:useBean>
<% 
int ref = Integer.parseInt(request.getParameter("ref"));
ReviewDBBean reviewPro = ReviewDBBean.getInstance();
int chk = reviewPro.updateReview(review);
out.print("<script>");
if(chk == 0) {        
	out.println("alert('삭제에 실패하였습니다.\\n다시 입력해 주세요.');");
	out.print("history.back();");
} 
out.print("location= '../board/boardContent.jsp?num="+ ref +"';");  
out.print("</script>"); 
%>
</body>
</html>