-- EXISTS RETURN ONLY TRUE AND FALSE
-- CANT SELECT ANY FIELD FROM INNER QUERY TABLES
-- select the first_name and last_name of all the managers
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            e.emp_no = dm.emp_no)
ORDER BY e.emp_no;

-- Select the entire information for all employees whose job title is “Assistant Engineer”. 

SELECT 
    e.*
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            e.emp_no = t.emp_no
                AND t.title = 'Assistant Engineer')
ORDER BY e.emp_no;