begin;

create schema if not exists raw;

-- Must be run as a Super User in your database instance
create extension if not exists btree_gist;

drop table if exists raw.rates, rates;

create table raw.rates
 (
  currency text,
  rate     text,
  date     date
 );

\copy raw.rates from 'rates.csv' with csv delimiter ';'

alter table raw.rates
alter rate
type numeric
using cast(TO_NUMBER(coalesce(NULLIF(rate, 'NA'), '0'),'9G999D999999') as numeric);

create table rates
 (
  currency text,
  validity daterange,
  rate     numeric,

  exclude using gist (currency with =,
                      validity with &&)
 );

insert into rates(currency, validity, rate)
     select currency,
            daterange(date,
                      lead(date) over(partition by currency
                                          order by date),
                      '[)'
                     )
            as validity,
            rate
       from raw.rates
   order by date;

commit;