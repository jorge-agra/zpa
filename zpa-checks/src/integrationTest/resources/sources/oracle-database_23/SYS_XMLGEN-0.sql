-- https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/SYS_XMLGEN.html
SELECT SYS_XMLGEN(email)      
   FROM employees
   WHERE employee_id = 205;