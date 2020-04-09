--fetch the list of competing drivers in their position order (winner first), and also their ranking compared to other drivers from the same constructor in the race.
select surname,
         constructors.name,
         position,
         format('%s / %s',
                row_number()
                  over(partition by "constructorId"
                           order by position nulls last),

                count(*) over(partition by "constructorId")
               )
            as "pos same constr"
    from      results
         join drivers using("driverId")
         join constructors using("constructorId")
   where "raceId" = 890
order by position;