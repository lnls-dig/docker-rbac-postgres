#!/usr/bin/env bash

set -a
set -e
set -u

NET_NAME="$1"
DNS_IP="$2"
POSTGRES_PORT="$3"
POSTGRES_USER="$4"
POSTGRES_PASSWORD="$5"
RBAC_DOCKER_IMAGE_NAME="$6"

# Run postgres
docker run --name ${RBAC_DOCKER_IMAGE_NAME}-psql --net ${NET_NAME} --dns ${DNS_IP} \
    -e POSTGRES_USER=${POSTGRES_USER} \
    -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
    -it postgres psql -h ${RBAC_DOCKER_IMAGE_NAME} -U ${POSTGRES_USER}
