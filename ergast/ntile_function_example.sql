--for each driver we are fetching his position in the results
  select surname,
         position as pos,
         row_number()
           over(order by "fastestLapSpeed"::numeric)
           as fast,
         ntile(3) over w as "group",
         lag(code, 1) over w as "prev",
         lead(code, 1) over w as "next"
    from      results
         join drivers using("driverId")
   where "raceId" = 890
  window w as (order by position)
order by position;