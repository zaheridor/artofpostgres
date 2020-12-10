--Get the name of the closest known city to the pub.
   select name,
         (select name from cities c order by c.pos <-> p.pos limit 1) as city,
         round((pos <@> point(-0.12,51.516))::numeric, 3) as miles
    from pubnames p
order by pos <-> point(-0.12,51.516) desc
   limit 5;

--lateral alternative:
  select c.name as city, p.name,
         round((pos <@> point(-0.12,51.516))::numeric, 3) as miles
    from pubnames p,
         lateral (select name
                    from cities c
                order by c.pos <-> p.pos
                   limit 1) c
order by pos <-> point(-0.12,51.516) desc
   limit 5;

--optimized version:
with pubs as (
    select name, pos,
           round((pos <@> point(-0.12,51.516))::numeric, 3) as miles
      from pubnames
  order by pos <-> point(-0.12,51.516) desc
     limit 5
)
select c.name as city, p.name, p.miles
  from pubs p, lateral (select name
                          from cities c
                      order by c.pos <-> p.pos
                         limit 1) c;
