--following lovers.
insert into tweet.follower
     select users.userid as follower,
            f.userid as following
       from      tweet.users
            join tweet.users f
              on f.uname = substring(users.bio from 'in love with #?(.*).')
      where users.bio ~ 'in love with';

--fllowing king and queen.
with fairies as
(
  select userid
    from tweet.users
   where bio ~ '#Fairies'
)
insert into tweet.follower(follower, following)
     select fairies.userid as follower,
            users.userid as following
       from fairies cross join tweet.users
      where users.bio ~ 'of the fairies';

commit;