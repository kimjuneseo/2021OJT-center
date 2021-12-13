-- 20211119(금)
-- 오라클 계정 생성 및 확인

-- < oracle 명령 >
select * from all_users; -- 모든 계정확인

-- 계정명: sdhs2111, 비번: 1234

create user sdhs2111 identified by 1234; -- 계정 생성
grant connect, resource, dba to sdhs2111; -- 권한 부여
show user; -- 계정 확인

-- < role 권한 - 권한의 묶음 >
-- connect : 연결 권한(create cluste, create database link, create sequence, create session, 
-- create synonym, create table, create view, alter session)
-- resource : 생성 권한(create cluster, create procedure, create sequence, create table, create trigger)
-- dba : 관리자 권한(with admin option의 모든 권한)
show user; -- 계정 확인

-- 회원 테이블 설계
-- 회원 테이블에서 필요한 필드
-- 아이디, 비밀번호, 이름, 전화번호, 주소1(도로명주소), 주소2(상세주소), 이메일, 가입일자 -> 8개의 필드로 구성
-- 테이블명: member
-- 필드명: id(varchar2), pwd(varchar2), name(varchar2), tel(varchar2), 
-- address1(varchar2), address2(varchar2), email(varchar2), regdate(date)
-- 필드의 타입 : 문자형(varchar2), 숫자형(number), 날짜형(date) 

-- SQL(Structured Query Language, 구조화된 질의 언어)
-- DCL(Data Control Language, 데이터 제어어): 관리자가 사용하는 언어, ex) create user, grant, revoke, commit, rollback, savepoint ...
-- DDL(Data Definition Language, 데이터 정의의): 테이블 또는 뷰의 구조 설계와 관련된 언어, ex) create, alter, drop ...
-- DML(Data Manupulation Language, 데이터 조작어): 데이터의 삽입, 수정, 삭제, 검색과 관련된 언어, ex) insert, update, delete, select ...

-- < 회원 테이블의 구조 설계 >
create table member (
id varchar2(50) primary key,
pwd varchar2(16) not null,
name varchar2(100) not null,
tel varchar2(13) not null,
address1 varchar2(150) not null,
address2 varchar2(150) not null,
email varchar2(50) not null,
regdate date default sysdate
);

desc member; -- 테이블의 구조 확인
select * from member; -- 테이블의 데이터 확인

-- 회원 테이블에 데이터 삽입
insert into member(id, pwd, name, tel, address1, address2, email)
values('ygx', '1234', '이이정', '010-1111-1111', '서울특별시 관악구 문성로 122길', '311번지', 'llj@naver.com');

insert into member(id, pwd, name, tel, address1, address2, email)
values('lachica', '1234', '신가비', '010-2222-2222', '경기도 수원시 권선구 권성동', '587번지', 'sgb@naver.com');

insert into member(id, pwd, name, tel, address1, address2, email)
values('want', '1234', '최효진', '010-3333-3333', '부산광역시 동래구 동래동', '159번지', 'chj@naver.com');

insert into member(id, pwd, name, tel, address1, address2, email)
values('wayb', '1234', '노지혜', '010-4444-4444', '대전광역시 서구 대박로 333길', '111번지', 'njh@naver.com');

insert into member(id, pwd, name, tel, address1, address2, email)
values('cnb', '1234', '이혜인', '010-5555-5555', '대구광역시 동성구 동성로 65길', '897번지', 'lhi@naver.com');

insert into member(id, pwd, name, tel, address1, address2, email)
values('prowdmon', '1234', '신정우', '010-6666-6666', '경기도 구리시 구리동', '구리아파트 305호 507호', 'sjw@naver.com');

insert into member(id, pwd, name, tel, address1, address2, email)
values('holybang', '1234', '정하늬', '010-7777-7777', '충청북도 청주시 서구 옥천리 12길', '17번지', 'jhn@naver.com');

insert into member(id, pwd, name, tel, address1, address2, email)
values('hook', '1234', '강혜인', '010-8888-8888', '충청남도 당진시 당진구 당진로 52길', '911번지', 'khi@naver.com');
commit;

-- 회원 테이블의 데이터 수정
-- 아이디 'hook'인 회원의 이름을 '아이키'로 수정하시오.
update member
set name = '아이키'
where id = 'hook';
commit;


-- 회원 테이블 데이터 삭제
-- 회원 테이블에서 주소가 부산인 회원의 데이터를 삭제하시오.
delete from member
where address1 like '부산%';
commit;

-- 와일드카드 : %(모든), _(한글자)
-- '%부산%' : 부산을 포함하는
-- '부산%' : 부산으로 시작하는
-- '%부산' : 부산으로 끝나는
-- '부산_' : 부산으로 시작하고 3글자인
-- '__부산_' : 5글자이고, 3번째, 4번째가 부산인

select * from member;
select pwd from member where id='ppp777' and tel='01109975' and tel=?
DELETE FROM member WHERE id = '이키';
select id from member where name= '신가비' and tel='010-2222-2222';
update member
set name = '이키'
where id = 'hook' and pwd = '1234';