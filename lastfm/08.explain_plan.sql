--We are able to verify the use of the index, including when using the limit clause.
explain (analyze, costs off)
select artist, title
  from track
 where title ~* 'peace';
 
explain (analyze, costs off)
   select artist, title
     from track
   where title %> 'peas'
order by title <-> 'peas'
   limit 5;
