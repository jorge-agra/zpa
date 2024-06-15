-- https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/create-property-graph.html
CREATE PROPERTY GRAPH “myGraph”
  VERTEX TABLES (“myschema”. “mytable” LABEL “foo” LABEL “bar”);