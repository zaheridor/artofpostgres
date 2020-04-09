--count how many races have been run in each decade.
select extract('year'
               from
               date_trunc('decade', date))
       as decade,
       count(*)
  from races
group by decade
order by decade;