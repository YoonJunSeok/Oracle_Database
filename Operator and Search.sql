-- 3��
-- between A and B
select *from emp
 where sal >= 1000 and sal <= 3000;
select * from emp
 where sal between 1000 and 3000;

-- not between A and B
select * from emp
 where sal not between 2000 and 3000;


-- like : ~�� ����, ~ó�� �˻��� �� ���� ���ȴ�. ���ϵ�ī��(_, %)
-- �Խñ� ��ȸ�ϴ� ����� ����ų�, ������� �˻� �� �� ���� ����Ѵ�.
-- % : �� ���� ���� ������� �ƹ� ���ڸ� �ҷ��´�, ��ҹ��� �����ؾߵȴ�.
-- _ : � ���̵� ������� �� ���� ���� �����͸� �ǹ�. �� ���ڸ�
select * from emp
 where ename like '%S';
-- s�� ������ ������ ��µȴ�.

select * from emp
 where ename like 'S%';
-- s�� ���۵Ǵ� ������ ��µȴ�.

select * from emp
 where ename like '%S%';
-- s�� �����ϴ� ������ ��µȴ�.

select ename
 from emp
  where ename like '_A%';
-- �ι�° ���ڰ� A�� ������ ��µȴ�.

select ename
 from emp
  where ename like '__A%';
-- ����° ���ڰ� A�� ������ ��µȴ�.

-- �Խ��� ���� �˻� ����
select title, contents
 from board
  where title like '%�˻���%' or
        contents like '%�˻���%';
-- ���� + �˻�� �˻��� �� ����� �� �ִ�.


-- not �������� Ȱ��


-- is null : null���� �ƴ��� �����ϴ� ������
-- where ���� ����Ѵ�. ������ is null�� �������̴�.
-- ���� : select ���� �پ ���Ǵ� ���� ������ �Ǵ� �Լ��̴�.

select * from emp where comm > 0;
-- null ���� �����ϰ� ���´�.

select * from emp
 where comm = null;
-- �ƹ� ����� ������ �ʴ´�.
-- ���ڿ� null�� ������ ������ �� ����.

--������ ����� �� �ִ� ������ ������ �� �ִ� ���� is null�̴�.
select * from emp
 where comm is null;
-- null�� ���� ��µȴ�.

select * from emp
 where comm is not null;
-- null�� �ƴ� ���� ��µȴ�.
 
select * from emp;
-- ��°��� ��ĭ�� �� �װ��� null value�̴�.


-- ���� ������ : �ַ� ������� �ʴ´�.
-- ���η� �ٿ��ִ� ������.
-- ������
-- column�� ��õǴ� ������ Ÿ���� ���ƾ��Ѵ�.
select empno, ename, job from emp
union 
select * from dept;

-- join �̶�� ��ɾ ���߿� ������ ���� ����Ѵ�.

-- intersect : ������
-- ���� �ִ� ���̺�� �Ʒ��� �ִ� ���̺��� ����� ��ġ�ϴ� row�� ��µȴ�.
select empno, ename, sal, deptno from emp
intersect
select empno, ename, sal, deptno from emp
 where deptno = 10;