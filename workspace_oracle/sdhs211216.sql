-- 2021/12/16(��)

-- ����(Join): ���� ���̺� ����� �����͸� �ѹ��� ��ȸ�ؾ� �� �ʿ䰡 ���� �� ����ϴ� ���

-- ����) �����ȣ�� 7788�� ����� �̸��� �Ҽ� �μ����� ����Ͻÿ�
-- ������ ������� �ʴ� ���
select dno from employee where eno=7788; -- ����� 7788�� ����� 20�� �μ����� �ٹ�
select dname from department where dno=20; -- 20�� �μ��� �μ����� RESEARCH

-- ������ ����Ͽ� ������ �ذ� : �ϳ��� sql������ ������ �ذ�
-- ���� ������ where���� ����, ���ٹ��: ���̺��.�ʵ��
-- 1�� : ���
select employee.eno, employee.ename, department.dname
from employee, department
where employee.dno = department.dno -- ���� ����
and employee.eno = 7788;

-- 2�� : �ʵ尡 �ش� ���̺��� �����Ѵٸ�, ���̺���� �����ϰ� �ʵ�� ��� ����.
select eno, ename, dname
from employee, department
where employee.dno = department.dno -- ���� ����
and eno = 7788;

-- 3�� : ���̺���� �˸��߽��� �����Ͽ� ����ϴ� ���, ���� ����ϴ� ���
select e.eno, e.ename, d.dname
from  employee e, department d
where  e.dno = d.dno  -- ��������
and e.eno = 7788;

-- ���ι�� 1��: equiv join(���� ����)
-- where ���� ���� �������� ����ؾ��ϴ� ������ �߻�
select eno, ename, dname
from  employee e, department d
where e.dno = d.dno -- ��������
and e.eno = 7788;

-- ���� ��� 2�� : natural join
-- where ���� ���������� ���� �ʰ� ����Ѵ� ���
-- ���� : �� ���� ���̺� �����ϴ� �÷��� ���ؼ� �˸��ƽ��� ����ϸ� ������ �߻� -> �˸��ƽ��� ������� ����
-- ���� : ������ �Ǵ� �� ���� ���̺��� �÷����� ���Ͼ־���. ������ �Ǵ� ���̺� �÷����� �ٸ��� ����� �� ����.
-- ��ȣ : �÷����� ���ٴ� �����Ͽ� ���, �׷��� ������ ���ο����� �÷����� ��������� �巯���� ����.

-- �Ʒ����� ������ �߻�
select e.eno, e.ename, d.dname, e.dno
from employee e natural join department d
where e.eno = 7788;

select eno, ename, dname, dno
from employee natural join department
where eno = 7788;

-- ���� ��� 3�� : join using
-- using ���� ����Ͽ� ������ �Ǵ� �÷��� ��������� ��Ÿ��
-- �˸��ƽ��� ����ϸ� ������ �߻�, ������ �Ǵ� �÷����� �����ؾ���
select eno, ename, dname, dno
from employee inner join department 
using(dno)
where eno = 7788;

-- ���� ��� 4�� : 
-- ���� �÷����� �ٸ� ���� ����� �� �ְ�, where���� ������� �ʰ� ���������� ����ϰ�����.
-- ���� : ������ �Ǵ� �÷��� �˸��ƽ��� ����Ͽ� �����ؾ���.
select eno, ename, dname, e.dno
from employee  e inner join department d
on e.dno = d.dno -- ��������
where eno = 7788;

-- < ���� ���� Ȯ�� ���� > 
-- ����1. 'SCOTT'����� �μ���ȣ�� �μ��̸��� ����Ͻÿ�.
-- 1��
select  ename, dname
from employee, department
where employee.dno = department.dno -- ���� ����
and ename ='SCOTT';
-- 2��
select ename, dname
from employee natural join department
where ename ='SCOTT';
--3��
select ename, dname
from employee inner join department 
using(dno)
where ename ='SCOTT';
--4��
select ename, dname, e.dno
from employee  e inner join department d
on e.dno = d.dno -- ��������
where ename ='SCOTT';

-- ����2. 10�� �μ��� ���ϴ� ����� �������� �μ��� �������� ����Ͻÿ�.
-- 1��
select job, loc
from employee e,department d
where e.dno = d.dno
and d.dno =10; 

-- 2��
select job, loc
from employee natural join department 
where dno =10; 

--3��
select job, loc
from employee inner join department 
using(dno)
where dno =10;

--4��
select job, loc
from employee e inner join department d
on e.dno = d.dno -- ��������
where d.dno=10;

-- ����3. Ŀ�̼��� ���� �� �ִ� ����� �̸�, �μ��̸�, �������� ����Ͻÿ�

-- 1��
select ename, dname , loc
from employee e,department d
where e.dno = d.dno
and commission is not null;

-- 2��
select ename, dname , loc
from employee natural join department 
where commission is not null; 

--3��
select ename, dname , loc
from employee inner join department 
using(dno)
where commission is not null;

--4��
select ename, dname , loc
from employee e inner join department d
on e.dno = d.dno -- ��������
where commission is not null;


