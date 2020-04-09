--checks if two querys are the same.
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
INTERSECT
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