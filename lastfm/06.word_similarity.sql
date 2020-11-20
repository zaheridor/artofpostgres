--Search song titles with the word 'peace'.
select artist, title
  from track
 where title %> 'peace';	--the operator %> uses the 'word_similarity' function, and takes into account that its left operand is a longer string, and its right operand is a single word to search.
