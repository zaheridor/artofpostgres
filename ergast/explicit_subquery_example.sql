\set beginning '2017-04-01'
\set months 3
--display all the races from a quarter with their winner.
select date, name, drivers.surname as winner
  from races
       left join
           ( select raceid, driverid
               from results
              where position = 1
           )
           as winners using(raceid)
       left join drivers using(driverid)
 where date >= date :'beginning'
   and date <  date :'beginning'
              + :months * interval '1 month';