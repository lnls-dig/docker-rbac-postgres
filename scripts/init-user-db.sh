#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER rbac;
    CREATE DATABASE rbac;
    GRANT ALL PRIVILEGES ON DATABASE rbac TO rbac;
EOSQL
