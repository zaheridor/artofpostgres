--Lists the drivers who received no points in race 972 (Russian Grand Prix of 2017-04-30) despite having gotten some points in the previous race (id 971, Bahrain Grand Prix of 2017-04-16).
(
      select "driverId",
             format('%s %s',
                    drivers.forename,
                    drivers.surname)
             as name
        from results
             join drivers using("driverId")
       where "raceId" = 972
         and points = 0
)     
except
(
      select "driverId",
             format('%s %s',
                    drivers.forename,
                    drivers.surname)
             as name
        from results
             join drivers using("driverId")
       where "raceId" = 971
         and points = 0
);