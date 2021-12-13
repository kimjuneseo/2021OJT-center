<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
EL (Expression Language) - 표현 언어
- JSP 2.0버전에서 지원되는 특수한 형태를 가지는 스크립트 언어
- 에러 속성값들을 JSP 스크립트보다 함축적인 코드를 통해서 간결하고 편리하게 사용할 수 있어서 널리 사용되고 있다 

2. EL의 기능
- JSP의 네 가지 영역 객체가 제공하는 속성을 사용
- 수치 연산, 관계 연산, 논리 연산자 제공
- 자바 클래스 메소드 호출 기능 제공
- 쿠키, 기본 객체의 속성 등 JSP를 사용하기 위한 EL의 기본 객체 제공
- 람다식을 이용한 함수 정의와 실행 가능(EL 3.0)
- 스트림 API를 통한 컬렉션 처리 (EL 3.0)
- 정적 메소드 실행(EL 3.0)

3. EL의 예시 
- EL을 expression 비교
- 예) Member 클래스 객체인 member의 address 변수의 값을 출력
- expression:<%=member.getAddress()%>
- EL : ${member.address}

4. EL의 데이터 타입 : 정수, 실수, 문자열, boolean, null 5가지의 데이터 타입
- 정수 : 0~9로 이루어진 값, java.lang.Lang
- 실수 : 0~9로 이루어진 값, 소숫점(.) 사용할 수 있음, java.lang, Double
- 문자열 : 쌍따옴표로 둘러싼 ㄱ밧, java, lang, String
- boolean : true, false의 값
- null : null값

5. EL에서 사용할 수 있는 기본 객체
- pageContext : JSP의 내장 객체인 pageContext와 동일
- pageScope : pageContext 기본 객체에 저정된 속성의 <속성, 값> 매핑을 저장한 Map객체
- requestScope : request 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저정한 Map 객체
- sessionScope : session 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저정한 Map 객체
- applicationScope: application 기본 객체 저장된 속성 <속성, 값> 매핑을 저장한 Map 객체

- param : 요청 파라미터 <name, value> 매핑한 지정한 Map 객체, 파라미터의 값 타입은 String 타입,
--<% request.getParmeter(name); %>와 동일, ${{requestScope.names}

- paramValues : 요청 파라미터의 <값, 값의 배열> 매핑을 저장한 Map 객체, 파아미터의 값 타이은 String[] 타입
- header

  --%>
</body>
</html>