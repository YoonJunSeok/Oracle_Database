-- ��¥ ������ : ����Ŭ���� ��¥�� �ð� ������ �����͸� ����ϴ� ������ ������ Ÿ��. DATE��� ǥ��.
-- ��� DB���� �ٷ�� �ſ� �߿��� ��¥���� ������. �ſ� �߿�.
-- SYSDATE : ���� ��¥�� ����ϴ� �Լ�. �Ű������� �ʿ䰡 ����.
select sysdate as now,
       sysdate+1 as tomorrow,
       sysdate-1 as yesterday
    from dual;
    
-- ADD_MONTHS : Ư�� ��¥���� �� ������ ���� ��¥�� ����ϴ� �Լ�.
-- 31�ϰ� 30�� �ִ� ���� �ڵ����� ������ش�.(���� ����)
-- �����ڵ鵵 ��¥�����ؼ��� �ַ� db�� ��ģ��.
select sysdate+31, add_months(sysdate, 2)
    from dual;
    
-- MONTHS_BETWEEN : �� ��¥���� �󸶳� ���� ���� ���̰� ������ �˷��ִ� �Լ�.
-- �⺻������ �� ��¥�� ���̴�  �E���� ���ؼ� �̷������. 
select empno, ename, hiredate, sysdate,
       months_between(hiredate, sysdate) as MONTH1,
       months_between(sysdate, hiredate) as MONTH2,
       trunc(months_between(sysdate, hiredate)) as MONTH3
    from emp;
    
-- ��ǻ�Ϳ��� ��¥�� ������ �� �����ϴ� ����� �����̴�.

-- next_day : ������ ��¥�κ��� ���ƿ��� ���� ������ ������ ��¥�� ����ϴ� �Լ�.
select next_day(sysdate, '������')
    from dual;
    
-- last_day : ������ ��¥�� ���� ������ ���� ����ϴ� �Լ�.
select last_day(sysdate)
    from dual;
-- �����ؼ� +1 �ϸ� ���� ���� ù ���� ��µȴ�.

-- ������ Ÿ���� ū 3�з� : NUMBER, CHAR, DATE 
-- ����ȯ �Լ�
select to_number('12345')
    from dual;

select to_char(123456)
    from dual;
    
select to_char(sysdate, 'YYYY-MM-DD')
    from dual;
    
-- �ٸ� ���� �ٸ��� ���� mi���� ǥ��.    
select to_char(sysdate, 'hh:mi:ss')
    from dual;
    
select to_date('2020-11-17')
    from dual;
    
-- ���� �ٽ�
select to_char(hiredate, 'yyyy-mm-dd')
    from emp;
    
-- NVL : null ó�� �Լ�
-- NVL(�÷���, �÷��� NULL�̸� ó���� ������ ����)
select empno, ename, sal, comm, sal+comm, NVL(comm,0), sal+nvl(comm,0)
    from emp;
    
-- NVL2(�÷���, �÷��� NULL�� �ƴϸ� ��µ� ���ڳ� ���ڿ�, NULL�̸� ó���� ���ڳ� ���ڿ�)
-- null�� ���� null�� �ƴ� ���� ���� ó���� �� �ִ� �Լ�.
select empno, ename, comm,
       nvl2(comm, '0', 'X'),
       nvl2(comm, sal*12+comm, sal*12) as ANWSAL
    from emp;
    
-- decode �Լ�
-- decode(�÷���, ����1, ��ȯ���1, ����2, ��ȯ���2, else ���n)
-- switch-case�� ����ϴ�.
select empno, ename, job, sal, decode(job, 'MANAGER', sal*1.1, 'SALESMAN', sal*1.05, 'ANALYST', sal, sal*1.03) as UPSAL
    from emp;
    
    
-- case �Լ�. ������ ���� ���� ����Ѵ�.
-- ���⼺�� ���� �ڵ�� �ۼ��ϱ� ���ؼ��� case �ڿ� Į������ �ۼ��ϸ� �ȵȴ�.
-- if���� ����ϴ�.
select empno, ename, job, sal,
    case
        when comm is null then '�ش���� ����'
        when comm = 0 then '�������'
        when comm > 0 then '���� : ' || comm
    end as COMM_TEXT
    from emp;
    
-- decode�� ���� ������� ����� �� �ִ�.
select empno, ename, job, sal,
    case job
        when 'MANAGER' then sal*1.1
        when 'SALESMAN' then sal*1.05
        when 'ANALYST' then sal
        else sal*1.03
    end as UPSAL
    from emp;
    
-- ����Ŭ������ �Լ��ȿ� �Ű������� �ʿ������ ��ȣ�� �� �ʿ䰡 ����.