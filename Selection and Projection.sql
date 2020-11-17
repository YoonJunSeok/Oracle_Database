-- 2��
-- �̱۶��� �ּ�
/* ��Ƽ���� �ּ� */

/*
selection ��(��) ������ �����͸� ��ȸ�ϴ� ���, ��ǥ������ where ��ɾ �ִ�.
projection �÷�(��) ������ �����͸� ��ȸ�ϴ� ���, ��ǥ������ select ��ɾ �ִ�.
*/

/*
DESC 
���̺� �ִ� �÷��� � �Ӽ��� ���������� �˱� ���� ����ϴ� ��ɾ�

index pos�� index�� �迭�� index�� ���ٰ� ���� �ȴ�.
*/
desc emp;

/*
ó�� ȸ�� �� �����ͺ��̽��� �ִ� ���̺��� ��ȸ�ϴ� ���
mysql������ show tables.
oracle������ select * from user_objects where object_type = 'TABLE'
*/
select * from user_objects where object_type = 'TABLE';

/*
select 
������ , ���� �Ѵ�.
��Ģ���굵 ������ �� �ִ�.
*/

select empno, ename, job from emp;
select empno, ename, sal*12+comm from emp;  -- �÷��� null�� �߻��Ѵ�.
-- ���ڿ� null�� ���Ǿ��� ������ null�� ���� 0���� �ٲپ���Ѵ�. ���� �н�

/*
distinct
�����Ͱ� �ߺ��Ȱ� ������ �ߺ��� �������ش�.
*/
select distinct job from emp;

/*
all
distinct�� �ݴ�� �ߺ��� ���� ��� ���, ����Ʈ ������ ���̱⿡ ���� �ʴ´�.
�� �ΰ��� ���ô� ����.
*/
select all job from emp;
select job from emp;

select * from emp;

/*
as
��Ī, �̸��� ���� �� ���
*/
select empno "���� ��ȣ", ename as "���� �̸�", sal*12 as "����" from emp;

/*
order by
����� �����Ѵ�
�� �ΰ� ���ô� ����.
asc : ��������
desc : ��������
*/
select empno "���� ��ȣ", ename as "���� �̸�", sal*12 as "����" from emp order by ename asc;
select empno "���� ��ȣ", ename as "���� �̸�", sal*12 as "����" from emp order by "���� �̸�" asc;
select empno as �����̸� from emp;


-- p91 ex
select * from emp order by deptno asc, sal desc;
--asc�� default value
select * from emp order by deptno;

/*
������ ���̽� ���� �˰����� �ſ� ���� ����.
�� ���������� �����ͺ��̽����� ������ �� �Ŀ� ������ ���� �����Ѵ�.
*/

/*
where
sql�� ���ǹ� ������ �Ѵ�.
select [�÷�], [�÷�] from [��ȸ�� ���̺�] where [���ǽ� ex : ��ȸ�� �� > 500]
*/
select sal from emp where sal >= 3000;

/*
��������� : +, -, /, *
�񱳿����� : <, >, <=, >=, !=(<>, ^=), =
���� ������ : and, or
IN ������ : =���� �Ǿ��ִ� �����ε� or�� ���� �������� ��� ����Ѵ�.
not ������ : !=, ���ڿ��� �� �������� ��� not�� ���� ����Ѵ�.
*/
select sal  from emp where sal >= 1000 and sal <= 3000;
select * from emp where not deptno in(30);

--�� �ΰ��� ���ô� ����.
select * from emp where sal = 3000 or sal = 1000 or sal = 2000 or sal = 3500;
select * from emp where sal in (3000, 1000, 2000, 3500);

-- and ������ ���� ���ǻ���
-- �ð��� ������ �߿��ϴ�
select *
 from emp
 where sal > 1000 and
       deptno = 30;
-- �� ���ٴ�
select *
 from emp
 where depno = 30 and
       sal > 1000;
-- �Ʒ��� �� ���� �����̴�.(depno = 30�� �ش�Ǵ� ������ �� �����Ƿ�)
-- ���� and���� ���� ���� ���� ����� �Ǵ� �༮���� ���� ����Ѵ�.




