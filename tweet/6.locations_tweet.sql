--locations of tweets where they are saying they’re hiring.
  select place,
         timezone,
         count(*)
    from hashtag
         left join lateral
         (
            select *
              from geonames
          order by location <-> hashtag.location
             limit 1
         )
         as geoname
         on true
   where hashtags @> array['#Hiring', '#Retail']
group by place, timezone
order by count desc
   limit 10;