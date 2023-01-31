-- Find the average salary of men and women in the company

-- ans >>

SELECT 
    e.gender, AVG(s.salary) as Average_Salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY e.gender;

-- when using aggregate functions we cant simply select any column we must choose and the column we are grouping by
-- for instance here we cant use the emp_no column