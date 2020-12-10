--Using the 'earthdistance' extension to locale the nearest pub by miles.
--CREATE EXTENSION CUBE;
--CREATE EXTENSION EARTHDISTANCE;
select id, name, pos, round((pos <@> point(-0.12,51.516))::numeric, 3) as miles
from pubnames p 
order by pos <-> point(-0.12,51.516)	--DESC --to show the farthest away pubs.
limit 10;
