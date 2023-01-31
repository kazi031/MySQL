drop table if exists employees_dup;
create table employees_dup(
	emp_no int(11),
    birth_date date,
    first_name varchar(14),
    last_name varchar(16),
    gender enum('M','F'),
    hire_date date
);

insert into employees_dup select * from employees limit 20;

-- check
SELECT 
    *
FROM
    employees_dup;

-- duplicate entry    
insert into employees_dup  values(10001,'1953-09-02','Georgi','Facello','M','1986-06-26');

-- use of union all
-- use to combine a few select statements in a single output
-- WE HAVE TO SELECT SAME NUMBER OF COLUMNS FROM EACH TABLE
-- THESE COLUMNS SHOULD HAVE THE SAME NAMES,SHOULD BE IN THE SAME ORDER AND SHOULD CONTAIN RELATED DATA TYPES

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = 10001 
UNION ALL SELECT 
    NULL AS emp_no,
    NULL AS frist_name,
    NULL AS last_name,
    dm.dept_no,
    dm.from_date
FROM
    dept_manager dm;
    
    
-- union
-- here the duplicate value will not be selected 
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = 10001 
UNION SELECT 
    NULL AS emp_no,
    NULL AS frist_name,
    NULL AS last_name,
    dm.dept_no,
    dm.from_date
FROM
    dept_manager dm;

-- --------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    *
FROM
    (SELECT 
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
    FROM
        employees e
    WHERE
        last_name = 'Denis' UNION SELECT 
        NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) AS a
ORDER BY  a.emp_no DESC;