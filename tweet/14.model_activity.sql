--decoupling tweet activity from tweet messages, so we model for concurrency.
begin;

create type tweet.action_t
    as enum('rt', 'fav', 'de-rt', 'de-fav');

create table tweet.activity
 (
  id          bigserial primary key,
  messageid   bigint not null references tweet.message(messageid),
  datetime    timestamptz not null default now(),
  action      tweet.action_t not null,

  unique(messageid, datetime, action)
 );

--for concurrency reasons, we must drop the unique constraint.
/*
alter table tweet.activity
drop constraint activity_messageid_datetime_action_key;
*/

commit;
