#!/usr/bin/env bash

set -o errexit
set -o pipefail

cmd="$@"

# the official postgres image uses 'postgres' as default user if not set explictly.
if [ -z "$POSTGRES_USER" ]; then
    export POSTGRES_USER=postgres
fi

function postgres_ready() {
python << END
import os
import sys

import psycopg2

try:
    conn = psycopg2.connect(
        dbname=os.environ['POSTGRES_USER'],
        user=os.environ['POSTGRES_USER'],
        password=os.environ['POSTGRES_USER'],
        port=os.environ['POSTGRES_PORT'],
        host='postgres',
    )
except psycopg2.OperationalError:
    sys.exit(-1)
sys.exit(0)
END
}

until postgres_ready; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - continuing..."

export PYTHONPATH=${PYTHONPATH}:${PROJECT_ROOT}

exec ${cmd}
