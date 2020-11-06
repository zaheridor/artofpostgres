--create table to import tracks from the million song project.
begin;

create table track
 (
   tid    text,
   artist text,
   title  text
 );

commit;
