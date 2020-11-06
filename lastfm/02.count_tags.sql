--Search for Roger Waters in the user defined tags, filtering on the case insesitive regex.
  select tags.tag, count(tid_tag.tid)
    from tid_tag, tags
   where tid_tag.tag=tags.rowid
     and tags.tag ~* 'waters'
group by tags.tag;  
