--query first 10 rows after loading data from CSV.
table geolite.blocks limit 10;

--get operators of the ip4r extension. 
select amopopr::regoperator
from pg_opclass c
join pg_am am on am.oid = c.opcmethod
join pg_amop amop on amop.amopfamily = c.opcfamily 
where opcintype = 'ip4r'::regtype and am.amname = 'gist';

--the operator >>= reads as 'contains', and knows how to work with a GiST index.
select b.iprange, b.geoname_id 
from geolite.blocks b 
where b.iprange >>= '91.121.37.122';

--location of a IP address (UK pub).
select * 
from geolite.blocks
join geolite.location using(geoname_id)
where iprange >>= '129.67.242.154';

--ten nearest pubs by IP.
select pubs.name, round((pubs.pos <@> blocks.location)::numeric, 3) as miles, ceil(1609.34) * ((pubs.pos <@> blocks.location)::numeric) as meters
from geolite.location l
join geolite.blocks using(geoname_id)
left join lateral(select name, pos from pubnames order by pos <-> blocks.location limit 10) as pubs on true
where blocks.iprange >>= '129.67.242.154'
order by meters;
