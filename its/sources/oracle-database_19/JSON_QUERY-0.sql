-- https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/JSON_QUERY.html
SELECT JSON_QUERY('{a:100, b:200, c:300}', '$') AS value
  FROM DUAL;