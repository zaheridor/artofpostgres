--list of points from race 972 for drivers and constructors.
(
      select "raceId",
             'driver' as type,
             format('%s %s',
                    drivers.forename,
                    drivers.surname)
             as name,
             "driverStandings".points
        from "driverStandings"
             join drivers using("driverId")
       where "raceId" = 972
         and points > 0
)     
union all
(
      select "raceId",
             'constructor' as type,
             constructors.name as name,
             "constructorStandings".points
        from "constructorStandings"
             join constructors using("constructorId")
       where "raceId" = 972
         and points > 0
)
order by points desc;