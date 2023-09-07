#!/bin/bash

set -eu -o pipefail

tanzu plugin source init

# tanzu plugin install --target k8s secret
# tanzu plugin install --target k8s package

tanzu plugin install --group vmware-tap/default:v1.6.2
