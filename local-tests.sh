#!/bin/bash
set -euxo pipefail
cd "$( dirname "${BASH_SOURCE[0]}" )"

devcontainer features test --base-image mcr.microsoft.com/devcontainers/base:ubuntu
devcontainer features test --base-image mcr.microsoft.com/devcontainers/base:alpine
devcontainer features test --base-image mcr.microsoft.com/devcontainers/base:ubuntu --remote-user root
devcontainer features test --base-image mcr.microsoft.com/devcontainers/base:alpine --remote-user root

echo "### All Done! ###"