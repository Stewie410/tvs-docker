#!/usr/bin/env bash

curl -sfL 'https://terraria.wiki.gg/wiki/Server#Downloads' | \
    sed -n '/Terraria Server/s/^.*Terraria Server \([0-9\.]*\)<.*$/\1/p' | \
    sed 1q
