--table to handle online activity in the tweet database.
create table tweet.visitor
 (
  id         bigserial primary key,
  messageid  bigint not null references tweet.message(messageid),
  datetime   timestamptz not null default now(),
  ipaddr     ipaddress,

  unique(messageid, datetime, ipaddr)
 );
