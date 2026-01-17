CREATE VIEW vw_it_personnel AS
SELECT name
FROM personnel
WHERE current_position_1 = 10 
OR current_position_1 > 15 
AND current_position_1 <19
OR current_position_2 = 10 
OR current_position_2 > 15 
AND current_position_2 <19
OR current_position_3 = 10 
OR current_position_3 > 15 
AND current_position_3 <19;

SELECT name AS it_personnel
FROM vw_it_personnel;

SELECT name AS founder, email_address
FROM personnel
WHERE founder_status = True;

SELECT dept_name, name AS dept_head
FROM departments
LEFT JOIN personnel ON departments.dept_head = personnel.personnel_id
ORDER BY dept_id; 

CREATE VIEW vw_dept_positions_count AS
SELECT position_dept_id AS dept_id, COUNT(position_name) AS distinct_roles_in_dept
FROM positions
GROUP BY position_dept_id
ORDER BY distinct_roles_in_dept DESC; 

SELECT vw_count.dept_id, dept_name, distinct_roles_in_dept
FROM vw_dept_positions_count AS vw_count
LEFT JOIN departments ON vw_count.dept_id = departments.dept_id
ORDER BY distinct_roles_in_dept DESC;
