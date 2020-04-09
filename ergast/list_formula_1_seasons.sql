--list of formula one seasons.
with points as
 (
    select year as season, "driverId", "constructorId",
           sum(points) as points
      from results join races using("raceId")
  group by grouping sets((year, "driverId"),
                         (year, "constructorId"))
    having sum(points) > 0
  order by season, points desc
 ),
 tops as
 (
    select season,
           max(points) filter(where "driverId" is null) as ctops,
           max(points) filter(where "constructorId" is null) as dtops
      from points
  group by season
  order by season, dtops, ctops
 ),
 champs as
 (
    select tops.season,
           champ_driver."driverId",
           champ_driver.points,
           champ_constructor."constructorId",
           champ_constructor.points
      from tops
           join points as champ_driver
             on champ_driver.season = tops.season
            and champ_driver."constructorId" is null
            and champ_driver.points = tops.dtops
   
           join points as champ_constructor
             on champ_constructor.season = tops.season
            and champ_constructor."driverId" is null
            and champ_constructor.points = tops.ctops
  )
  select season,
         format('%s %s', drivers.forename, drivers.surname)
            as "Driver's Champion",
         constructors.name
            as "Constructor's champion"
    from champs
         join drivers using("driverId")
         join constructors using("constructorId")
order by season;