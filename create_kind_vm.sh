#!/bin/bash

set -eu -o pipefail

limactl start --tty=false \
        --name kind \
        --set='.cpus = 8 | .memory = "12GiB" | .disk = "100Gib" | .dns = ["1.1.1.1"] | .hostResolver.enabled = false' \
        template://docker-rootful || true

docker context rm -f kind || true
docker context create kind --docker "host=unix://${HOME}/.lima/kind/sock/docker.sock"
docker context use kind

pushd catalog

make localcluster
