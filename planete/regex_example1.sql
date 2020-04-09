--regex example.
with categories(id, categories) as
 (
   select id,
          regexp_split_to_array(
            regexp_split_to_table(temas, ','),
            ' > ')
          as categories
     from archives_planete
 )
 select id,
        categories[1] as category,
        categories[2] as subcategory
   from categories
  where id = 'IF39599';