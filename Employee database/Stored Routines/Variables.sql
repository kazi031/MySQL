SET @out_avg_sal = 0;
CALL emp_avg_salary(11300,@out_avg_sal);
SELECT @out_avg_sal;

commit;

-- practice

-- Create a variable, called ‘v_emp_no’, where you will store the output of the procedure you created in the last exercise.
-- Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively.
-- Finally, select the obtained output.


SET @v_emp_no = 0;
CALL emp_info('Aruna','Journel',@v_emp_no);
SELECT @v_emp_no;

commit;