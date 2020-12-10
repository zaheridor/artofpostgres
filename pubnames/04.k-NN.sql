--Searching the pubs nearby a known position.
select id, name, pos
  from pubnames
order by pos <-> point(-0.12,51.516)
limit 3;
