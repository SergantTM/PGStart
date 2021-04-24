CREATE ROLE :USERNAME LOGIN;

ALTER ROLE :USERNAME PASSWORD :PWD;
alter role :USERNAME createrole;
ALTER ROLE :USERNAME SUPERUSER;

alter role dbsa SUPERUSER;
CREATE ROLE alfa_user;
ALTER ROLE alfa_user WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS VALID UNTIL 'infinity';
CREATE ROLE rlf_connect_hrms;
ALTER ROLE rlf_connect_hrms WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS VALID UNTIL 'infinity';
CREATE ROLE tst_etalon;
ALTER ROLE tst_etalon WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md5735ecc440562b71f5937fb5d5e679e8f';
CREATE ROLE oracle_user;
ALTER ROLE oracle_user WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS VALID UNTIL 'infinity';
CREATE ROLE slr_user;
ALTER ROLE slr_user WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS VALID UNTIL 'infinity';
GRANT slr_user TO rlf_connect_hrms;
GRANT alfa_user TO rlf_connect_hrms;
GRANT oracle_user TO rlf_connect_hrms;
GRANT rlf_connect_hrms TO sysadm;
CREATE ROLE adm LOGIN ENCRYPTED PASSWORD 'adm' SUPERUSER INHERIT CREATEDB CREATEROLE NOREPLICATION;
CREATE ROLE nsi LOGIN ENCRYPTED PASSWORD 'nsi' SUPERUSER INHERIT CREATEDB CREATEROLE NOREPLICATION;
CREATE ROLE migrator LOGIN ENCRYPTED PASSWORD 'migrator' SUPERUSER INHERIT CREATEDB CREATEROLE NOREPLICATION;
GRANT rlf_connect_hrms TO adm;
GRANT rlf_connect_hrms TO nsi;
GRANT rlf_connect_hrms TO migrator;
GRANT alfa_user TO adm;
GRANT alfa_user TO nsi;
GRANT alfa_user TO migrator;

CREATE DATABASE :NEWDBNAME WITH OWNER = :USERNAME;

\connect :NEWDBNAME

MAC CCR ON tablespace pg_default IS OFF;

CREATE TABLESPACE :INDEXTABLESPACE OWNER postgres LOCATION :INDEXDIR;
MAC CCR ON tablespace :INDEXTABLESPACE IS OFF;

grant ALL PRIVILEGES ON TABLESPACE :INDEXTABLESPACE to :USERNAME;

MAC LABEL on schema pg_toast IS '{0,0}';
MAC LABEL on schema pg_temp_1 IS '{0,0}';
MAC LABEL on schema pg_toast_temp_1 IS '{0,0}';
MAC LABEL on schema pg_catalog IS '{0,0}';
MAC LABEL on schema public IS '{255,FFFFFFFFFFFFFFFF}';
MAC LABEL on schema information_schema IS '{0,0}';

MAC CCR ON LANGUAGE internal IS OFF;
MAC CCR ON LANGUAGE c IS OFF;
MAC CCR ON LANGUAGE sql IS OFF;
MAC CCR ON LANGUAGE plpgsql IS OFF;

MAC CCR on database :DBNAME IS OFF;

grant select on all tables in schema pg_catalog to :USERNAME;
grant execute on all functions in schema pg_catalog to :USERNAME;

\connect :NEWDBNAME :USERNAME

create extension dblink;
create extension hstore;
CREATE EXTENSION pg_background;
CREATE EXTENSION orafce SCHEMA public VERSION "3.3";
CREATE EXTENSION "uuid-ossp";

alter function pg_catalog.numeric_eq(numeric,numeric) LEAKPROOF;
alter function pg_catalog.numeric_ne(numeric,numeric) LEAKPROOF;
alter function pg_catalog.numeric_lt(numeric,numeric) LEAKPROOF;
alter function pg_catalog.numeric_le(numeric,numeric) LEAKPROOF;
alter function pg_catalog.numeric_gt(numeric,numeric) LEAKPROOF;
alter function pg_catalog.numeric_ge(numeric,numeric) LEAKPROOF;

