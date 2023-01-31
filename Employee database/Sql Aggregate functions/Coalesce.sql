SELECT 
    *
FROM
    dup_departments
ORDER BY dept_no;

alter table dup_departments
change column dept_name dept_name varchar(40) null;

insert into dup_departments
(
	dept_no
) values
('d011'),('d012');

commit;

alter table dup_departments add column dept_manager varchar(40) after dept_name;

-- coalesce and if null

SELECT 
    dept_no, IFNULL(dept_name, 'Dept name not provided')
FROM
    dup_departments;

-- if we have to use more than 2 parameters we have to use coalesce 
-- coalesce(dept_manager,dept_name,'N/A') this means first the function will check if the dept_manager field is null or not
-- then if not null it will print the value in dept_manager else it will check dept_name if it is null or not
-- if the dept_name field is not null then it will print the value stored in dept_name else it will move to 3rd parameter and if that's a string will print it
-- coalesce can have more fields to check if null or not
SELECT 
    dept_no,
    IFNULL(dept_name, 'Not provided') as dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') as dept_manager
FROM
    dup_departments
ORDER BY dept_no;

-- caolesce can be used as fake column just to visualize database

SELECT 
    dept_no,
    IFNULL(dept_name, 'Not provided') as dept_name,
    COALESCE('Dept Manager') as dept_manager
FROM
    dup_departments
ORDER BY dept_no;

-- ----------------------------------------------------------------------------------------
-- problem 1
SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no,dept_name) as dept_info
FROM
    dup_departments
ORDER BY dept_no;

-- problem 2
SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name, 'Not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    dup_departments
ORDER BY dept_no;





  