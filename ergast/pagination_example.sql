--paginate through the laptimes table, which contains every lap time for every driver in any race.
     select lap, drivers.code, position,
            milliseconds * interval '1ms' as laptime
       from laptimes
            join drivers using(driverid)
      where raceid = 972
   order by lap, position
fetch first 3 rows only;

--second page.
     select lap, drivers.code, position,
            milliseconds * interval '1ms' as laptime
       from laptimes
            join drivers using(driverid)
      where raceid = 972
        and row(lap, position) > (1, 3)
   order by lap, position
fetch first 3 rows only;