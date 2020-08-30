--A materialized view cache a snapshot of the database into a permanet relation for later quering.
create schema if not exists twcache;

create materialized view twcache.message
    as select messageid, userid, datetime, message,
              rts, favs,
              location, lang, url
         from tweet.message_with_counters;

create unique index on twcache.message(messageid);
