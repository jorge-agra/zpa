-- https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/DELETE.html
DELETE (SELECT * FROM product_price_history) WHERE  currency_code = 'EUR';