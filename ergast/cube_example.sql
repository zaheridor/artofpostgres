--get both the total amount of points racked up by to those exceptional drivers over their entire careers.
    select drivers.surname as driver,
           constructors.name as constructor,
           sum(points) as points
      from results
           join races using("raceId")
           join drivers using("driverId")
           join constructors using("constructorId")
     where drivers.surname in ('Prost', 'Senna')
  group by cube(drivers.surname, constructors.name);