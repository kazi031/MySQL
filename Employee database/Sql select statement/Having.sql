SELECT 
    *
FROM
    employees
HAVING hire_date > '2000-01-01';
SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';
    
-- both statements are identical
-- One of the most important differences between having and where is use of aggregate function
-- in where we cant use them but in having we can
-- take the following as an example

/*SELECT 
    first_name, COUNT(first_name)
FROM
    employees
WHERE
    COUNT(first_name) > 250
GROUP BY first_name;*/


-- the above aproach will get an error because we cant use any aggregate functions in where clause

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250;

-- this wont get any error!!
-- practice probelem
SELECT 
    emp_no
FROM
    salaries
GROUP BY emp_no;
-- this seperates every distinct emp_no
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no
ORDER BY emp_no;
-- this is not a right query because avg salaray should be greater than 120000
/*If you use the AVG() function with a GROUP BY clause, the AVG() function returns a single value for each group instead of single value for the whole table*/
SELECT 
    *, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;
-- this query is right