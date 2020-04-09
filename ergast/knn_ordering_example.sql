--find out the ten nearest circuits to Paris, France, which is at longitude 2.349014 and latitude 48.864716.
  select name, location, country
    from circuits
order by point(lng,lat) <-> point(2.349014, 48.864716)
   limit 10;