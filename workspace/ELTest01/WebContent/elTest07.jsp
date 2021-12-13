<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 
pageContext
- java.servlet.pageContex 클래스에 정의된 기능을 통해서 JSP 내장객체들에 설정되어 있는 여러가지 정보에 접근하여 사용할 수 있음.
- page, reqeust, response, exception, 에러, servletConfig, servletContext
 -->
 
 <h2>request 객체 정보</h2>
request 객체 : ${pageContext.request }<br>
request URI : ${pageContext.request.requestURI }<br>
request URL : ${pageContext.request.requestURL }<br>
essionId : ${pageContext.request.requestedSessionId }<br>
param 값 :${pageContext.request.queryString }<br>

<hr>
<h2>EL을 사용하지 않고 reqeust 객체 정보</h2>
request 객체 :<%=pageContext.getRequest() %> <br>
request URI :<%=pageContext.getRequest() %><br>
request URL : <br>
essionId : <br>
param 값 :<br>

</body>
</html>