-- ����4. �̸��� 'A'�� ���Ե� ��� ����� �̸��� �μ����� ����Ͻÿ�.
select ename, dname
from employee e, department d
where e.dno = d.dno
and ename like'%A%';

select ename, dname
from employee NATURAL JOIN department
where ename like'%A%';

select ename, dname
from employee inner join department
using(dno)
where ename like'%A%';

select ename, dname
from employee e inner join department d
on e.dno = d.dno
where ename like'%A%';

-- ����5. 'NEW YORK'���� �ٹ��ϴ� ��� ����� �̸��� �μ����� ����Ͻÿ�.
select ename, dname
from employee e, department d
where e.dno = d.dno
and loc = 'NEW YORK';

select ename, dname
from employee NATURAL join department
where loc='NEW YORK';

select ename, dname
from employee inner join department
using(dno)
where loc='NEW YORK';

select ename, dname
from employee e inner join department d
on e.dno = d.dno
where loc='NEW YORK';




-- < 2�� : ������ ���� >
-- ���� ������ equal�� �ƴ� ����,
-- ���� ������ Ư�� ���� ���� �ִ����� �����ϴ� ����
-- where���� <,<=,>,>=,beteen and �����ڰ� ���Ǵ� ���
-- ����) ��� ���̺� �޿� ����� ������ ����� �޿��� ����Ͻÿ�.
select eno, ename, salary, grade
from employee d, salgrade s
where salary between losal and hisal;


-- < 3�� : ����(self) ���� >
-- �ڽ��� ���̺���� ����
-- �ϳ��� ���̺��ִ� �÷����� �����ؼ� ����ϴ� ����
-- ���� ����� �ڽ��� ���̺��̶�� �� �����ϸ� ���� ���ΰ� ����
-- ����) ����̸��� ����� ���ӻ���� �̸��� ����Ͻÿ�.
-- e: ���, m: ���ӻ��
-- �����̵Ǵ� �ķ����� ���� �ٸ� ��쿡�� natural join, join using �� ���� ��� �Ұ�
-- ��밡���� ������ equi join�� join on�� ��밡��
select e.ename, m.ename
from employee e, employee m
where e.manager = m.eno; -- ���� ����


select e.ename, m.ename
from employee e join employee m
on  e.manager = m.eno;


-- < ���� ���� ȹ�� ���� >
-- ����� �� �ִ� �������� ���� ����� ��� ����� ���ÿ�.
-- ����1) 'SCOTT'�� ���� �μ����� �ٹ��ϴ� ����� �̸�, �μ���ȣ�� ����Ͻÿ�.
select dno from employee where ename = 'SCOTT'; -- 20�� �μ�
select ename, dno from employee where dno = 20;

select m.ename, m.dno
from employee e, employee m
where e.dno = m.dno -- ���� ����
and e.ename = 'SCOTT'
and m.ename <> 'SCOTT';

select m.ename, m.dno
from employee e join employee m
on e.dno = m.dno
where e.ename = 'SCOTT'
and m.ename <> 'SCOTT';

-- ����2) 'WARD' ������� �ʰ� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�.
select other.ename, other.hiredate
from employee ward, employee other
where ward.hiredate < other.hiredate 
and ward.ename='WARD'
order by hiredate;


-- ����3) �����ں��� ���� �Ի��� ����� �̸���, �Ի���, �������� �̸��� �Ի����� ����Ͻÿ�
select e.ename, e.hiredate, m.ename, m.hiredate
from employee e,employee m
where e.manager = m.eno -- ��������
and e.hiredate < m.hiredate;

-- < 4�� : outer join >
-- ���� ���ǿ��� ����� �÷��� �� ���̺� �߿��� ��� �ϳ� ���̺����� null���� �����Ѵٸ�
-- �� ����� ������ �Ǿ� ��µ��� ����.
-- �� ������ �ذ��ϱ� ���ؼ�, null���� �����͸� ����ϱ� ���ؼ� outer join�� �ʿ���.
-- nulldl ��µǴ� �÷��� + ��ȣ�� �ٿ��� �����.
-- ����) ��������, �����ȣ, �����, �����ڹ�ȣ, �����ڸ��� ����Ͻÿ�.
-- ����� �ִ� employee ���̺�, �����ڰ� �ִ� employee ���̺�


-- �Ʒ��� ����� manager���� null�� KING�� ��µ��� ����.
select e.eno �����ȣ, e.ename �����, m.eno �����ڹ�ȣ, m.ename �����ڸ�
from employee e, employee m
where e.manager = m.eno;  -- ��������

select e.eno �����ȣ, e.ename �����, m.eno �����ڹ�ȣ, m.ename �����ڸ�
from employee e, employee m
where e.manager = m.eno(+); -- ���� ���ǿ��� null�� ������ �÷��� + ��ȣ�� ����.


-- outer join Ű���带 ���: full, left, rigth
select e.eno �����ȣ, e.ename �����, m.eno �����ڹ�ȣ, m.ename �����ڸ�
from employee e left outer join employee m
on e.manager = m.eno;



select * from department;
select * from employee;
select * from salgrade;