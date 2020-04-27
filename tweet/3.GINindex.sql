--This index access method allows PostgreSQL to index the contents of the arrays, the tags themselves, rather than each array as an opaque value.
create index on hashtag using gin (hashtags);