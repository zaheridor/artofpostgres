begin;

drop table if exists magic.sets, magic.cards;

create table magic.master
    as
select key as name, value - 'foreignData' as data
  from magic.allsets, jsonb_each(data);
  
create table magic.detail
    as
  with collection as
  (
     select key as set,
            value->'foreignData' as data
       from magic.allsets,
            lateral jsonb_each(data)
  )
  select set, jsonb_array_elements(data) as data
    from collection;

commit;
