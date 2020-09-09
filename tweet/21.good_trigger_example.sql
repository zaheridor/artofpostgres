--update the counters of RTs and FAVs each time there's a related insert in the tweet.activity table, using the ON CONFLICT clause.
--It deals with concurrency by trying to upadte if there is a conflict on the insert clause.
begin;

create table twcache.counters
 (
   messageid  bigint not null references tweet.message(messageid),
   rts        bigint,
   favs       bigint,

   unique(messageid)
 );

create or replace function twcache.tg_update_counters ()
 returns trigger
 language plpgsql
as $$
declare
begin
   insert into twcache.counters(messageid, rts, favs)
        select NEW.messageid,
               case when NEW.action = 'rt' then 1 else 0 end,
               case when NEW.action = 'fav' then 1 else 0 end
   on conflict (messageid)
     do update
           set rts = case when NEW.action = 'rt'
                          then counters.rts + 1

                          when NEW.action = 'de-rt'
                          then counters.rts - 1

                          else counters.rts
                      end,
               favs = case when NEW.action = 'fav'
                           then counters.favs + 1

                           when NEW.action = 'de-fav'
                           then counters.favs - 1

                           else counters.favs
                       end
         where counters.messageid = NEW.messageid;

  RETURN NULL;
end;
$$;

CREATE TRIGGER update_counters
         AFTER INSERT
            ON tweet.activity
      FOR EACH ROW
       EXECUTE PROCEDURE twcache.tg_update_counters();

insert into tweet.activity(messageid, action)
     values (1007, 'rt'),
            (1007, 'fav'),
            (1007, 'de-fav'),
            (1008, 'rt'),
            (1008, 'rt'),
            (1008, 'rt'),
            (1008, 'de-rt'),
            (1008, 'rt');

select messageid, rts, favs
  from twcache.counters;

rollback;
