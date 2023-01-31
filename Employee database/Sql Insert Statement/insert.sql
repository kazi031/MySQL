SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC
LIMIT 10;

insert into employees 
(
	emp_no,birth_date,
    first_name,
    last_name,
    gender,
    hire_date
) values 
(
	999903,
    '1980-04-01',
    'John',
    'Smith',
    'M',
    '1995-01-01'
);

insert into titles
(
	emp_no,
	title,
	from_date
)
values
(
	999903,
   'Senior Engineer',
   '1997-10-01'
);
-- if there is a foreign key in a table we have to first update the table consists the foreign key as primary key

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;

SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC
LIMIT 10;

-- inserting into dept_emp

SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no DESC
LIMIT 10;

insert into dept_emp (
 emp_no,
 dept_no,
 from_date,
 to_date
 ) values (
	999903,
    'd005',
    '1997-10-01',
    '9999-01-01'
    );
    
SELECT 
    *
FROM
    departments
ORDER BY dept_no DESC;
insert into departments values ('d010','Business Analysis');


-- creating a new copy table and entry all the data

create table dup_departments
(
	dept_no char(4),
    dept_name varchar(40)
);

insert into dup_departments(
	dept_no,
    dept_name
)
select * from departments;
select * from dup_departments;

commit;

