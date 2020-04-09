-- name: top-artists-by-album
-- Get the list of the N artists with the most albums
  select "Artist"."Name", count(*) as albums
    from           "Artist"
         left join "Album" using("ArtistId")
group by "Artist"."Name"
order by albums desc
   limit :n;