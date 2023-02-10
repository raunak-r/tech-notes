****CHANGE DATABASE IN DJANGO TO SOMETHING ELSE ex. POSTGRESQL
> Install postgres app
> pip install postgres //will also install psycopg2
> pip install psycopg2-binary
> brew install postgres //for psql

## Running it in WSL
> sudo /etc/init.d/postgresql start
OR
> sudo service postgresql start
> sudo -u postgres psql

## To CHECK for the status
> service postgresql status
LINUX IN GENERAL
> service <service_name> status
> service --status-all

## INSIDE PSQL, See CONNECTION INFO
> \conninfo
    You are connected to database "postgres" as user "postgres" via socket in "/var/run/postgresql" at port "5432".
> \c
  You are now connected to database "postgres" as user "postgres".
> select session_user, current_user;

https://stackoverflow.com/questions/39735141/how-to-check-connected-user-on-psql
https://medium.com/@harshityadav95/postgresql-in-windows-subsystem-for-linux-wsl-6dc751ac1ff3

## SEE CURRENT, CREATE NEW, CHANGE DATABASES;
>  SELECT current_database();
> \l - to see all db's

> CREATE DATABASE <db_name>;
> \connect DBNAME;

## CREATE USER
sudo -u postgres createuser <username>
$ sudo -u postgres psql
psql=# alter user <username> with encrypted password '<password>';
psql=# grant all privileges on database <dbname> to <username>;

## SEE TABLES, DATABASES
> \dt =to see tables in psql
> \du = to see all users in psql
> \d+ tablename //to see the schema
> .schema tablename //sqlite3
> \q =to quit

## AWS Helper
```
psql \
   --host=<host> \
   --port=5432 \
   --username=postgres \
   --password \
   --dbname=postgres 

select schema_name
from information_schema.schemata;

DROP SCHEMA IF EXISTS public CASCADE; 
CREATE SCHEMA IF NOT EXISTS public;
```
