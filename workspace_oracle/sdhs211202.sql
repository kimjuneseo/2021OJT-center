--211202 -> 게시판 테이블 수정
SELECT * from board;
-- 이전 테이블 : board 테이블 하나로 게시글과 댓글을 처리하도록 구성
create table board (
num number primary key,
writer varchar2(50) not null,
subject varchar2(150) not null,
content varchar2(3000) not null,
regdate date default sysdate,
readcount number default 0,
);

-- 글번호에 대한 시퀀그를 생성 : 자동으로 증가하는 글번호 생겅을 위해서
create sequence board_sql start with 1 increment by 1;

-- 수정 계획: 게시글 테이블과 댓글 테이블 분리하여 구성
-- 게시글 테이블: board - num, subject, content, regdate, readcount 필드 6개로 구성
-- 이전 테이블에서 ref, re_set, re_level 필드를 삭제

desc board;

-- 테이블 구조 변경: ref, re_stop, re_level 필드 삭제
alter table board drop column ref;
alter table board drop column re_step;
alter table board drop column re_level;

-- review 테이블 생성: 댓글 테이블 생성
-- 필드 구성: 글번호(PK), 작성자, 내용, 등록 일자, 원글번호
-- num(number), writer(varchar2), content(varchar2), regdate(date), ref(number)
-- num: PK, requenece사용
-- regdateL default값 설정, 현재 날짜
-- ref: 해당 댓글이 다리리는 원글의 번호

create table review(
renum   number         primary key,
writer  varchar2(50)   not null,
content varchar2(3000) not null,
regdate date default   sysdate,
ref     number         not null
);

-- review 테이블에 사용할 requence 생성
create sequence review_seq start with 1 increment by 1;

select * from user_sequences;
select * from review where ref=3;
-- 댓글 추가
insert into review(renum, writer, content, ref) VALUES(REVIEW_SEQ.nextval, 'lachka', '할수읎는기라', 6);
insert into review(renum, writer, content, ref) VALUES(REVIEW_SEQ.nextval, '이동훈', '할수읎는기라', 6);
insert into review(renum, writer, content, ref) VALUES(REVIEW_SEQ.nextval, '아저씨', '할수읎는기라', 6);
commit;
select * from review;