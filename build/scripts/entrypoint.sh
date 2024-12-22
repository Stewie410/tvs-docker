#!/usr/bin/env bash

ls -lA /opt/terraria
/opt/terraria/TerrariaServer.bin.x86_64 \
    -config "/opt/terraria/server-config.conf" \
    -port "7777" \
    "${@}" \
    ;
