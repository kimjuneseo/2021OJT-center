-- 2021/12/16(목)

-- 조인(Join): 여러 테이블에 저장된 데이터를 한번에 조회해야 할 필요가 있을 떄 사용하는 방법

-- 문제) 사원번호가 7788인 사원의 이름과 소속 부서명을 출력하시오
-- 조인을 사용하지 않는 방법
select dno from employee where eno=7788; -- 사번이 7788인 사원은 20번 부서에서 근무
select dname from department where dno=20; -- 20번 부서의 부서명은 RESEARCH

-- 조인을 사용하여 문제를 해결 : 하나의 sql문으로 문제를 해결
-- 조인 조건은 where절에 적음, 접근방법: 테이블명.필드명
-- 1번 : 방법
select employee.eno, employee.ename, department.dname
from employee, department
where employee.dno = department.dno -- 조인 조건
and employee.eno = 7788;

-- 2번 : 필드가 해당 테이블에만 존재한다면, 테이블명은 생략하고 필드명만 사용 가능.
select eno, ename, dname
from employee, department
where employee.dno = department.dno -- 조인 조건
and eno = 7788;

-- 3번 : 테이블명을 알리야스로 지정하여 사용하는 방법, 많이 사용하는 방식
select e.eno, e.ename, d.dname
from  employee e, department d
where  e.dno = d.dno  -- 조인조건
and e.eno = 7788;

-- 조인방법 1번: equiv join(이퀴 조인)
-- where 절을 조인 조건으로 사용해야하는 제약이 발생
select eno, ename, dname
from  employee e, department d
where e.dno = d.dno -- 조인조건
and e.eno = 7788;

-- 조인 방법 2번 : natural join
-- where 절에 조인조건을 적지 않고 사용한느 방법
-- 조건 : 두 개의 테이블에 존재하는 컬럼에 대해서 알리아스를 사용하면 에러가 발생 -> 알리아스를 사용하지 않음
-- 제약 : 조인이 되는 두 개의 테이블의 컬럼명이 동일애야함. 조인이 되는 테이블에 컬럼명이 다르면 사용할 수 없다.
-- 모호 : 컬럼명이 같다는 전제하에 사용, 그렇디 때문에 조인에서는 컬럼명이 명시적으로 드러나지 않음.

-- 아래식은 에러가 발생
select e.eno, e.ename, d.dname, e.dno
from employee e natural join department d
where e.eno = 7788;

select eno, ename, dname, dno
from employee natural join department
where eno = 7788;

-- 조인 방법 3번 : join using
-- using 절을 사용하여 조인이 되는 컬럼을 명시적으로 나타냄
-- 알리아스를 사용하면 에러가 발생, 조인이 되는 컬럼명이 동일해야함
select eno, ename, dname, dno
from employee inner join department 
using(dno)
where eno = 7788;

-- 조인 방법 4번 : 
-- 조인 컬럼명이 다를 때도 사용할 수 있고, where절을 사용하지 않고 조인조건을 명시하고자함.
-- 제약 : 조인이 되는 컬럼은 알리아스를 사용하여 구분해야함.
select eno, ename, dname, e.dno
from employee  e inner join department d
on e.dno = d.dno -- 조인조건
where eno = 7788;

-- < 이퀴 조인 확인 문제 > 
-- 문제1. 'SCOTT'사원의 부서번호와 부서이름을 출력하시오.
-- 1번
select  ename, dname
from employee, department
where employee.dno = department.dno -- 조인 조건
and ename ='SCOTT';
-- 2번
select ename, dname
from employee natural join department
where ename ='SCOTT';
--3번
select ename, dname
from employee inner join department 
using(dno)
where ename ='SCOTT';
--4번
select ename, dname, e.dno
from employee  e inner join department d
on e.dno = d.dno -- 조인조건
where ename ='SCOTT';

-- 문제2. 10번 부서에 속하는 사원의 담당업무와 부서의 지역명을 출력하시오.
-- 1번
select job, loc
from employee e,department d
where e.dno = d.dno
and d.dno =10; 

-- 2번
select job, loc
from employee natural join department 
where dno =10; 

--3번
select job, loc
from employee inner join department 
using(dno)
where dno =10;

--4번
select job, loc
from employee e inner join department d
on e.dno = d.dno -- 조인조건
where d.dno=10;

-- 문제3. 커미션을 받을 수 있는 사원의 이름, 부서이름, 지역명을 출력하시오

