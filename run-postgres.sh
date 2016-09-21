#!/usr/bin/env bash

set -a
set -e
set -u

SERVICE="$1"

. ./env-vars.sh ${SERVICE}

# Run postgres_user
docker run  --name ${RBAC_DOCKER_IMAGE_NAME} --net ${NET_NAME} --dns ${DNS_IP} \
    -p ${LOCAL_POSTGRES_PORT}:${POSTGRES_PORT} -e POSTGRES_USER=${POSTGRES_USER} \
    -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
    -d --volumes-from ${RBAC_DOCKER_VOLUME} ${RBAC_DOCKER_ORG_NAME}/${RBAC_DOCKER_IMAGE_NAME}
