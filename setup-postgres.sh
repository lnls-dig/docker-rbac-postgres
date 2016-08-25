#!/usr/bin/env bash

set -a
set -e
set -u

NET_NAME="$1"
DNS_IP="$2"

# Build image
./build.sh

# Create docker network
./create-net.sh ${NET_NAME}

# Create postres container volume
./build-volume-postgres.sh ${NET_NAME} ${DNS_IP}
