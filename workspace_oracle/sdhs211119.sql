-- 20211119(��)
-- ����Ŭ ���� ���� �� Ȯ��

-- < oracle ��� >
select * from all_users; -- ��� ����Ȯ��

-- ������: sdhs2111, ���: 1234

create user sdhs2111 identified by 1234; -- ���� ����
grant connect, resource, dba to sdhs2111; -- ���� �ο�
show user; -- ���� Ȯ��

-- < role ���� - ������ ���� >
-- connect : ���� ����(create cluste, create database link, create sequence, create session, 
-- create synonym, create table, create view, alter session)
-- resource : ���� ����(create cluster, create procedure, create sequence, create table, create trigger)
-- dba : ������ ����(with admin option�� ��� ����)
show user; -- ���� Ȯ��

-- ȸ�� ���̺� ����
-- ȸ�� ���̺��� �ʿ��� �ʵ�
-- ���̵�, ��й�ȣ, �̸�, ��ȭ��ȣ, �ּ�1(���θ��ּ�), �ּ�2(���ּ�), �̸���, �������� -> 8���� �ʵ�� ����
-- ���̺��: member
-- �ʵ��: id(varchar2), pwd(varchar2), name(varchar2), tel(varchar2), 
-- address1(varchar2), address2(varchar2), email(varchar2), regdate(date)
-- �ʵ��� Ÿ�� : ������(varchar2), ������(number), ��¥��(date) 

-- SQL(Structured Query Language, ����ȭ�� ���� ���)
-- DCL(Data Control Language, ������ �����): �����ڰ� ����ϴ� ���, ex) create user, grant, revoke, commit, rollback, savepoint ...
-- DDL(Data Definition Language, ������ ������): ���̺� �Ǵ� ���� ���� ����� ���õ� ���, ex) create, alter, drop ...
-- DML(Data Manupulation Language, ������ ���۾�): �������� ����, ����, ����, �˻��� ���õ� ���, ex) insert, update, delete, select ...

-- < ȸ�� ���̺��� ���� ���� >
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

desc member; -- ���̺��� ���� Ȯ��
select * from member; -- ���̺��� ������ Ȯ��

-- ȸ�� ���̺� ������ ����
insert into member(id, pwd, name, tel, address1, address2, email)
values('ygx', '1234', '������', '010-1111-1111', '����Ư���� ���Ǳ� ������ 122��', '311����', 'llj@naver.com');

insert into member(id, pwd, name, tel, address1, address2, email)
values('lachica', '1234', '�Ű���', '010-2222-2222', '��⵵ ������ �Ǽ��� �Ǽ���', '587����', 'sgb@naver.com');

insert into member(id, pwd, name, tel, address1, address2, email)
values('want', '1234', '��ȿ��', '010-3333-3333', '�λ걤���� ������ ������', '159����', 'chj@naver.com');

insert into member(id, pwd, name, tel, address1, address2, email)
values('wayb', '1234', '������', '010-4444-4444', '���������� ���� ��ڷ� 333��', '111����', 'njh@naver.com');

insert into member(id, pwd, name, tel, address1, address2, email)
values('cnb', '1234', '������', '010-5555-5555', '�뱸������ ������ ������ 65��', '897����', 'lhi@naver.com');

insert into member(id, pwd, name, tel, address1, address2, email)
values('prowdmon', '1234', '������', '010-6666-6666', '��⵵ ������ ������', '��������Ʈ 305ȣ 507ȣ', 'sjw@naver.com');

insert into member(id, pwd, name, tel, address1, address2, email)
values('holybang', '1234', '���ϴ�', '010-7777-7777', '��û�ϵ� û�ֽ� ���� ��õ�� 12��', '17����', 'jhn@naver.com');

insert into member(id, pwd, name, tel, address1, address2, email)
values('hook', '1234', '������', '010-8888-8888', '��û���� ������ ������ ������ 52��', '911����', 'khi@naver.com');
commit;

-- ȸ�� ���̺��� ������ ����
-- ���̵� 'hook'�� ȸ���� �̸��� '����Ű'�� �����Ͻÿ�.
update member
set name = '����Ű'
where id = 'hook';
commit;


-- ȸ�� ���̺� ������ ����
-- ȸ�� ���̺��� �ּҰ� �λ��� ȸ���� �����͸� �����Ͻÿ�.
delete from member
where address1 like '�λ�%';
commit;

-- ���ϵ�ī�� : %(���), _(�ѱ���)
-- '%�λ�%' : �λ��� �����ϴ�
-- '�λ�%' : �λ����� �����ϴ�
-- '%�λ�' : �λ����� ������
-- '�λ�_' : �λ����� �����ϰ� 3������
-- '__�λ�_' : 5�����̰�, 3��°, 4��°�� �λ���

select * from member;
select pwd from member where id='ppp777' and tel='01109975' and tel=?
DELETE FROM member WHERE id = '��Ű';
select id from member where name= '�Ű���' and tel='010-2222-2222';
update member
set name = '��Ű'
where id = 'hook' and pwd = '1234';