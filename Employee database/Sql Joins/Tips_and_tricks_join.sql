-- dept_name and their manager's avg salary greater than 60000

SELECT 
    d.dept_name, AVG(s.salary) AS average_salary
FROM
    dept_manager dm
        JOIN
    departments d ON dm.dept_no = d.dept_no
        JOIN
    salaries s ON dm.emp_no = s.emp_no
GROUP BY d.dept_name
HAVING average_salary > 60000
ORDER BY average_salary DESC;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- How many male and how many female managers do we have in the ‘employees’ database?

SELECT 
    e.gender, COUNT(e.gender) AS Num_of_employees
FROM
    dept_manager dm
        JOIN
    employees e ON dm.emp_no = e.emp_no
GROUP BY e.gender;






