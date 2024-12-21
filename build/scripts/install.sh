#!/usr/bin/env bash

latest() {
    curl -sfL 'https://terraria.wiki.gg/wiki/Server#Downloads' | \
        sed -n '/Terraria Server/s/^.*Terraria Server \([0-9\.]*\)<.*$/\1/p' | \
        sed 1q
}

unpack() {
    local zip prefix stage
    zip="$(mktemp)"
    prefix="https://terraria.org/api/download/pc-dedicated-server"

    curl -sfo "${zip}" "${prefix}/terraria-server-${TERRARIA_VERSION}.zip" || \
        return 1

    stage="$(mktemp -d)"
    unzip "${zip}" -d "${stage}" || return 1
    find "${stage}/${TERRARIA_VERSION}/Linux" \
        -mindepth 1 \
        -exec mv {} "/opt/terraria/" \
        \;

    rm -rf "${zip}" "${stage}"

    return 0
}

main() {
    if [[ "${TERRARIA_VERSION:=latest}" == "latest" ]]; then
        TERRARIA_VERSION="$(latest)"
        printf 'Using latest Terraria version: %s\n' "${TERRARIA_VERSION}"
    fi

    export TERRARIA_VERSION="${TERRARIA_VERSION//./}"
    printf '%s\n' "${TERRARIA_VERSION}" > "/opt/terraria/terraria-version.txt"
    unpack
}

main
