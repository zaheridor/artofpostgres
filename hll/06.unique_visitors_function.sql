--Store the previous statement as a sql function.
--You can call it as:
--select * from tweet.update_unique_visitors();
--or
--select * from tweet.update_unique_visitors(100000);
--and commit the prefered result.
begin;

create function tweet.update_unique_visitors
 (
    in batch_size  bigint default 1000,
   out messageid   bigint,
   out date        date,
   out uniques     bigint
 )
 returns setof record
 language SQL
 as $$
with new_visitors as
 (
   delete from tweet.visitor
         where id = any (  
                          select id
                            from tweet.visitor
                        order by datetime, messageid
                      for update
                     skip locked
                           limit update_unique_visitors.batch_size
                    )
     returning messageid,
               cast(datetime as date) as date,
               hll_hash_text(ipaddr::text) as visitors
 ),
    new_visitor_groups as
 (
    select messageid, date, hll_add_agg(visitors) as visitors
      from new_visitors
  group by messageid, date
 )
 insert into tweet.uniques
      select messageid, date, visitors
        from new_visitor_groups
 on conflict (messageid, date)
   do update set visitors = hll_union(uniques.visitors, excluded.visitors)
           where uniques.messageid = excluded.messageid
             and uniques.date = excluded.date
   returning messageid, date, cast(# visitors as bigint) as uniques;
$$;
       
commit;
