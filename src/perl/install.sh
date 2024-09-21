#!/bin/bash
set -euo pipefail

echo "Activating feature 'perl' (local_lib=$LOCAL_LIB)"

DEBIAN_PACKAGES=( perl          cpanminus   liblocal-lib-perl libio-socket-ssl-perl build-essential perl-doc )
ALPINE_PACKAGES=( perl perl-app-cpanminus perl-local-lib    perl-io-socket-ssl      build-base      perl-doc )

# shellcheck source=/dev/null
source /etc/os-release

case "${ID}" in
    debian|ubuntu)
        export DEBIAN_FRONTEND=noninteractive
        if ! dpkg -s "${DEBIAN_PACKAGES[@]}" >/dev/null 2>&1; then
            [ "$( find /var/lib/apt/lists/* | wc -l )" = "0" ] && apt-get update -y
            apt install -y "${DEBIAN_PACKAGES[@]}"
            rm -rf /var/lib/apt/lists/*
        fi
    ;;
    alpine)
        if ! apk -e info "${ALPINE_PACKAGES[@]}" >/dev/null 2>&1; then
            apk add --no-cache "${ALPINE_PACKAGES[@]}"
        fi
    ;;
esac

function _local_lib_bashrc {
    test -d "$1"
    grep -q -- '-Mlocal::lib' "$1/.bashrc" || echo "eval \"\$(perl -I\$HOME/perl5/lib/perl5 -Mlocal::lib)\"" >>"$1/.bashrc"
}
if [ "$LOCAL_LIB" = "true" ]; then
    _local_lib_bashrc "$_REMOTE_USER_HOME"
    _local_lib_bashrc "$_CONTAINER_USER_HOME"
fi

echo "Done!"