#!/bin/bash
URL=$1

# parse URL
# postgres://username:password@server:port/dbname
username=`echo $URL | sed 's/.*:\/\/\([^:]*\):\([^@]*\)@\([^:/]*\):\([0-9]*\)\/\(.*\)/\1/'`
password=`echo $URL | sed 's/.*:\/\/\([^:]*\):\([^@]*\)@\([^:/]*\):\([0-9]*\)\/\(.*\)/\2/'`
server=`  echo $URL | sed 's/.*:\/\/\([^:]*\):\([^@]*\)@\([^:/]*\):\([0-9]*\)\/\(.*\)/\3/'`
port=`    echo $URL | sed 's/.*:\/\/\([^:]*\):\([^@]*\)@\([^:/]*\):\([0-9]*\)\/\(.*\)/\4/'`
dbname=`  echo $URL | sed 's/.*:\/\/\([^:]*\):\([^@]*\)@\([^:/]*\):\([0-9]*\)\/\(.*\)/\5/'`

# connect
PGPASSWORD=$password psql -h $server -p $port $dbname $username
