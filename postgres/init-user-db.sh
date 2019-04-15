#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username postgres <<-EOSQL
    CREATE ROLE demouser WITH PASSWORD 'DemoPa$$';
    ALTER ROLE demouser WITH LOGIN;
    CREATE DATABASE demodb;
    GRANT ALL PRIVILEGES ON DATABASE demodb TO demouser;
EOSQL
