--search for all drivers who failed to finish any single race they participated in over their whole career.
with counts as
 (
   select "driverId", forename, surname,
          count(*) as races,
          bool_and(position is null) as never_finished
     from drivers
          join results using("driverId")
          join races using("raceId")
 group by "driverId"
 )
   select "driverId", forename, surname, races
     from counts
    where never_finished
 order by races desc;