--search for drivers who didn’t finish a single race they participated into, per season.
with counts as
 (
   select date_trunc('year', date) as year,
          count(*) filter(where position is null) as outs,
          bool_and(position is null) as never_finished
     from drivers
          join results using("driverId")
          join races using("raceId")
 group by date_trunc('year', date), "driverId"
 )
   select extract(year from year) as season,
          sum(outs) as "#times any driver didn't finish a race"
     from counts
    where never_finished
 group by season
 order by sum(outs) desc
    limit 5;