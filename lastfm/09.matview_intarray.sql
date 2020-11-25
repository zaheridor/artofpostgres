--Materialized view that stores multiple tags for each song, with advanced indexing.
begin;

create view v_track_tags as
select tt.tid, array_agg(tags.rowid) as tags from tags join tid_tag tt on tags.rowid = tt.tag group by tt.tid;

create materialized view track_tags as
select tid, tags from v_track_tags;

create index on track_tags using gin(tags gin__int_ops);

commit;
