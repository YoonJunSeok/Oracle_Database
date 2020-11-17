-- ����Ŭ�� ������ �ִ� ������ �Լ� = ���� �Լ�
-- ������ �Լ�, ������ �Լ��� �ִ�.

-- ������ �Լ� : �Ű������� �ϳ�(column �ϳ�), ����� ��µǴ� ���� ������.
select lower(ename)
 from emp;
 
-- ������ �Լ� : �Ű������� ������(column ��ü or ������), ����� ��µǴ� ���� �Ѱ�
select sum(sal)
 from emp;
 
-- upper : �ҹ��ڰ� �ִ� ���� ��� �빮�ڷ� �ٲٴ� �Լ�
-- lower : �빮�ڰ� �ִ� ���� ��� �ҹ��ڷ� �ٲٴ� �Լ�
-- initcap : ù ���ڸ� �빮�ڷ� �ٲٴ� �Լ�
-- upper, lower �� like�� ���ϵ�ī��� �Բ� �˻��� ���� ���Ǵ� �Լ��̴�.
select upper(ename) from emp;
select lower(ename) from emp;
select initcap(ename) from emp;

-- ��°� : SCOTT
select ename from emp
 where lower(ename) like '%scott%';
 
-- ��°� : scott
select lower(ename) from emp
 where ename = 'SCOTT'; 
 
-- �Խñ� �˻� ����
-- �� sql�� toad�� �Էµȴٱ⺸�ٴ� ���α׷��� �Էµȴ�.
/*
select title, content from board
 where upper(title) like '%����ڰ� �Է��� ��%' or
       upper(content) like '%����ڰ� �Է��� ��%';
*/

-- DUAL ����, DUAL ���̺�
-- �н��� ���� ����, �ӽ� ����
-- ����Ŭ������ ��� ����.
select '111111' as name, '123123' as second
 from dual;

-- length : ���ڿ��� ���̸� ��ȯ�ϴ� �Լ�
-- �ַ� �ٸ� �Լ��� ���� ���δ�.
select ename, length(ename)
 from emp;
 
select ename, length(ename) from emp
 where length(ename) >= 5;
 
-- substr : Ư�� ���ڿ��� �����ϴ� �Լ�
-- ��� ���ڿ��� ����� �� �ִ� ����� �� �����ִ� �Լ�
-- 'HELLO' substr('HELLO', 1, 2) - "HE"
-- 'HELLO' substr('HELLO", 5) - "HELLO"
-- ���������� �ٷ� �� ������ �Լ��̴�.
select substr('hello', 1, 2) from dual;

select job, substr(job, 1, 2), substr(job, 3, 2), substr(job, 5) from emp;

-- select '980407-1234567'
select substr('900000-1234567', 1, 6) from dual;

-- instr : ���� �� ����. ���� ���Ѵ�. �ڹ�, ���̽㿡�� �� �� ó���Ѵ�.

-- replace : ������ �ȿ� Ư�����ڸ� �ٸ� ���ڷ� ��ü�ϴ� �Լ�
-- replace("���ڿ� ������", "��ü�� ���ڿ�", "��ü�� ����")
-- �ø����ȣ, �����ȣ �Է��� �� ���� ��� ('-�� ���� �Է����ּ���')
select replace('900000-1234567', '-', '') from dual;

-- rpad, lpad : ������, ���ʿ� Ư�� ���ڿ��� ä��� �Լ�
-- substr�� rpad�� ���� ���� ����Ѵ�.
select rpad(substr('900000-1234567', 1, 7), 14, '*') from dual;
select rpad(substr('900000-1234567', 1, 7), length('900000-123456'), '*') from dual;
select lpad(substr('900000-1234567', 7), length('900000-123456'), '*') from dual;

-- concat : �� ���ڿ� �����͸� �����ִ� �Լ�
select concat('aaa', 'bbb') from dual;
select concat(substr('900000-1234567', 1, 7), '*******') from dual;

-- || : ���ڿ��� ��ġ�µ� ����� �� �ִ�.
select substr('900000-1234567', 1, 7) || '*******' from dual;

-- trim : �ȿ� ���ڿ��� ������ ������ �����ִ� �Լ�
-- ���� ������� �ʴ´�.
select trim('aaa bbb ccc') from dual;

-- trim(���ڿ�, ������ Ư������)
select trim('aaa bbb ccc', 'c') from dual;

-- round : �ݿø� ���ִ� �Լ�
-- round(1) : �Ҽ��� ��°�ڸ����ڿ��� �ݿø�.
select round(12.453, 2) from dual;
select round(12.453, -1) from dual;

-- trunc : ������ �Լ�, ���� �Լ�
-- mod : �������� ���ϴ� �Լ�
-- 10 % 3 == mod(10,3)


