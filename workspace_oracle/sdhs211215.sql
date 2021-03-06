-- 2021/12/15(수)

-- 테이블의 제약조건을 확인 
select table_name, constraint_name, constraint_type, status from user_constraints
where table_name in ('EMPLOYEE', 'DEPARTMENT');


-- sql에서는 null을 연산하면 결과는 null이 됨.
-- nvl() 함수 : null 값을 계산을 위해서 제공하는 함수 
-- nvl(컬럼명, 컬럼이 null이었을 때 가지는 값)
-- 문제) 각 사원의 사번, 사원명, 입사일, 급여, 커미션, 연봉을 연봉이 높은 순으로 확인하시오.
select eno, ename, salary, commission, salary*12+commission from employee 
order by  salary *12 + commission desc;
-- 문제 발생 : commission이  null인 값을 더해서 연봉이 null이 됨
-- 해결책: nvl() 함수를 사용하여 해결

select eno, ename, salary, nvl(commission, 0), salary*12+nvl(commission, 0) from employee 
order by  salary*12+nvl(commission, 0) desc;

-- 출력되는 컬럼의 이름을 수정 : alias(알리아스)를 사용

-- 알리아스 사용 1번
select eno as "사번", ename as "사원명", salary as "급여", nvl(commission, 0) as "커미션",
salary*12+nvl(commission, 0)as "연봉"
from employee 
order by  salary*12+nvl(commission, 0) desc;

-- 알리아스 사용2번
select eno "사번", ename "사원명", salary "급여", nvl(commission, 0) "커미션",
salary*12+nvl(commission, 0) "연봉"
from employee 
order by  salary*12+nvl(commission, 0) desc;

-- 알리앗 사용 3번 : 쌍따옴표도 생략가능, 조건(단, 특수기로나 공백이 있느 경우는 쌍따옴표를 사용해야함)
select eno 사번, ename 사원명, salary 급여, nvl(commission, 0) 커미션,
salary*12+nvl(commission, 0) 연봉
from employee 
order by  salary*12+nvl(commission, 0) desc;

-- 알이아스 사용 4번 : "직원 연봉" 쌍따옴표로 감싸야함
select eno 사번, ename 사원명, salary 급여, nvl(commission, 0) 커미션,
salary*12+nvl(commission, 0)"직원 연봉"
from employee 
order by  salary*12+nvl(commission, 0) desc;

-- 알리아스 사용5번 : order by에서 사용 가능
select eno 사번, ename 사원명, salary 급여, nvl(commission, 0) 커미션,
salary*12+nvl(commission, 0) 연봉
from employee 
order by  연봉 desc;

-- 정렬할 때는 열번호를 사용할 수 있음                                                                                                                                                            
select eno 사번, ename 사원명, salary 급여, nvl(commission, 0) 커미션,
salary*12+nvl(commission, 0) 연봉
from employee 
order by  5 desc;

-- nvl2(null 값을 가지는 컬럼명, null이 아닐때의 값, null일때 사용할 값)
-- null값을 유효한 값으로 대체하느 함수 : nvl(), nvl2()
select eno 사번, ename 사원명, salary 급여, nvl2(commission, commission,  0) 커미션,
salary*12+nvl2(commission,commission, 0) 연봉
from employee 
order by  연봉 desc;               

-- nullif(식1, 식2) : 식1과 식2가 같으면 null값을 반환하고, 다르면 식1값을 반환하는 함수
-- 문제) 사원 테이블에서 job의 값이 clerk이면 사원을 출력하고, 그렇지 않으면 job을 출력하시오
select nullif(job ,'CLERK')from employee;

select nvl(nullif(job ,'CLERK'), '사원')from employee;

select nvl2(nullif(job ,'CLERK'),nullif(job ,'CLERK'), '사원')from employee;

-- < 연산자 확인 학습 >
-- 문제1) 10번 부서에 소속된 사원을 제외한 모든 정보를 출력하시오.
select * from employee where dno != 10;

-- 문제2) 급여가 1000에서 1500 사이인 사원의 정보를 출력하시오.
select * from employee where salary >= 1000 and salary <= 1500;

-- 문제3) 급여가 1000미만이거나 1500초과인 사원의 정보를 출력하시오.
select * from employee where salary < 1000 or salary > 1500;

-- 문제4) 커미션이 300이거나 500이거나 1400인 사워느이 정보를 출력하시오.
select * from employee where commission in(300, 400, 1400);

-- 문제5) 커미션을 받을 수 있는 사원의 정보를 출력하시오.
-- 커미션이 null이 아닌 사원의 정보
select * from employee
where commission = null; -- 틀린식

select * from employee
where commission is not null;

-- 문제6) 커미션을 받을 수 없는 사원의 정보를 출력하시오.
select * from employee where commission <> null; -- 틀린 식

select * from employee where commission is null;

-- 문제7) 사원명이 'F'로 시작하는 사원의 정보를 출력하시오
select * from employee where ename like'F%';

-- 문제8) 사원명이 'N'으로 끝나느 사원의 정보를 출력하시오
select * from employee where ename like'%N';

-- 문제9) 사원명에 'M'이 포함된 사원의 정보를 출력하시오
select * from employee where ename like'%M%';

-- 문제10) 사원명의 세번째 글자 'A'인 사원의 정보를 출력하시오.
select * from employee where ename like'__A%';

--문제 11) 
select * from employee where ename not like'%A%';

-- 문제12) 1981년2월20일부터 1981년  5월 1일 사이에 입사한 사원의 정보를 출력하시오.
select * from employee where hiredate >= '81/02/20'  and hiredate <= '81/05/01';

select * from employee where hiredate between '81/02/20' and '81/05/01';

-- 문재13) 사원의 급여가 2000에서 3000사이이고, 부서번호가 20또는 30인 사원의 정보를 출력하시오.
select * from employee where salary >= 2000 and salary <=3000;

select * from employee where salary BETWEEN 1000 AND 2000 and dno in (10,20);

-- 문제14) 1981년도에 입사한 사원의 정보를 급여가 높은 순으로, 급여가 같으면 사번순으로 출력하시오.
select * from employee
where hiredate  between '08/01/01' and '81/12/31'
ORDER BY salary desc, eno asc;

select * from employee
where hiredate  like'08%'
ORDER BY salary desc, eno asc;