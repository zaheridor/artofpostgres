--count how many times a driver won a race when he started in pole position, per season, and return the ten drivers having done that the most in all the records or Formula One results.
  select year,
         drivers.code,
         format('%s %s', forename, surname) as name,
         count(*)
    from results
         join races using("raceId") 
         join drivers using("driverId")
   where grid = 1
     and position = 1
group by year, drivers."driverId"
order by count desc
   limit 10;