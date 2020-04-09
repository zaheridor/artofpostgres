--reasons why drivers couldn’t make it to the end of a race.
\set season 'date ''1978-01-01'''

  select status, count(*)
    from results
         join races using("raceId")
         join status using("statusId")
   where date >= :season
     and date <  :season + interval '1 year'
     and position is null
group by status
  having count(*) >= 10
order by count(*) desc;