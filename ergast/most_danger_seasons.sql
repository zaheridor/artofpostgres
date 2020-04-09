--the most dangerous seasons in terms of accidents.
 select extract(year from races.date) as season,
         count(*)
           filter(where status = 'Accident') as accidents
    from results
         join status using("statusId")
         join races using("raceId")
group by season
order by accidents desc
   limit 5;