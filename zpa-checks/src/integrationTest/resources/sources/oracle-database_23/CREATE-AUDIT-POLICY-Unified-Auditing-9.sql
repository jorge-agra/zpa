-- https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/CREATE-AUDIT-POLICY-Unified-Auditing.html
CREATE AUDIT POLICY mypolicy ACTIONS COMPONENT = PROTOCOL HTTP
    AUDIT POLICY mypolicy