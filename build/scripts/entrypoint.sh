#!/usr/bin/env bash

set_pw() {
    local pw

    if [[ -n "${SERVER_PASSWORD}" ]]; then
        pw="${SERVER_PASSWORD}"
    elif [[ -n "${SERVER_PASSWORD_FILE}" ]]; then
        read -r pw < "${SERVER_PASSWORD_FILE}"
    fi

    [[ -z "${pw}" ]] && return 0
    if grep -q '^password' "${1}"; then
        sed -i "s/^password=.*/password=${pw}" "${1}"
    else
        printf 'password=%s\n' "${pw}" >> "${1}"
    fi

    return 0
}

main() {
    local cfg
    cfg="${TERRARIA_DIR}/server-config.conf"

    set_pw "${cfg}"

    "${TERRARIA_DIR}/TerrariaServer.bin.x86_64" \
        -config "${cfg}" \
        "${@}"
}

main "${@}"
