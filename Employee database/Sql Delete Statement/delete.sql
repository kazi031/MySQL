SELECT 
    *
FROM
    departments
ORDER BY dept_no;

commit;


delete from dup_departments;

-- if you forget to give any where clause

ROLLBACK;

DELETE FROM dup_departments 
WHERE
    dept_no = 'd001';
    
rollback;


DELETE FROM departments 
WHERE
    dept_no = 'd010';
    
    


