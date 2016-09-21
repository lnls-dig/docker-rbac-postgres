#!/usr/bin/env bash

SERVICE="$1"

# Default variables
#NET_NAME="postgres-rbac-auth-services"
NET_NAME="dockerrbaccomposed_postgres-rbac"
DNS_IP="10.0.0.72"
POSTGRES_PORT=5432
LOCAL_POSTGRES_PORT=5432
POSTGRES_USER="rbac"
POSTGRES_PASSWORD="rbac"
RBAC_SERVICE_NAME=auth-services-postgres
RBAC_DOCKER_ORG_NAME=lnls
RBAC_DOCKER_RUN_NAME=rbac-auth-services-db
RBAC_DOCKER_IMAGE_NAME=docker-${RBAC_DOCKER_RUN_NAME}-postgres

RBAC_DOCKER_VOLUME=rbac-auth-services-postgres-volume


if [ "${SERVICE}" == "rbac" ]; then
    RBAC_SERVICE_NAME=auth-services-postgres
    RBAC_DOCKER_ORG_NAME=lnls
    RBAC_DOCKER_RUN_NAME=rbac-auth-services-db
    RBAC_DOCKER_IMAGE_NAME=docker-${RBAC_DOCKER_RUN_NAME}-postgres
    RBAC_DOCKER_VOLUME=rbac-auth-services-postgres-volume
    LOCAL_POSTGRES_PORT=5433
else
    echo "Unsupported service"
    exit 1
fi
