#!/usr/bin/env bash

set -a
set -e
set -u

SERVICE="$1"

. ./env-vars.sh ${SERVICE}

# Create volume container
docker create -v /var/lib/postgresql/data --name ${RBAC_DOCKER_VOLUME} \
    --net ${NET_NAME} --dns ${DNS_IP} postgres 2>/dev/null || true
