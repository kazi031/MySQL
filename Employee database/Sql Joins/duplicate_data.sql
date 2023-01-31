INSERT INTO dept_manager_dup
VALUES('110228','d003','1992-03-01','9999-01-01');

INSERT INTO departments_dup 
VALUES('d009','Customer Service');

-- we inserted some duplicate datas

SELECT 
    d2.emp_no, d1.dept_name, d1.dept_no, d2.from_date
FROM
    departments_dup d1
        INNER JOIN
    dept_manager_dup d2 ON d1.dept_no = d2.dept_no;
    
-- that's why this query retuens some extra rows
-- to avoid this kind of errors when handling big datasets we have to use group by to distinct the values

SELECT 
    d2.emp_no, d1.dept_name, d1.dept_no, d2.from_date
FROM
    departments_dup d1
        INNER JOIN
    dept_manager_dup d2 ON d1.dept_no = d2.dept_no
GROUP BY d2.emp_no
ORDER BY d2.emp_no;

-- when we use GROUP BY the duplicate values becomes one

    
