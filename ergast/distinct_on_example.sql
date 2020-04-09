--list of drivers who ever won a race in the whole Formula One history.
select distinct on ("driverId")
       forename, surname
  from results
       join drivers using("driverId")
 where position = 1;