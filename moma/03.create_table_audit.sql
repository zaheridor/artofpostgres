--to install extension, run in psql: 'CREATE EXTENSION hstore;'
begin;

create table moma.audit
(
change_date timestamptz default now(),
schema_name name,
table_name name,
before hstore,
after hstore
);

commit;
