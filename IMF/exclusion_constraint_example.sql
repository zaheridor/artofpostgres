--rate for a specific time.
\index{Operators!@}

select rate
  from rates
 where currency = 'Euro' 
   and validity @> date '2020-04-01';