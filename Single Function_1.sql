-- 오라클이 가지고 있는 유용한 함수 = 내장 함수
-- 다중행 함수, 단일행 함수가 있다.

-- 단일행 함수 : 매개변수가 하나(column 하나), 결과로 출력되는 값이 여러개.
select lower(ename)
 from emp;
 
-- 다중행 함수 : 매개변수가 여러개(column 전체 or 여러개), 결과로 출력되는 값이 한개
select sum(sal)
 from emp;
 
-- upper : 소문자가 있는 값을 모두 대문자로 바꾸는 함수
-- lower : 대문자가 있는 값을 모두 소문자로 바꾸는 함수
-- initcap : 첫 글자를 대문자로 바꾸는 함수
-- upper, lower 은 like와 와일드카드와 함께 검색에 많이 사용되는 함수이다.
select upper(ename) from emp;
select lower(ename) from emp;
select initcap(ename) from emp;

-- 출력값 : SCOTT
select ename from emp
 where lower(ename) like '%scott%';
 
-- 출력값 : scott
select lower(ename) from emp
 where ename = 'SCOTT'; 
 
-- 게시글 검색 예제
-- 이 sql은 toad에 입력된다기보다는 프로그램에 입력된다.
/*
select title, content from board
 where upper(title) like '%사용자가 입력한 값%' or
       upper(content) like '%사용자가 입력한 값%';
*/

-- DUAL 계정, DUAL 테이블
-- 학습을 위한 계정, 임시 계정
-- 오라클에서만 사용 가능.
select '111111' as name, '123123' as second
 from dual;

-- length : 문자열의 길이를 반환하는 함수
-- 주로 다른 함수와 같이 쓰인다.
select ename, length(ename)
 from emp;
 
select ename, length(ename) from emp
 where length(ename) >= 5;
 
-- substr : 특정 문자열을 추출하는 함수
-- 모든 문자열을 사용할 수 있는 언어라면 다 갖고있는 함수
-- 'HELLO' substr('HELLO', 1, 2) - "HE"
-- 'HELLO' substr('HELLO", 5) - "HELLO"
-- 개인정보를 다룰 때 유용한 함수이다.
select substr('hello', 1, 2) from dual;

select job, substr(job, 1, 2), substr(job, 3, 2), substr(job, 5) from emp;

-- select '980407-1234567'
select substr('900000-1234567', 1, 6) from dual;

-- instr : 별로 안 쓴다. 따라서 안한다. 자바, 파이썬에서 더 잘 처리한다.

-- replace : 데이터 안에 특정문자를 다른 문자로 대체하는 함수
-- replace("문자열 데이터", "대체될 문자열", "대체할 문자")
-- 시리얼번호, 통장번호 입력할 때 많이 사용 ('-를 빼고 입력해주세요')
select replace('900000-1234567', '-', '') from dual;

-- rpad, lpad : 오른쪽, 왼쪽에 특정 문자열을 채우는 함수
-- substr과 rpad는 같이 많이 사용한다.
select rpad(substr('900000-1234567', 1, 7), 14, '*') from dual;
select rpad(substr('900000-1234567', 1, 7), length('900000-123456'), '*') from dual;
select lpad(substr('900000-1234567', 7), length('900000-123456'), '*') from dual;

-- concat : 두 문자열 데이터를 합쳐주는 함수
select concat('aaa', 'bbb') from dual;
select concat(substr('900000-1234567', 1, 7), '*******') from dual;

-- || : 문자열을 합치는데 사용할 수 있다.
select substr('900000-1234567', 1, 7) || '*******' from dual;

-- trim : 안에 문자열을 넣으면 공백을 지워주는 함수
-- 별로 사용하지 않는다.
select trim('aaa bbb ccc') from dual;

-- trim(문자열, 제외할 특정문자)
select trim('aaa bbb ccc', 'c') from dual;

-- round : 반올림 해주는 함수
-- round(1) : 소수점 둘째자리숫자에서 반올림.
select round(12.453, 2) from dual;
select round(12.453, -1) from dual;

-- trunc : 버리는 함수, 버림 함수
-- mod : 나머지를 구하는 함수
-- 10 % 3 == mod(10,3)


