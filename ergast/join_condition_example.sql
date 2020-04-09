--count how many drivers made it to the finish behind the current one in any single race.
   select results."positionOrder" as position,
          drivers.code,
          count(behind.*) as behind
    from results
              join drivers using("driverId")
         left join results behind
                on results."raceId" = behind."raceId"
               and results."positionOrder" < behind."positionOrder"
   where results."raceId" = 972
     and results."positionOrder" <= 3
group by results."positionOrder", drivers.code
order by results."positionOrder";

