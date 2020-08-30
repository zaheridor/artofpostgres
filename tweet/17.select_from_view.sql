--The view hides the complexity of how to obtain the counters from the schema.
  select messageid,
         rts,
         nickname
    from tweet.message_with_counters
         join tweet.users using(userid)
   where messageid between 1 and 6
order by messageid;
