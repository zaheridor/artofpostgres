\set start '2010-01-01'

  select date,
         to_char(shares, '99G999G999G999') as shares,
         to_char(trades, '99G999G999') as trades,
         to_char(dollars, 'L99G999G999G999') as dollares
    from factbook
   where date >= date :'start'
     and date  < date :'start' + interval '1 month'
order by date;