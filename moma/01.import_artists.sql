begin;

create schema if not exists moma;

create table moma.artist
 (
   constituentid   integer not null primary key,
   name            text not null,
   bio             text,
   nationality     text,
   gender          text,
   begin           integer,
   "end"           integer,
   wiki_qid        text,
   ulan            text
 );

\copy moma.artist from 'artists/artists.2020-09-01.csv' with csv header delimiter ','

commit;
