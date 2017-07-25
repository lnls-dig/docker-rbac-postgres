#!/usr/bin/env bash

set -a
set -e
set -u

SERVICE="$1"

. ./env-vars.sh ${SERVICE}

# Create volume container
docker volume create ${RBAC_DOCKER_VOLUME}
docker create -v ${RBAC_DOCKER_VOLUME}:/var/lib/postgresql/data --name ${RBAC_DOCKER_VOLUME} \
    --net ${NET_NAME} --dns ${DNS_IP} postgres:9.5.4 2>/dev/null || true
