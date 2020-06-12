--updating user and nickname with returning clause.
begin;

   update tweet.users
      set nickname = 'Robin Goodfellow'
    where userid = 17 and uname = 'Puck'
returning users.*;

   update tweet.users
      set nickname = case when uname ~ ' '
                          then substring(uname from '[^ ]* (.*)')
                          else uname
                      end
    where nickname is null
returning users.*;

commit;