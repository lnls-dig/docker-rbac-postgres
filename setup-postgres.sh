#!/usr/bin/env bash

set -a
set -e
set -u

NET_NAME="$1"
DNS_IP="$2"
RBAC_DOCKER_VOLUME="$3"

# Build image
./build.sh ${RBAC_DOCKER_IMAGE_NAME}

# Create docker network
./create-net.sh ${NET_NAME}

# Create postres container volume
./build-volume-postgres.sh ${NET_NAME} ${DNS_IP} ${RBAC_DOCKER_VOLUME}
