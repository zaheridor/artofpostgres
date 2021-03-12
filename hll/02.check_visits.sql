--check the result of inserting 100000 visits to the message 1001, including unique IPs and duplicates.
  select messageid, 
         datetime::date as date,
         count(*) as count,
         count(distinct ipaddr) as uniques,
         count(*) - count(distinct ipaddr) as duplicates
    from tweet.visitor
   where messageid = 1001
group by messageid, date
order by messageid, date
   limit 10;
