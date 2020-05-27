select jsonb_pretty(data)
  from magic.detail
 where data @> '{"language":"Spanish"}';