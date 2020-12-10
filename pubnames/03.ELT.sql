--Query that group pub names that look alike.
select array_to_string(array_agg(distinct(name) order by name), ','), count(*) 
from pubnames
group by replace(replace(name, 'The ', ''), 'And', '&')
order by count desc
limit 5;
