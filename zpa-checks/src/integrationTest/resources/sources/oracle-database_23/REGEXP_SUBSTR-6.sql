-- https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/REGEXP_SUBSTR.html
SELECT empName, REGEXP_SUBSTR(emailID, '[[:alnum:]]+\@[[:alnum:]]+\.[[:alnum:]]+') "Valid Email", REGEXP_INSTR(emailID, '\w+@\w+(\.\w+)+') "FIELD_WITH_VALID_EMAIL" FROM regexp_temp;