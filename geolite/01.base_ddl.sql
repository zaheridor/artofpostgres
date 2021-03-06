--Create data structure to hold info about cities and location.
create schema if not exists geolite;

create table if not exists geolite.location
(
   geoname_id      	integer primary key,
   continent_name	text,
   country_name	text,
   subdivision_1_name	text,
   city_name	        text,
   metro_code		text
);

create table if not exists geolite.blocks
(
   geoname_id      	integer primary key,
   iprange    		ip4r,
   postal_code  	text,
   location   		point
);

create index blocks_ip4r_idx on geolite.blocks using gist(iprange);
