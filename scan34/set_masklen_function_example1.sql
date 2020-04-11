--se the set_masklen() function which allows us to transforms an IP address into an arbitrary CIDR network address.
select distinct on (ip)
       ip,
       set_masklen(ip, 24) as inet_24,
       set_masklen(ip::cidr, 24) as cidr_24
  from access_log
 limit 10;