<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page session="false" %> 
 <%@ page buffer="16KB" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디렉티브 연습</title>
</head>
<body>
<%-- 디렉티브 형태: <%@ %> --%>
<% 
/* directive: 지시어, 지시자 
- 클라이언트가 웹브라우저를 통해 전달하는 요청(reqeust)을 직접적으로 처리하기 위한 문법이 아니라,
- 웹컨테이너가 JSP 페이지를 서블릿 역확을 할 클래스로 변환할 떄 해당 페이지를 어떻게 처리할 것인지에 대한 여러가기 정보를 지정해주는 역활
- 간당하게 정리하면, JSP 페이지가 실행될 때 필요한 여러가지 설정 정보의 지정에 사용됨
- 종류: page, include, taglib

- 1. page 디렉티브
- 생성되는 문서의 타입, 스크립트 언어, import할 클래스, 세션 및 버퍼의 사용 여부, 버퍼의 크기 등 
- 가장 기본적으로 JSP 페이지의 필요한 설정 정보를 지정한다
- 속성 : info, language, contentType, extends, import, session, buffer, autoFlush, isThreadSafe,
- errorPage, isErrorPage, pageEncoding, isElignored

- info : 페이지를 설명해 주는 속성, 많이 사용하는 기능은 아님
- language: JSP 페이지에서 사용하는 언어, 필수적으로 사용, JSP 페이지를 생성하면 자동으로 지정
- contentType: JSP 페이지가 생성할 문서의 타입을 설정한다, 필수적으로 사용, JSP 페이지를 생성하면 자동으로 생성
- extends: JSP 페이지에서 상속받을 클래스를 지정할 때 사용, 많이 사용하는 기능은 아님
- import: JSP 페이지에서 다른 패키지에 있는 클래스를 사용할 때 지정하는 속성, 자주 사용한느 기능
- session: 세션의 사용여부를 지정하는 속성, 기본값은 true, ex) JSP페이지에서 세션의 사용이 불가하도록 설정하려면 session="false"
- buffer: JSP 페이지의 출력 버퍼의 크키를 지정 , 기본값은 8KB, 주로 기본값을 사용함, ex) 변경하고 싶다면 buffer="16KB"
- autoFlush: 출력 버퍼가 다 찰 경우에 내용을 처리하는 벙법은 설저으 기본값은 true
- isThreadSafe: JSP 페이지에 다중 쓰레드의 사용을 허용할지 여부를 설정하는 것, 기본값은 true
- errorPage: 에러의 발생시에 에러를 처리할 페이지를 지정하는 속성
- isErrorPage: 해당 페에지를 에러 페이지로 지정하여 속성, flase
- oageEnCoding.
*/

%>
</body>
</html>