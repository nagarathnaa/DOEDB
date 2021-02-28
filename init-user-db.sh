#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "dev_ops_app" < dump_27_2_2021.pgsql