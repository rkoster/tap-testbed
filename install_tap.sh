#!/bin/bash

set -eu -o pipefail

source .creds

pushd catalog

export REGISTRY_USERNAME=admin    # default username for the local registry
export REGISTRY_PASSWORD=admin    # default password for the local registry

export REGISTRY_REPOSITORY=test   # irrelevant for local registry, `test` is good
export REGISTRY_SERVER=$(./hack/local-cluster/ip.py):5000

make tap
