-- ������ �Լ� : ���� ���� �������� �ϳ��� ��� ���� ���.
select sum(sal)
    from emp;
 
-- ���� ������ ��µǴ� �÷��� ������ �Լ��� ���� ���� �� �������� �ʴ� �����Ͱ� �ǹǷ� ���� ǥ���� ���� ����.
-- ������ ������ �Լ��� ������ ����ϴ� ���� ����.
select avg(sal), sum(sal)
    from emp;

-- COUNT(�� �÷�) : ������ ���� ���� null�� �ƴ� �÷����� ������ ����.
-- COUNT(*) : � ���̺��̵� null ���ǿ� �ش����� �ʰ� ������ �� �� �ֱ� ������ ���� ���� ���Ǵ� �����̴�.
select count(*)
    from emp; 

-- max / min : �ִ� / �ּҰ��� ���ϴ� �Լ�.
select max(sal)
    from emp;

select min(sal)
    from emp;
 
-- avg(�÷���) : ����� ���ϴ� �Լ�.
select round(avg(sal), 2) as AVG_SAL
    from emp;
 
-- group by A: A�� ���� �׷������ִ� �Լ�.
-- ������ �Ǵ� �÷��� ���� ������ �Լ��� ��ȯ���� ����ϴ� �Լ�.
-- �̸� ���� ���� �࿡ ���� �����͸� ����� �� �ִ�.
select deptno,
       round(avg(sal),2)
    from emp
   group by job, deptno
   order by deptno;

-- having �� : �׷��� �� �Ŀ� ����Ǵ� where ��. ������ �Լ��� �������� �� �� �ִٴ� Ư¡�� �ִ�.
-- where ���� row �ϳ��� ���� ������ �Է������� having ���� �׷쿡 ���� ������ ����Ѵ�.
-- �׷�ȭ ���Ŀ� �ڸ���.
select deptno,
       round(avg(sal),2) as AVG_SAL
    from emp
   group by deptno
    having round(avg(sal),2) > 2000
   order by deptno;

-- �׷�ȭ ���� �ڸ���.
select deptno, round(avg(sal),2) as AVG_SAL
    from emp
   where sal > 2000
   group by deptno
   order by deptno;
   
-- rollup(a,b) : �տ� ���� ������ ����(a)���� ������ �Լ��� ���� ���� ��ȯ�� �� ��ü�� ���� ������ �Լ� ���� ��ȯ.
select deptno, job, round(avg(sal),2) as AVG_SAL
    from emp
   group by rollup(deptno, job)
   order by deptno;

-- cube : rollup + �ڿ� ���� ����.
select deptno, job, round(avg(sal),2) as AVG_SAL
    from emp
   group by cube(deptno, job)
   order by deptno;
   
-- ���� : �ܷ�Ű�� �������� ���̺� ���� ���踦 �ξ��ִ� ��ɾ�.
-- ������ ������ ���̽��� ��. ������ �˰� �־�� �ȴ�.