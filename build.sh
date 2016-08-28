#!/usr/bin/env bash

set -a
set -u
set -e

# Change this if your Host have a "sane" DNS like 168.192.1.1
OPTNAMESERVER="echo nameserver 10.0.0.71 > /etc/resolv.conf \&\& \\\\"
#OPTNAMESERVER="\\\\"

sed -e "s|OPTNAMESERVER|${OPTNAMESERVER}|g" \
    Dockerfile.ini > Dockerfile

docker build -t lerwys/docker-rbac-postgres .
