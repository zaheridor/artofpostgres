--query that shows the top 10 tags assigned to Aerosmith:
select track.artist, tags.tag , count(*)
  from tags 
  join tid_tag tt on tags.rowid = tt.tag 
  join tids on tids.rowid = tt.tid 
  join track on track.tid = tids.tid 
 where track.artist = 'Aerosmith'
 group by artist, tags.tag 
 limit 10;

--query that shows Aerosmith tracks that users marked as their favourite.
select track.tid, track.title, tags.tag
  from tags 
  join tid_tag tt on tags.rowid = tt.tag 
  join tids on tids.rowid = tt.tid 
  join track on track.tid = tids.tid 
 where track.artist = 'Aerosmith'
   and tags.tag ~* 'favourite'
 order by tid, tag;
