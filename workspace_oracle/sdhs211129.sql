-- < board ���̺� ���� ���� >
-- �Խ��ǿ� �ʿ��� �ʵ�
-- �Խñ۹�ȣ, �ۼ��� (ȸ�����̺��� ���̵�), ����, ����, �۵������, ��ȸ��, ��� ó��
-- ���ó��: ref(����� ����), re_step(����� ����), re_level(����� ����)
-- num, writer, subject, content, regdate, readcount, ref, re_step, re_level
-- num: �Խñ��� �߰��� ������ �ڵ����� 1�� �����ϵ��� ����, sequence ����Ͽ� ����

-- < board ���̺� ���� >
-- number: ����, �Ǽ�, ex) number(5): ���� 5�ڸ�, number(7, 2): ��ü 7�ڸ�, �Ҽ��� ���� 2�ڸ��� �Ǽ�
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

-- �� ��ȣ�� ���� �������� ���� : �ڵ����� �����ϴ� �� ��ȣ ������ ���ؼ�
create sequence board_seq start with 1 increment by 1;

-- ���̺� Ȯ��
-- ������ ���� (data dictionary): �����Ϳ� ���� ��Ÿ ������ ������ ���̺�
select table_name from user_tables;
select * from user_tables;

-- ������ Ȯ��
-- user_sequences: ����� �������� ������ ������ ��Ÿ ���̺�
select sequence_name from user_sequences;
select * from user_sequences;

-- board ���̺� ���� CRUD �۾� Ȯ��
-- 1. ������ �߰�
insert into board(num, writer, subject, content, ref, re_step, re_level)
values (
board_seq.nextval,
'wayb',
'�Խ��� �׽�Ʈ �� 1',
'�Խ����� �׽�Ʈ�ϰ� �ֽ��ϴ�.',
0,0,0);

insert into board(num, writer, subject, content, ref, re_step, re_level)
values (
board_seq.nextval,
'way',
'�Խ��� �׽�Ʈ �� 1',
'�Խ����� �׽�Ʈ�ϰ� �ֽ��ϴ�.',
0,0,0);

insert into board(num, writer, subject, content, ref, re_step, re_level)
values (
board_seq.nextval,
'wa',
'�Խ��� �׽�Ʈ �� 1',
'�Խ����� �׽�Ʈ�ϰ� �ֽ��ϴ�.',
0,0,0);

insert into board(num, writer, subject, content, ref, re_step, re_level)
values (
board_seq.nextval,
'watst',
'�Խ��� �׽�Ʈ �� 1',
'�Խ����� �׽�Ʈ�ϰ� �ֽ��ϴ�.',
0,0,0);
commit;

insert into board(num ,writer, subject, content ) values (board_seq.nextval, 'sdfsd','sdfds','sdfds');

select * from board;

update board set subject='���̺� ���� ����' where writer='wayb';
