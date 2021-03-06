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
/* 
session(세션)
- 페이지의 연결을 계속 유하하는 기능,
- 페이지의 만료시간이 지나거나, 강제로 세션을 삭제(무효화)하게 되면 세션이 종여
 
session 내장객체 메소드
- setAttribute(name, value): name과 value로 세션을 저장
- getAttribute(name): name을 통해서 value를 얻는 메소드
- getAttrubuteNames(): 세션 속성의 이름들을 Enumeration 객체러 저장
- getCreationTime(): 1970년 1월 1일 0시 0분을 기준으로 현재 세션이 발생한 시간까지의 경과시간을 1/1000초 값으로 리턴
- getId(): 세션에 할당된 고유 아이디를 리턴
- setMaxInactiveInterval(): 초 단위로 세션의 유지시간을 설정, 기본값은 1800초(30분)
- getMaxInactiveInterval(): 현재 생성된 세션의 유지시간을 리턴

- 세션 만료
- removeAttribute(name): 해당 세션을 종료
- invalidate(): 모든 세션을 종료

*/

%>
</body>
</html>