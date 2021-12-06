-- < board 테이블 구조 설계 >
-- 게시판에 필요한 필드
-- 게시글번호, 작성자 (회원테이블의 아이디), 제목, 내용, 글등록일자, 조회수, 댓글 처리
-- 댓글처리: ref(댓글의 원글), re_step(댓글의 깊이), re_level(댓글의 순서)
-- num, writer, subject, content, regdate, readcount, ref, re_step, re_level
-- num: 게시글을 추가할 때마다 자동으로 1씩 증가하도록 설정, sequence 사용하여 설정

-- < board 테이블 생성 >
-- number: 정수, 실수, ex) number(5): 정수 5자리, number(7, 2): 전체 7자리, 소수점 이하 2자리인 실수
create table board (
num number primary key,
writer varchar2(50) not null,
subject varchar2(150) not null,
content varchar2(3000) not null,
regdate date default sysdate,
readcount number default 0,
ref number not null,
re_step number not null,
re_level number not null
);

select count(*) cnt from board;

desc board;
select * from board;
drop table board;

-- 글 번호에 대한 시퀀스를 생성 : 자동으로 증가하는 글 번호 생성을 위해서
create sequence board_seq start with 1 increment by 1;

-- 테이블 확인
-- 데이터 사전 (data dictionary): 데이터에 대한 메타 정보를 가지는 테이블
select table_name from user_tables;
select * from user_tables;

-- 시퀀스 확인
-- user_sequences: 사용자 시퀀스의 정보를 가지는 메타 테이블
select sequence_name from user_sequences;
select * from user_sequences;

-- board 테이블에 대한 CRUD 작업 확인
-- 1. 데이터 추가
insert into board(num, writer, subject, content, ref, re_step, re_level)
values (
board_seq.nextval,
'wayb',
'게시판 테스트 중 1',
'게시판을 테스트하고 있습니다.',
0,0,0);

insert into board(num, writer, subject, content, ref, re_step, re_level)
values (
board_seq.nextval,
'way',
'게시판 테스트 중 1',
'게시판을 테스트하고 있습니다.',
0,0,0);

insert into board(num, writer, subject, content, ref, re_step, re_level)
values (
board_seq.nextval,
'wa',
'게시판 테스트 중 1',
'게시판을 테스트하고 있습니다.',
0,0,0);

insert into board(num, writer, subject, content, ref, re_step, re_level)
values (
board_seq.nextval,
'watst',
'게시판 테스트 중 1',
'게시판을 테스트하고 있습니다.',
0,0,0);
commit;

insert into board(num ,writer, subject, content ) values (board_seq.nextval, 'sdfsd','sdfds','sdfds');

select * from board;

update board set subject='웨이비 리더 노제' where writer='wayb';
