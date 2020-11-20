--Search for songs about love. Verify that the extension is created in the database before running the query.
--create extension pg_trgm;

  select artist, title
    from lastfm.track
   where title % 'love'		--the operator % reads 'similar to' and involves comparing trigams of both its left and right arguments.
group by artist, title
order by title <-> 'love'	--the operator <-> computes the 'distance' between the arguments.
   limit 10;
