-- 3강
-- between A and B
select *from emp
 where sal >= 1000 and sal <= 3000;
select * from emp
 where sal between 1000 and 3000;

-- not between A and B
select * from emp
 where sal not between 2000 and 3000;


-- like : ~와 같은, ~처럼 검색할 때 많이 사용된다. 와일드카드(_, %)
-- 게시글 조회하는 기능을 만들거나, 생년월일 검색 할 때 많이 사용한다.
-- % : 몇 개의 글자 상관없이 아무 글자를 불러온다, 대소문자 구분해야된다.
-- _ : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미. 한 글자만
select * from emp
 where ename like '%S';
-- s로 끝나는 값들이 출력된다.

select * from emp
 where ename like 'S%';
-- s로 시작되는 값들이 출력된다.

select * from emp
 where ename like '%S%';
-- s를 포함하는 값들이 출력된다.

select ename
 from emp
  where ename like '_A%';
-- 두번째 글자가 A인 값들이 출력된다.

select ename
 from emp
  where ename like '__A%';
-- 세번째 글자가 A인 값들이 출력된다.

-- 게시판 정보 검색 예제
select title, contents
 from board
  where title like '%검색어%' or
        contents like '%검색어%';
-- 제목 + 검색어를 검색할 때 사용할 수 있다.


-- not 연산자의 활용


-- is null : null인지 아닌지 구분하는 연산자
-- where 절에 사용한다. 때문에 is null은 연산자이다.
-- 번외 : select 절에 붙어서 사용되는 것은 연산자 또는 함수이다.

select * from emp where comm > 0;
-- null 값을 제외하고 나온다.

select * from emp
 where comm = null;
-- 아무 결과도 나오지 않는다.
-- 숫자와 null은 연산을 수행할 수 없다.

--위에서 기대할 수 있는 연산을 수행할 수 있는 것이 is null이다.
select * from emp
 where comm is null;
-- null인 값이 출력된다.

select * from emp
 where comm is not null;
-- null이 아닌 값이 출력된다.
 
select * from emp;
-- 출력값이 빈칸일 때 그것이 null value이다.


-- 집합 연산자 : 주로 사용하지 않는다.
-- 세로로 붙여주는 연산자.
-- 합집합
-- column에 명시되는 데이터 타입이 같아야한다.
select empno, ename, job from emp
union 
select * from dept;

-- join 이라는 명령어를 나중에 굉장히 많이 사용한다.

-- intersect : 교집합
-- 위에 있는 테이블과 아래에 있는 테이블의 출력이 일치하는 row만 출력된다.
select empno, ename, sal, deptno from emp
intersect
select empno, ename, sal, deptno from emp
 where deptno = 10;