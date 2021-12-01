<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 사용하는 페이지</title>
</head>
<body>
<h2>생성한 쿠키를 가져오는 페이지</h2>
<%

Cookie[] cookies = request.getCookies(); // 생선한 모든 쿠키를 가져와서 배열로 저장
if(cookies != null){ // 쿠키가 존재한다면
	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("cookieId")){ // 쿠키 배열 중에서 내가 만든 쿠키인 cookieId를 찾았다면
			out.print("쿠키의 이름은 " + cookies[i].getName() + "이고, " );
			out.print("쿠키의 값은 " + cookies[i].getValue() + "입니다." );
		}
	}
}

%>
</body>
</html>