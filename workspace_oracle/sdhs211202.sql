--211202 -> �Խ��� ���̺� ����
SELECT * from board;
-- ���� ���̺� : board ���̺� �ϳ��� �Խñ۰� ����� ó���ϵ��� ����
create table board (
num number primary key,
writer varchar2(50) not null,
subject varchar2(150) not null,
content varchar2(3000) not null,
regdate date default sysdate,
readcount number default 0,
);

-- �۹�ȣ�� ���� �����׸� ���� : �ڵ����� �����ϴ� �۹�ȣ ������ ���ؼ�
create sequence board_sql start with 1 increment by 1;

-- ���� ��ȹ: �Խñ� ���̺�� ��� ���̺� �и��Ͽ� ����
-- �Խñ� ���̺�: board - num, subject, content, regdate, readcount �ʵ� 6���� ����
-- ���� ���̺��� ref, re_set, re_level �ʵ带 ����

desc board;

-- ���̺� ���� ����: ref, re_stop, re_level �ʵ� ����
alter table board drop column ref;
alter table board drop column re_step;
alter table board drop column re_level;

-- review ���̺� ����: ��� ���̺� ����
-- �ʵ� ����: �۹�ȣ(PK), �ۼ���, ����, ��� ����, ���۹�ȣ
-- num(number), writer(varchar2), content(varchar2), regdate(date), ref(number)
-- num: PK, requenece���
-- regdateL default�� ����, ���� ��¥
-- ref: �ش� ����� �ٸ����� ������ ��ȣ

create table review(
renum   number         primary key,
writer  varchar2(50)   not null,
content varchar2(3000) not null,
regdate date default   sysdate,
ref     number         not null
);

-- review ���̺� ����� requence ����
create sequence review_seq start with 1 increment by 1;

select * from user_sequences;
select * from review where ref=3;
-- ��� �߰�
insert into review(renum, writer, content, ref) VALUES(REVIEW_SEQ.nextval, 'lachka', '�Ҽ����±��', 6);
insert into review(renum, writer, content, ref) VALUES(REVIEW_SEQ.nextval, '�̵���', '�Ҽ����±��', 6);
insert into review(renum, writer, content, ref) VALUES(REVIEW_SEQ.nextval, '������', '�Ҽ����±��', 6);
commit;
select * from review;