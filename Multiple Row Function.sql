-- 다중행 함수 : 여러 행을 바탕으로 하나의 결과 값을 출력.
select sum(sal)
    from emp;
 
-- 단일 행으로 출력되는 컬럼과 다중행 함수는 같이 쓰면 잘 정리되지 않는 데이터가 되므로 같이 표기할 수는 없다.
-- 하지만 다중행 함수를 여러개 명시하는 것은 가능.
select avg(sal), sum(sal)
    from emp;

-- COUNT(셀 컬럼) : 지정된 셀의 값이 null이 아닌 컬럼들의 개수를 센다.
-- COUNT(*) : 어떤 테이블이든 null 조건에 해당하지 않고 개수를 셀 수 있기 때문에 가장 많이 사용되는 관용어구이다.
select count(*)
    from emp; 

-- max / min : 최대 / 최소값을 구하는 함수.
select max(sal)
    from emp;

select min(sal)
    from emp;
 
-- avg(컬럼명) : 평균을 구하는 함수.
select round(avg(sal), 2) as AVG_SAL
    from emp;
 
-- group by A: A에 따라 그루핑해주는 함수.
-- 기준이 되는 컬럼을 토대로 다중행 함수의 반환값을 출력하는 함수.
-- 이를 통해 단일 행에 대한 데이터를 사용할 수 있다.
select deptno,
       round(avg(sal),2)
    from emp
   group by job, deptno
   order by deptno;

-- having 절 : 그루핑 한 후에 실행되는 where 절. 다중행 함수가 조건절로 올 수 있다는 특징이 있다.
-- where 절은 row 하나에 따른 조건을 입력하지만 having 절은 그룹에 대한 조건을 명시한다.
-- 그룹화 이후에 자른다.
select deptno,
       round(avg(sal),2) as AVG_SAL
    from emp
   group by deptno
    having round(avg(sal),2) > 2000
   order by deptno;

-- 그룹화 전에 자른다.
select deptno, round(avg(sal),2) as AVG_SAL
    from emp
   where sal > 2000
   group by deptno
   order by deptno;
   
-- rollup(a,b) : 앞에 적힌 조건을 기준(a)으로 다중행 함수에 대한 값을 반환한 뒤 전체에 대한 다중행 함수 값을 반환.
select deptno, job, round(avg(sal),2) as AVG_SAL
    from emp
   group by rollup(deptno, job)
   order by deptno;

-- cube : rollup + 뒤에 적힌 조건.
select deptno, job, round(avg(sal),2) as AVG_SAL
    from emp
   group by cube(deptno, job)
   order by deptno;
   
-- 조인 : 외래키를 기준으로 테이블 간의 관계를 맺어주는 명령어.
-- 관계형 데이터 베이스의 꽃. 무조건 알고 있어야 된다.