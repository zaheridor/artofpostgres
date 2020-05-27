#! /usr/bin/env python3

import psycopg2

PGCONNSTRING = "user=postgres dbname=postgres application_name=magic"

if __name__ == '__main__':
    pgconn = psycopg2.connect(PGCONNSTRING)
    curs = pgconn.cursor()

    allset = open('StandardCards.json').read()
    allset = allset.replace("'", "''")
    sql = "insert into magic.allsets(data) values('%s')" % allset

    curs.execute(sql)
    pgconn.commit()
    pgconn.close()
