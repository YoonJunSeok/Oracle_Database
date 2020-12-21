-- 가장 중요한 부분
-- 모든 관계형 데이터베이스의 꽃

-- join : 여러 테이블을 한 키(외래키)를 기준으로 묶는 것.
-- 외래키 : 다른 테이블에서 주 키이지만 자기 테이블에선 주 키가 아닌 것을 묶는 것.
-- 예시, 별칭 지정.
select * from emp e, dept d
where e.DEPTNO = d.DEPTNO;

-- 집합연산자와 차이점
-- 집합연산자는 두 테이블을 붙여서 출력한다는 것은 동일하다. 앞에 명시된 컬럼에 따라 컬럼명이 좌우되고 어떤 자료인지 몰라볼 수 있다는 단점이 존재.


select * from dept;
desc dept;

-- join의 기본 형식(오라클에만 해당)
-- 등가조인 : where절에서  = 으로 바로 매칭시킬 수 있는 경우.
select * from emp, dept
where emp.deptno = dept.deptno;

select empno, ename, job, dname, loc
    from emp, dept
    where emp.deptno = dept.deptno; -- emp의 deptno와 dept의 deptno가 서로 매칭되는 경우에 출력.

-- 비등가조인 : 범위를 지정할 때 많이 사용. 속한 범위를 기준으로 다른 테이블과 매칭시키고자 할 때.

select * from SALGRADE;

select * from emp e, salgrade s
    where e.sal between s.losal and s.hisal;
    
-- 셀프조인 : 자신의 테이블과 조인하고 싶을 때 사용. 자신의 테이블 안에 외래키가 있는 경우.
-- 특수한 경우에 사용하지만 사용빈도가 높다.
-- 컬럼명이 겹치기 때문에 el.empno와 같이 사용.
select e1.empno, e1.ename, e2.empno as 상사번호, e2.ename as 상사이름
    from emp e1, emp e2
        where e1.mgr = e2.EMPNO;
        
-- 외부조인 : null값을 출력해주는 조인 방식.
-- 좌측 외부조인과 우측 외부조인으로 나뉜다.
-- 아래에서 where 절이 우측과 좌측을 나누는 기준이된다.
-- (+)기호를 이용하여 기준 테이블을 정할 수 있다. 오라클에서만 가능.
-- 우측 외부조인. : where e1.mgr = e2.empno(+)
-- 우측 e2 테이블을 기준으로 e1에 명시된 empno가 null이 있을 때 출력.
-- 좌측 외부조인 : where el.mgr(+) = e2.empno;
-- 좌측 e1 테이블을 기준으로 e2에 명시된 empno가 null이 있을 때 출력.
select e1.empno, e1.ename, e2.empno as 상사번호, e2.ename as 상사이름
    from emp e1, emp e2
        where e1.mgr = e2.EMPNO(+);
        
-- sql-99 표준문법 : 모든 DBMS에서 사용할 수 있는 방법. 표준문법으로 배우는 외부조인
-- where절 사용하는게 더 편할 수 있지만 알아두는게 좋다.
-- emp와 dept 중에 컬럼명이 같으면 등가조인을 해주는 기능.
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, empno, d.dname, d.loc
    from emp e natural join dept d
        order by deptno, e.empno;
        
-- 등가조인하나 겹치는 컬럼을 명시해야 한다.
-- 다중 컬럼을 명시할 떄 유용하다.
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, empno, d.dname, d.loc
    from emp e join dept d using(deptno);
    
-- 테이블1명 join 테이블2명 on(조건식) : 오라클과 유사하게 조인을 할 수 있다.

select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, empno, d.dname, d.loc
    from emp e join dept d on(d.deptno = e.deptno);
    
-- 좌측 외부조인과 동일한 결과.
select e1.empno, e1.ename, e2.empno as 상사번호, e2.ename as 상사이름
    from emp e1 left outer join emp e2 on(e1.mgr = e2.empno);
-- 우측 외부조인과 동일한 결과.
select e1.empno, e1.ename, e2.empno as 상사번호, e2.ename as 상사이름
    from emp e1 right outer join emp e2 on(e1.mgr = e2.empno);
    
-- 전체(full) 외부조인 : 우측 외부조인 + 좌측 외부조인.
select e1.empno, e1.ename, e2.empno as 상사번호, e2.ename as 상사이름
    from emp e1 full outer join emp e2 on(e1.mgr = e2.empno);