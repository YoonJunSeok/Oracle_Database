-- ���� �߿��� �κ�
-- ��� ������ �����ͺ��̽��� ��

-- join : ���� ���̺��� �� Ű(�ܷ�Ű)�� �������� ���� ��.
-- �ܷ�Ű : �ٸ� ���̺��� �� Ű������ �ڱ� ���̺��� �� Ű�� �ƴ� ���� ���� ��.
-- ����, ��Ī ����.
select * from emp e, dept d
where e.DEPTNO = d.DEPTNO;

-- ���տ����ڿ� ������
-- ���տ����ڴ� �� ���̺��� �ٿ��� ����Ѵٴ� ���� �����ϴ�. �տ� ��õ� �÷��� ���� �÷����� �¿�ǰ� � �ڷ����� ���� �� �ִٴ� ������ ����.


select * from dept;
desc dept;

-- join�� �⺻ ����(����Ŭ���� �ش�)
-- ����� : where������  = ���� �ٷ� ��Ī��ų �� �ִ� ���.
select * from emp, dept
where emp.deptno = dept.deptno;

select empno, ename, job, dname, loc
    from emp, dept
    where emp.deptno = dept.deptno; -- emp�� deptno�� dept�� deptno�� ���� ��Ī�Ǵ� ��쿡 ���.

-- ������ : ������ ������ �� ���� ���. ���� ������ �������� �ٸ� ���̺�� ��Ī��Ű���� �� ��.

select * from SALGRADE;

select * from emp e, salgrade s
    where e.sal between s.losal and s.hisal;
    
-- �������� : �ڽ��� ���̺�� �����ϰ� ���� �� ���. �ڽ��� ���̺� �ȿ� �ܷ�Ű�� �ִ� ���.
-- Ư���� ��쿡 ��������� ���󵵰� ����.
-- �÷����� ��ġ�� ������ el.empno�� ���� ���.
select e1.empno, e1.ename, e2.empno as ����ȣ, e2.ename as ����̸�
    from emp e1, emp e2
        where e1.mgr = e2.EMPNO;
        
-- �ܺ����� : null���� ������ִ� ���� ���.
-- ���� �ܺ����ΰ� ���� �ܺ��������� ������.
-- �Ʒ����� where ���� ������ ������ ������ �����̵ȴ�.
-- (+)��ȣ�� �̿��Ͽ� ���� ���̺��� ���� �� �ִ�. ����Ŭ������ ����.
-- ���� �ܺ�����. : where e1.mgr = e2.empno(+)
-- ���� e2 ���̺��� �������� e1�� ��õ� empno�� null�� ���� �� ���.
-- ���� �ܺ����� : where el.mgr(+) = e2.empno;
-- ���� e1 ���̺��� �������� e2�� ��õ� empno�� null�� ���� �� ���.
select e1.empno, e1.ename, e2.empno as ����ȣ, e2.ename as ����̸�
    from emp e1, emp e2
        where e1.mgr = e2.EMPNO(+);
        
-- sql-99 ǥ�ع��� : ��� DBMS���� ����� �� �ִ� ���. ǥ�ع������� ���� �ܺ�����
-- where�� ����ϴ°� �� ���� �� ������ �˾Ƶδ°� ����.
-- emp�� dept �߿� �÷����� ������ ������� ���ִ� ���.
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, empno, d.dname, d.loc
    from emp e natural join dept d
        order by deptno, e.empno;
        
-- ������ϳ� ��ġ�� �÷��� ����ؾ� �Ѵ�.
-- ���� �÷��� ����� �� �����ϴ�.
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, empno, d.dname, d.loc
    from emp e join dept d using(deptno);
    
-- ���̺�1�� join ���̺�2�� on(���ǽ�) : ����Ŭ�� �����ϰ� ������ �� �� �ִ�.

select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, empno, d.dname, d.loc
    from emp e join dept d on(d.deptno = e.deptno);
    
-- ���� �ܺ����ΰ� ������ ���.
select e1.empno, e1.ename, e2.empno as ����ȣ, e2.ename as ����̸�
    from emp e1 left outer join emp e2 on(e1.mgr = e2.empno);
-- ���� �ܺ����ΰ� ������ ���.
select e1.empno, e1.ename, e2.empno as ����ȣ, e2.ename as ����̸�
    from emp e1 right outer join emp e2 on(e1.mgr = e2.empno);
    
-- ��ü(full) �ܺ����� : ���� �ܺ����� + ���� �ܺ�����.
select e1.empno, e1.ename, e2.empno as ����ȣ, e2.ename as ����̸�
    from emp e1 full outer join emp e2 on(e1.mgr = e2.empno);