--show first 15 differences in audit records.
select (before -> 'constituentid')::integer as id, after - before as diff from moma.audit limit 15;

--select if any artist name has been changed and display it when the change occurred.
select audit.change_date::date,
       artist.name as "current name", 
       before.name as "previous name"
  from moma.artist
  join moma.audit
    on (audit.before->'constituentid')::integer = artist.constituentid,
       populate_record(NULL::moma.artist, before) as before
where artist.name <> before.name;
