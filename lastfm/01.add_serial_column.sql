--add serial column to compensate floowing the migration from SQLite to Postgres.
begin;

alter table tags add column rowid serial;
alter table tids add column rowid serial;

commit;
