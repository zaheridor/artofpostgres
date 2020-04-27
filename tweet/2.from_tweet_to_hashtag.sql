--transform the raw data to a structured form, including an array of hashtags per tweet.
begin;

create table hashtag
 (
   id         bigint primary key,
   date       timestamptz,
   uname      text,
   message    text,
   location   point,
   hashtags   text[]
 );

with matches as (
  select id,
         regexp_matches(message, '(#[^ ,]+)', 'g') as match
    from tweet
),
    hashtags as (
  select id,
         array_agg(match[1] order by match[1]) as hashtags
    from matches
group by id
)    
insert into hashtag(id, date, uname, message, location, hashtags)
     select id,
            date + hour as date,
            uname,
            message,
            point(latitude, longitude),
            hashtags
       from      hashtags
            join tweet using(id);

commit;