create table test01(
id   number       primary key,
name varchar2(30) not null
);

select * from test01;

create sequence test01_seq start with 1 increment by 1;


-- PL/SQL 사용
-- declare
--    i number;
-- begin 
--    for i in 1..200 loop
--        insert into test01(id, name) values (test01_seq.nextval, '홍길동');
--        commit;
--    end loop;
-- end;

select * from test01;
select * from member;
select * from board;


-- 각 작성자(writer) 별로 20걸씩 게시판에 데이처를 대량으로 넣어 놓는 방법 PL/SQL문
--declare
--    i number;
--begin
--    for i in 1..20 loop
--        INSERT into board(num, writer, subject, content, regdate) values(board_seq.nextval, 'lachica', concat('lachica 제목',i), concat('lachica 내용', i), '2021-11-11');
--        commit;
--    end loop;
--end;
                
 
-- 오라클레서 원하는 갯수만큼의 데이터를 가져오는 방법
select * from
    (select rownum rnum, num, writer, subject, content, regdate, readcount from 
        (select * from board order by num desc))
            where rnum >=8 and rnum <= 17;

-- 최근 데이터부터(맨 나중에 추가한 데이터 부터  10건을 가져오는 방법                                                           
select * from
    (select rownum rnum, num, writer, subject, content, regdate, readcount from 
        (select * from board order by num desc))
            where rnum >=1 and rnum <= 10;
-----------------------

select * from board order by num desc; -- numd이 220qhs
-- 게시판의 마직막 글에 대량의 댓글을 추가 : PL/SQL문을 사용

declare
    i number;
begin
    for i in 1..10 loop
    insert into review(renum, writer, content, regdate, ref)
    values(review_seq.nextval, 'want', concat('want 멋있어', i),'2021-12-05', 220);
    commit;
    end loop;
end;

select count(*) from review where ref=220;

-- 글 상세보디의 댓글 리스트에 대한 페이징 처리
select * from
    (select rownum rnum, renum, writer, content, regdate, ref from 
        (select * from review where ref=220 order by renum desc))
            where rnum >=1 and rnum <= 5 ;
-- 참조 무결성
-- 참조되는 컬럼은 항상 존재해야 함(review테이블의 ref는 반드시 board 테이블의 num을 참조해야함)
-- 1. 부모 테이블 : 다른 테이블에 의해서 참조가 되는 테이블(ex. board 테이블),
-- 부모 테이블의 참조가 되는 필드는 반드시 primary key 또는 unique로 설정되어 있어야함.
-- 2. 자식 테이블 : 다른 테이블을 참조하는 테이블 (ex. review 테이블)
-- 자식 테이블의 참조하는 커럼은 foreing key(외래키, 보조키)를 성정함.

-- 원글 : 현재 num의 가장  큰 값은 220번이고, 1000번은 없음
-- 당연히 원글 1000에 대한 댓글은 있을 수 없음.

select max(num) from board;

insert into review(renum, writer, content, ref) values( review_seq.nextval, 'ygx', '참조무셜성 연습', 1000);
commit;
select * from review order by renum desc;

-- 오라클에서 제약조건(constraints)을 확인하는 방법
select * from user_constraints;

select owner, constraint_name, constraint_type, table_name, status from user_constraints
where table_name in('BOARD', 'REVIEW');

-- review 테이블의 ref 필드를 board 테이블의 PK인 num을 참조하도록 참조 무결성을 설정하려고 함.
-- 참조 무결성을 추가함.
    
--    에러 발생
--    ORA-02298: cannot validate (SDHS2111.REVIEW_REF_FK) - parent keys not found
--    02298. 00000 - "cannot validate (%s.%s) - parent keys not found"
--    *Cause:    an alter table validating constraint failed because the table has
--               child records.
--    *Action:   Obvious

-- 에러 확인
select num from board where num in(3, 4, 0, 1, 201, 37, 6,2, 220, 1000);
select ref from review;
-- 해결책 : review 테이블에 ref값이 3, 4, , 62, 1000인 데이터를 삭제
delete from review where ref = 0; 
commit;
4,  62, , 1000;
alter table review 
add constraint review_ref_fk foreign key(ref) references board(num);

-- 제약 조건 확인
select table_name, constraint_name, constraint_type, status from user_constraints
where table_name in ('BOARD', 'REVIEW');
