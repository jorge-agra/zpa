-- https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/CAST.html
SELECT CAST('N/A'
       AS NUMBER
       DEFAULT '0' ON CONVERSION ERROR)
  FROM DUAL;