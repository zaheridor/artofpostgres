--categories with grouping sets.
with categories(id, categories) as
  (
    select id,
           regexp_split_to_array(
             regexp_split_to_table(temas, ','),
             ' > ')
           as categories
      from opendata.archives_planete
  )
  select categories[1] as category,
         categories[2] as subcategory,
         count(*)
    from categories
group by rollup(category, subcategory);