-- 1번
select ename, dname , loc
from employee e,department d
where e.dno = d.dno
and commission is not null;

-- 2번
select ename, dname , loc
from employee natural join department 
where commission is not null; 

--3번
select ename, dname , loc
from employee inner join department 
using(dno)
where commission is not null;

--4번
select ename, dname , loc
from employee e inner join department d
on e.dno = d.dno -- 조인조건
where commission is not null;


-- 문제4. 이름에 'A'가 포함된 모든 사원의 이름과 부서명을 출력하시오.
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

-- 문제5. 'NEW YORK'에서 근무하는 모든 사원의 이름과 부서명을 출력하시오.
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




-- < 2번 : 넌이퀴 조인 >
-- 조인 조건이 equal이 아닌 조인,
-- 조인 조건이 특정 범위 내에 있는지를 조사하는 조인
-- where절에 <,<=,>,>=,beteen and 연산자가 사용되는 경우
-- 문제) 등급 테이블 급여 등급을 기준의 사원의 급여을 출력하시오.
select eno, ename, salary, grade
from employee d, salgrade s
where salary between losal and hisal;


-- < 3번 : 셀프(self) 조인 >
-- 자신의 테이블과의 조인
-- 하나의 테이블있는 컬럼끼리 연결해서 사용하는 조인
-- 조인 대산이 자신의 테이블이라는 점 제외하면 이퀴 조인과 동일
-- 문제) 사원이름과 사원의 직속상관의 이름을 출력하시오.
-- e: 사원, m: 직속상관
-- 조인이되는 컴럼명이 서로 다를 경우에는 natural join, join using 두 개를 사용 불가
-- 사용가능한 조인은 equi join과 join on만 사용가능
select e.ename, m.ename
from employee e, employee m
where e.manager = m.eno; -- 조인 조건


select e.ename, m.ename
from employee e join employee m
on  e.manager = m.eno;


-- < 셀프 조인 획인 문제 >
-- 사용할 수 있는 여러가지 조인 방법을 모두 사용해 보시오.
-- 문제1) 'SCOTT'과 같은 부서에서 근무하는 사원의 이름, 부서번호를 출력하시오.
select dno from employee where ename = 'SCOTT'; -- 20번 부서
select ename, dno from employee where dno = 20;

select m.ename, m.dno
from employee e, employee m
where e.dno = m.dno -- 조인 조건
and e.ename = 'SCOTT'
and m.ename <> 'SCOTT';

select m.ename, m.dno
from employee e join employee m
on e.dno = m.dno
where e.ename = 'SCOTT'
and m.ename <> 'SCOTT';

-- 문제2) 'WARD' 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하시오.
select other.ename, other.hiredate
from employee ward, employee other
where ward.hiredate < other.hiredate 
and ward.ename='WARD'
order by hiredate;


-- 문제3) 관리자보다 먼저 입사한 사원의 이름과, 입사일, 관리자의 이름과 입사일을 출력하시오
select e.ename, e.hiredate, m.ename, m.hiredate
from employee e,employee m
where e.manager = m.eno -- 조인조건
and e.hiredate < m.hiredate;

-- < 4번 : outer join >
-- 조인 조건에서 기술한 컬럼에 두 테이블 중에서 어느 하나 테이블에서라도 null값이 존재한다면
-- 그 결과는 거짓이 되어 출력되지 않음.
-- 이 문제를 해결하기 위해서, null값인 데이터를 출력하기 위해서 outer join이 필요함.
-- nulldl 출력되는 컬럼에 + 기호를 붙여서 사용함.
-- 예제) 셀프조인, 사원번호, 사원명, 관리자번호, 관리자명을 출력하시오.
-- 사원이 있는 employee 테이블, 관리자가 있는 employee 테이블


-- 아래의 결과는 manager값이 null인 KING은 출력되지 않음.
select e.eno 사원번호, e.ename 사원명, m.eno 관리자번호, m.ename 관리자명
from employee e, employee m
where e.manager = m.eno;  -- 조인조건

select e.eno 사원번호, e.ename 사원명, m.eno 관리자번호, m.ename 관리자명
from employee e, employee m
where e.manager = m.eno(+); -- 조인 조건에서 null을 가지는 컬럼에 + 기호를 붙임.


-- outer join 키워드를 사용: full, left, rigth
select e.eno 사원번호, e.ename 사원명, m.eno 관리자번호, m.ename 관리자명
from employee e left outer join employee m
on e.manager = m.eno;



select * from department;
select * from employee;
select * from salgrade;