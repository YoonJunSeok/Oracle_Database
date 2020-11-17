-- 날짜 데이터 : 오라클에서 날짜와 시간 관련한 데이터를 명시하는 일종의 데이터 타입. DATE라고 표현.
-- 모든 DB에서 다루는 매우 중요한 날짜관련 데이터. 매우 중요.
-- SYSDATE : 오늘 날짜를 출력하는 함수. 매개변수가 필요가 없다.
select sysdate as now,
       sysdate+1 as tomorrow,
       sysdate-1 as yesterday
    from dual;
    
-- ADD_MONTHS : 특정 날짜에서 달 단위로 더한 날짜를 출력하는 함수.
-- 31일과 30일 있는 달을 자동으로 계산해준다.(윤달 포함)
-- 개발자들도 날짜관련해서는 주로 db를 거친다.
select sysdate+31, add_months(sysdate, 2)
    from dual;
    
-- MONTHS_BETWEEN : 두 날짜간에 얼마나 많은 달이 차이가 나는지 알려주는 함수.
-- 기본적으로 두 날짜간 차이는  뺼셈을 통해서 이루어진다. 
select empno, ename, hiredate, sysdate,
       months_between(hiredate, sysdate) as MONTH1,
       months_between(sysdate, hiredate) as MONTH2,
       trunc(months_between(sysdate, hiredate)) as MONTH3
    from emp;
    
-- 컴퓨터에서 날짜를 저장할 때 저장하는 방식은 정수이다.

-- next_day : 지정한 날짜로부터 돌아오는 주의 지정한 요일의 날짜를 출력하는 함수.
select next_day(sysdate, '월요일')
    from dual;
    
-- last_day : 지정한 날짜가 속한 마지막 날을 출력하는 함수.
select last_day(sysdate)
    from dual;
-- 응용해서 +1 하면 다음 달의 첫 날이 출력된다.

-- 데이터 타입의 큰 3분류 : NUMBER, CHAR, DATE 
-- 형변환 함수
select to_number('12345')
    from dual;

select to_char(123456)
    from dual;
    
select to_char(sysdate, 'YYYY-MM-DD')
    from dual;
    
-- 다른 언어와 다르게 분은 mi으로 표현.    
select to_char(sysdate, 'hh:mi:ss')
    from dual;
    
select to_date('2020-11-17')
    from dual;
    
-- 과제 다시
select to_char(hiredate, 'yyyy-mm-dd')
    from emp;
    
-- NVL : null 처리 함수
-- NVL(컬럼명, 컬럼이 NULL이면 처리할 문구나 숫자)
select empno, ename, sal, comm, sal+comm, NVL(comm,0), sal+nvl(comm,0)
    from emp;
    
-- NVL2(컬럼명, 컬럼이 NULL이 아니면 출력될 숫자나 문자열, NULL이면 처리될 숫자나 문자열)
-- null일 때와 null이 아닐 때의 값을 처리할 수 있는 함수.
select empno, ename, comm,
       nvl2(comm, '0', 'X'),
       nvl2(comm, sal*12+comm, sal*12) as ANWSAL
    from emp;
    
-- decode 함수
-- decode(컬럼명, 조건1, 반환결과1, 조건2, 반환결과2, else 결과n)
-- switch-case와 비슷하다.
select empno, ename, job, sal, decode(job, 'MANAGER', sal*1.1, 'SALESMAN', sal*1.05, 'ANALYST', sal, sal*1.03) as UPSAL
    from emp;
    
    
-- case 함수. 실제로 가장 많이 사용한다.
-- 방향성을 지닌 코드로 작성하기 위해서는 case 뒤에 칼럼명을 작성하면 안된다.
-- if문과 비슷하다.
select empno, ename, job, sal,
    case
        when comm is null then '해당사항 없음'
        when comm = 0 then '수당없음'
        when comm > 0 then '수당 : ' || comm
    end as COMM_TEXT
    from emp;
    
-- decode와 같은 방식으로 사용할 수 있다.
select empno, ename, job, sal,
    case job
        when 'MANAGER' then sal*1.1
        when 'SALESMAN' then sal*1.05
        when 'ANALYST' then sal
        else sal*1.03
    end as UPSAL
    from emp;
    
-- 오라클에서는 함수안에 매개변수가 필요없으면 괄호를 할 필요가 없다.