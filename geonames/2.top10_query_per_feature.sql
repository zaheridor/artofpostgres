--top-10 query per feature.
  select class, feature, description, count(*)
    from geoname.feature
         left join raw.geonames on class = feature_class and feature = feature_code 
group by class, feature
order by count desc
   limit 10;