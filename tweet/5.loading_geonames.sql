begin;

create table geonames
 (
   place      text,
   location   text,
   latitude   double precision,
   longitude  double precision,
   timezone   int generated always as (floor(longitude*24/360)) STORED
 );

\copy geonames from 'geonames.csv' with csv header delimiter ';'

alter table geonames
alter location
type point
using point(latitude,longitude);

commit;