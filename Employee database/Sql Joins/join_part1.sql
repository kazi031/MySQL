drop table if exists dup_departments;

CREATE TABLE departments_dup (
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);

insert into departments_dup select * from departments;

insert into departments_dup (dept_name) values ('Public Relations');

insert into departments_dup (dept_no) values ('d010'),('d011');

SELECT 
    *
FROM
    departments_dup;

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);

INSERT INTO dept_manager_dup
select * from dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES (999904, '2017-01-01'),(999905, '2017-01-01'),(999906, '2017-01-01'),(999907, '2017-01-01');
DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001';
    
DELETE FROM departments_dup 
WHERE
    dept_no = 'd002';

SELECT 
    *
FROM
    dept_manager_dup;
    
    
select @@global.sql_mode;

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');