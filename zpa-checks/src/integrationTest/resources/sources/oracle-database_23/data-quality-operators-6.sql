-- https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/data-quality-operators.html
SQL> select fuzzy_match(WHOLE_WORD_MATCH, 'Pawan Kumar Goel', 'Pavan Kumar G', EDIT_TOLERANCE 60) from dual;