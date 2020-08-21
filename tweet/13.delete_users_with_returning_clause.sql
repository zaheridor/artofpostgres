--Inserting characters from other plays and then deleting them using the returning clause.

--PART A
insert into tweet.users (uname, bio)
     values ('CLAUDIUS', 'king of Denmark.'),
            ('HAMLET', 'son to the late, and nephew to the present king'),
            ('POLONIUS', 'lord chamberlain.'),
            ('HORATIO', 'friend to Hamlet'),
            ('LAERTES', 'son to Polonius'),
            ('LUCIANUS', 'nephew to the king');

--PART B
begin;

   delete
     from tweet.users
    where userid = 30 and uname = 'CLAUDIUS'
returning *;

commit;

--PART C
begin;

with deleted_rows as
(
    delete
      from tweet.users
     where not exists
           (
             select 1
               from tweet.message
              where userid = users.userid
           )
 returning *
)
select min(userid), max(userid),
       count(*),
       array_agg(uname)
  from deleted_rows;

commit;