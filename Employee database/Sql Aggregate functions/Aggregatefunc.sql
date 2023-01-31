SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary > 100000;
    
SELECT 
    COUNT(*)
FROM
    dept_manager;
-- * wildcard character only goes with count
-- count also work with numberic and non-numeric data both but other agg functions only works with numeric data
-- count function
SELECT 
    COUNT(DISTINCT dept_no) AS Total_dept
FROM
    departments;
    
-- sum function

SELECT 
    SUM(salary) as money_spent_after_1st_of_jan_1997
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
-- MIN and MAX

SELECT 
    MAX(emp_no) as emp_no
FROM
    employees;
    
SELECT 
    MIN(emp_no) as emp_no
FROM
    employees;
    
-- AVG funtion and round
-- round(#,dig_after_dec_point)

SELECT 
    ROUND(AVG(salary), 2) as avg_sal
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    

    
