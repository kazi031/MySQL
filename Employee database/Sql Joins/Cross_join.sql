-- cross join is normal join without any condition to choose the linked column

SELECT 
    m.*, d.*
FROM
    dept_manager m
        CROSS JOIN
    departments d;
    
-- or

SELECT 
    m.*, d.*
FROM
    dept_manager m,
    departments d
ORDER BY m.emp_no , m.dept_no;

-- if we dont want to show from which dept manager if from
SELECT 
    m.*, d.*
FROM
    dept_manager m,
    departments d
WHERE
    m.dept_no <> d.dept_no
ORDER BY m.emp_no , m.dept_no;

-- join more than 2 table

SELECT 
    dm.*, d.*,e.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
        JOIN
    employees e ON dm.emp_no = e.emp_no;

--                                                                  	EXERSIZE																					  --
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.   

SELECT 
     dm.*,d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no = 'd009'
ORDER BY dm.emp_no , d.dept_no;

-- Return a list with the first 10 employees with all the departments they can be assigned to.

SELECT 
    e.*, d.dept_name
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    emp_no < 10011
ORDER BY e.emp_no , d.dept_name;

    
