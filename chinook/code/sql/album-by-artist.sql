-- name: list-albums-by-artist
-- List the album titles and duration of a given artist
  select "Album"."Title" as album,
         sum("Milliseconds") * interval '1 ms' as duration
    from "Album"
         join "Artist" using("ArtistId")
         left join "Track" using("AlbumId")
   where "Artist"."Name" = :name
group by album
order by album;