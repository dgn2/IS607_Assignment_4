# IS607_Assignment_4

The 'employee_org_chart.sql' script creates a set of postgreSQL tables for IS607 Assignment 4. 

The 'employee_supervisor' table contains employee_id, employee_name,employee_title, and supervisor_id. The supervisor_id is the employee_id for supervisor of the employee. All employees with the exception of the CEO have a supervisor.

The 'employee_manager1' table is created from the'employee_supervisor' table and creates a corporate hierarchy by joining on the employee_id and supervisor_id. 

The 'employee' table is created from the 'employee_supervisor' table and contains 'employee_id', 'employee_name', and 'employee_title'.

The 'supervisor' table is created from the 'employee_supervisor' table and contains 'employee_id' and 'supervisor_id'.

The 'employee_manager2' table is created from the 'employee' and 'supervisor' tables and creates a corporate hierarchy by joining on the employee_id and supervisor_id. 

The 'employee_manager1' and 'employee_manager2' have the same data, but are arrived at using different joins.