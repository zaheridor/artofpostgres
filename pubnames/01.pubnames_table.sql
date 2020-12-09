--Table to load EAV model dataset.
create table if not exists pubnames
 (
   id   bigint,
   pos  point,
   name text
 );
