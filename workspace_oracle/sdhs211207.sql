--- 13����

-- version1 : board ���̺�  
-- board ���̺��� ��� ���̺�� �Բ� ����ϵ��� ��ȹ -> �������� ����.
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
 -- ������ �����ϴ� board ���̺��, ���ۿ� ���� ����� �����ϴ� review ���̺� ���� ���� -> ����
 -- board ���̺�
 create table board (
 num number primary key,
 writer varchar2(50) not null,
 subject varchar2(150) not null,
 content varchar2(3000) not null,
 regdate date default sysdate,
 readcount number default 0
 ); 
 -- review ���̺� 
 create table review(
renum   number         primary key,
writer  varchar2(50)   not null,
content varchar2(3000) not null,
regdate date default   sysdate,
ref     number         not null
);

-- version 2.1 : �������Ἲ�� �߰�
-- review ���̺��� ref �ʵ尡 board ���̺��� num �ʵ带 �����ϵ��� ����
alter table review 
add constraint review_ref_fk foreign key(ref) references board(num)
commit;

desc review;

-- version 3 : �Խ��ǿ� �̹����� ���ε��Ͽ� �󼼺��⿡�� ��Ÿ������ ���� 
-- �̹����� ���� Ŀ�´�Ƽ�� ������ �� �ִ� �Խ������� ����
-- ���� ���ε� ���̺귯���� �ʿ� -< cos.jar ���� (www.servlets,con���� �ٿ�)
-- 1. board ���̺� �̹����� ������ �� �ִ� �ʵ带 �߰�
-- 2. �ڹٺ� �̹��� ���� ������ �߰�
-- 3. �ڹ�DB�󿡼� ��� �޼ҵ忡�� �̹����� ó���� �� �ַη� ����
-- 4. �Խ��� ��������� ������ ���ε带 �� �� �ֵ��� ����
-- 5. �Խ��� ���ó������ ���� ���ε� ����� ����
-- 6. �̹����� �ʿ��� ��� jsp �������� ����

-- ��ü���� �۾� ��p ����
-- 1. board ���̺� ���� -> board ���̺� �̹��� ������ �̸��� �����ϴ� �ʵ带 �߰�
-- �ʵ� �̸�: imagefile, vachar2(100)
alter table board
add imagfile varchar2(100) default 'default.png';

select * from board order by num desc;

select * from board where subject like '%asdf%';



insert into board (num ,writer, subject, content, imagefile) values (board_seq.nextval,'�̹���','�׽�Ʈ','sdf','dow')

ALTER TABLE board RENAME COLUMN imagfile TO imagefile;


