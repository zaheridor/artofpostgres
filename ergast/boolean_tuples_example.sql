--filter F1 drivers who won all the races they finished in a specific season
  select year,
         format('%s %s', forename, surname) as name,
         count(*) as ran,
         count(*) filter(where position = 1) as won,
         count(*) filter(where position is not null) as finished,
         sum(points) as points
    from      races
         join results using("raceId")
         join drivers using("driverId")
group by year, drivers."driverId"
  having bool_and(position = 1) is true
order by year, points desc;