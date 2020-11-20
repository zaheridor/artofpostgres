--adds specific indexing algorithm to take care of searching for similaity, including regular expressions.
create index on track using gist(title gist_trgm_ops);
