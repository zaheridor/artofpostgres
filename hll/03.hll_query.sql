--query example using operators and functions related to the HLL datatype.
  select messageid, 
         datetime::date as date,
         # hll_add_agg(hll_hash_text(ipaddr::text)) as hll
    from tweet.visitor
   where messageid = 1001
group by grouping sets((messageid),
                       (messageid, date))
order by messageid, date nulls first
   limit 10;
