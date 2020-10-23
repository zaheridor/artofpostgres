--trigger to save modification after updating artist.
begin;

create function moma.audit()
  returns trigger
  language plpgsql
as $$
begin
  INSERT INTO moma.audit(before, after)
       SELECT hstore(old), hstore(new);
  return new;
end;
$$;

create trigger audit
      after update on moma.artist
          for each row
 execute procedure audit();

commit;
