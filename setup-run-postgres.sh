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
./run-postgres.sh ${NET_NAME} ${DNS_IP} ${POSTGRES_PORT} ${POSTGRES_USER} ${POSTGRES_PASSWORD} \
    ${RBAC_DOCKER_IMAGE_NAME} ${RBAC_DOCKER_VOLUME} ${RBAC_DOCKER_IMAGE_NAME} ${LOCAL_POSTGRES_PORT}
