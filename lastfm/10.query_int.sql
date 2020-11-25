--Search for all the tracks that have been tagged both blues and rhythm and blues, using string_agg and query_int.
select format('(%s)', string_agg(rowid::text, '&'))::query_int as query from tags where tag = 'blues' or tag = 'rhythm and blues';
