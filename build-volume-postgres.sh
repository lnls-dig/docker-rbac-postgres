#!/usr/bin/env bash

set -a
set -e
set -u

NET_NAME="$1"
DNS_IP="$2"
RBAC_DOCKER_VOLUME="$3"

# Create volume container
docker create -v /var/lib/postgresql/data --name ${RBAC_DOCKER_VOLUME} \
    --net ${NET_NAME} --dns ${DNS_IP} postgres 2>/dev/null || true
