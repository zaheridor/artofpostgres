--comparing Senna and Prost results wit rollup.
   select drivers.surname as driver,
           constructors.name as constructor,
           sum(points) as points
      from results
           join races using("raceId")
           join drivers using("driverId")
           join constructors using("constructorId")
     where drivers.surname in ('Prost', 'Senna')
  group by rollup(drivers.surname, constructors.name);