#!/usr/bin/env bash

set -a
set -e
set -u

SERVICE="$1"

# Source env vars
. ./env-vars.sh ${SERVICE}

# Build postgres
./build.sh ${SERVICE}

# Create docker network
./create-net.sh ${NET_NAME}

# Create volume
./build-volume-postgres.sh ${SERVICE}

# Run postgres
./run-postgres.sh ${SERVICE}
