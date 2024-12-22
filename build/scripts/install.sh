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

    curl -sfo "${zip}" "${prefix}/terraria-server-${TERRARIA_VERSION//./}.zip" || \
        return 1

    stage="$(mktemp -d)"
    unzip "${zip}" -d "${stage}" || return 1
    mv --force "${stage}/${TERRARIA_VERSION//./}/Linux" "/opt/terraria"

    rm -rf "${zip}" "${stage}"

    return 0
}

main() {
    unpack || return 1

    touch -a "/opt/terraria/banlist.txt"
    chmod +x "/opt/terraria/TerrariaServer.bin.x86_64"

    printf '%s\n' "${TERRARIA_VERSION//./}" > "/opt/terraria/terraria-version.txt"
}

main
