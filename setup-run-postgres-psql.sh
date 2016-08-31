#!/usr/bin/env bash

set -a
set -e
set -u

SERVICE="$1"

# Source env vars
. ./env-vars.sh ${SERVICE}

# Setup postgres
./setup-postgres.sh ${NET_NAME} ${DNS_IP} ${RBAC_DOCKER_VOLUME}

# Run postgres
./run-postgres-psql.sh ${NET_NAME} ${DNS_IP} ${POSTGRES_PORT} ${POSTGRES_USER} ${POSTGRES_PASSWORD} \
    ${RBAC_DOCKER_IMAGE_NAME}
