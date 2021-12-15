--- 13일차

-- version1 : board 테이블  
-- board 테이블을 댓글 테이블과 함께 사용하도록 계획 -> 실행하지 않음.
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
 
 -- version2
 -- 원글을 저장하는 board 테이블과, 원글에 대한 댓글을 저장하는 review 테이블 따로 설계 -> 실행
 -- board 테이블
 create table board (
 num number primary key,
 writer varchar2(50) not null,
 subject varchar2(150) not null,
 content varchar2(3000) not null,
 regdate date default sysdate,
 readcount number default 0
 ); 
 -- review 테이블 
 create table review(
renum   number         primary key,
writer  varchar2(50)   not null,
content varchar2(3000) not null,
regdate date default   sysdate,
ref     number         not null
);

-- version 2.1 : 참조무결성을 추가
-- review 테이블의 ref 필드가 board 테이블의 num 필드를 참조하도록 설정
alter table review 
add constraint review_ref_fk foreign key(ref) references board(num)
commit;

desc review;

-- version 3 : 게시판에 이미지를 업로드하여 상세보기에서 나타나도록 설정 
-- 이미지를 통한 커뮤니티를 형성할 수 있는 게시판으로 변경
-- 파일 업로드 라이브러리가 필요 -< cos.jar 파일 (www.servlets,con에서 다운)
-- 1. board 테이블에 이미지를 저장할 수 있는 필드를 추가
-- 2. 자바빈에 이미지 저장 변수를 추가
-- 3. 자바DB빈에서 모든 메소드에서 이미지를 처리할 수 있로록 수정
-- 4. 게시판 등록폼에서 파일을 업로드를 할 수 있도록 수정
-- 5. 게시판 등록처리에서 파일 업로드 기능을 구현
-- 6. 이미지가 필요한 모든 jsp 페이지를 수정

-- 구체적인 작업 계뢱 실행
-- 1. board 테이블 수정 -> board 테이블에 이미지 파일의 이름을 저장하는 필드를 추가
-- 필드 이름: imagefile, vachar2(100)
alter table board
add imagfile varchar2(100) default 'default.png';

select * from board order by num desc;

select * from board where subject like '%asdf%';



insert into board (num ,writer, subject, content, imagefile) values (board_seq.nextval,'이미지','테스트','sdf','dow')

ALTER TABLE board RENAME COLUMN imagfile TO imagefile;


