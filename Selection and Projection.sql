-- 2강
-- 싱글라인 주석
/* 멀티라인 주석 */

/*
selection 로(행) 단위로 데이터를 조회하는 방식, 대표적으로 where 명령어가 있다.
projection 컬럼(열) 단위로 데이터를 조회하는 방식, 대표적으로 select 명령어가 있다.
*/

/*
DESC 
테이블에 있는 컬럼이 어떤 속성을 가지는지를 알기 위해 사용하는 명령어

index pos의 index가 배열의 index와 같다고 보면 된다.
*/
desc emp;

/*
처음 회사 내 데이터베이스에 있는 테이블을 조회하는 방법
mysql에서는 show tables.
oracle에서는 select * from user_objects where object_type = 'TABLE'
*/
select * from user_objects where object_type = 'TABLE';

/*
select 
구분은 , 으로 한다.
사칙연산도 적용할 수 있다.
*/

select empno, ename, job from emp;
select empno, ename, sal*12+comm from emp;  -- 컬럼에 null이 발생한다.
-- 숫자와 null이 계산되었기 때문에 null인 값을 0으로 바꾸어야한다. 추후 학습

/*
distinct
데이터가 중복된게 있으면 중복을 제거해준다.
*/
select distinct job from emp;

/*
all
distinct의 반대로 중복된 것을 모두 출력, 디폴트 값으로 쓰이기에 쓰지 않는다.
밑 두개의 예시는 같다.
*/
select all job from emp;
select job from emp;

select * from emp;

/*
as
별칭, 이름을 지을 때 사용
*/
select empno "직원 번호", ename as "직원 이름", sal*12 as "연봉" from emp;

/*
order by
행들을 정렬한다
밑 두개 예시는 같다.
asc : 오름차순
desc : 내림차순
*/
select empno "직원 번호", ename as "직원 이름", sal*12 as "연봉" from emp order by ename asc;
select empno "직원 번호", ename as "직원 이름", sal*12 as "연봉" from emp order by "직원 이름" asc;
select empno as 직원이름 from emp;


-- p91 ex
select * from emp order by deptno asc, sal desc;
--asc는 default value
select * from emp order by deptno;

/*
데이터 베이스 정렬 알고리즘은 매우 많이 쓴다.
웹 업무에서는 데이터베이스에서 정렬을 한 후에 나오게 많이 구현한다.
*/

/*
where
sql의 조건문 역할을 한다.
select [컬럼], [컬럼] from [조회할 테이블] where [조건식 ex : 조회할 행 > 500]
*/
select sal from emp where sal >= 3000;

/*
산술연산자 : +, -, /, *
비교연산자 : <, >, <=, >=, !=(<>, ^=), =
조건 연산자 : and, or
IN 연산자 : =으로 되어있는 조건인데 or로 많이 묶여있을 경우 사용한다.
not 연산자 : !=, 문자열로 된 연산자의 경우 not을 많이 사용한다.
*/
select sal  from emp where sal >= 1000 and sal <= 3000;
select * from emp where not deptno in(30);

--밑 두개의 예시는 같다.
select * from emp where sal = 3000 or sal = 1000 or sal = 2000 or sal = 3500;
select * from emp where sal in (3000, 1000, 2000, 3500);

-- and 연산자 사용시 주의사항
-- 시간이 굉장히 중요하다
select *
 from emp
 where sal > 1000 and
       deptno = 30;
-- 위 보다는
select *
 from emp
 where depno = 30 and
       sal > 1000;
-- 아래가 더 작은 연산이다.(depno = 30에 해당되는 개수가 더 적으므로)
-- 따라서 and절로 묶을 때는 적게 출력이 되는 녀석들을 먼저 써야한다.




