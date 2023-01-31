-- a sub_query should always be placed within a parenthesis
-- the sql engine starts by running the inner query
-- a subquery may return a single value,a single value,a single column or a entire table
-- it is possible to nest inner queries within other inner query
-- in this case the sql engine would execute the inner most query first,and then each subsequent query,until it runs the outermist query last

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);

-- Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.

SELECT 
    e.*
FROM
    employees e
WHERE
    e.hire_date BETWEEN '1990-01-01' AND '1995-01-01'
        AND e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);
            
-- or

SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');